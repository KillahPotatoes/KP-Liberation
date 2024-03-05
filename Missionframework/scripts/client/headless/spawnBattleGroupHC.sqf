// Function to spawn battlegroup - moved to always spawn on a HC. Would likely require adaption if running without any headless clients 
params [
    ["_spawn_marker", "", [""]],
    ["_infOnly", false, [false]],
	["_combat_readiness", 0, [0]]
];

if !(_spawn_marker isEqualTo "") then {

    private _bg_groups = [];
    private _selected_opfor_battlegroup = [];
    private _target_size = (round (GRLIB_battlegroup_size * ([] call KPLIB_fnc_getOpforFactor) * (sqrt GRLIB_csat_aggressivity))) min 16; // is the param GRLIB_battlegroup_size & GRLIB_csat_aggressivity available on all clients? I assume it should be
    if (combat_readiness < 60) then {_target_size = round (_target_size * 0.65);};

    [_spawn_marker] remoteExec ["remote_call_battlegroup"];

    if (worldName in KP_liberation_battlegroup_clearance) then {
        [markerPos _spawn_marker, 15] call KPLIB_fnc_createClearance;
    };

    if (_infOnly) then {
        // Infantry units to choose from
        private _infClasses = [KPLIB_o_inf_classes, KPLIB_o_militiaInfantry] select (KPLIB_enemyReadiness < 50);

        // Adjust target size for infantry
        _target_size = 12 max (_target_size * 4);
        private _squadNumber = round (_target_size/8);

        for "_i" from 1 to _squadNumber do {
        // Create infantry groups with up to 8 units per squad
        private _grp = createGroup [kplib_side_enemy, true];
        for "_i" from 0 to 7 do {
            [selectRandom _infClasses, markerPos _spawn_marker, _grp] call KPLIB_fnc_createManagedUnit;
        };
        [_grp] call KPLIB_fnc_LAMBS_enableReinforcements;
        [_grp] call battlegroup_ai;
        _grp setVariable ["KPLIB_isBattleGroup",true];
        };
    } else {
        private _vehicle_pool = [opfor_battlegroup_vehicles, opfor_battlegroup_vehicles_low_intensity] select (combat_readiness < 50);

        while {count _selected_opfor_battlegroup < _target_size} do {
            _selected_opfor_battlegroup pushback (selectRandom _vehicle_pool);
        };

        private ["_nextgrp", "_vehicle"];
        {
            _nextgrp = createGroup [GRLIB_side_enemy, true];
            _vehicle = [markerpos _spawn_marker, _x] call KPLIB_fnc_spawnVehicle;

            sleep 0.5;

            (crew _vehicle) joinSilent _nextgrp;
            [_nextgrp] call battlegroup_ai;
            _nextgrp setVariable ["KPLIB_isBattleGroup",true];

            if ((_x in opfor_troup_transports) && ([] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap)) then {
                if (_vehicle isKindOf "Air") then {
                    [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective, _vehicle] spawn send_paratroopers;
                } else {
                    [_vehicle] spawn troup_transport;
                };
            };
        } forEach _selected_opfor_battlegroup;

        if (GRLIB_csat_aggressivity > 0.9) then {
            [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn spawn_air;
        };
    };
};
