params ["_unit", ["_force_surrender", false]];

if ((!_force_surrender) && ((random 100) > KPLIB_surrender_chance)) exitWith {};

if ((_unit isKindOf "Man") && (alive _unit) && (side group _unit == KPLIB_side_enemy)) then {

    if (vehicle _unit != _unit) then {deleteVehicle _unit};

    sleep (random 5);

    if (alive _unit) then {

        removeAllWeapons _unit;
        if (typeof _unit != KPLIB_b_heliPilotUnit) then {
            removeHeadgear _unit;
        };
        removeBackpack _unit;
        removeVest _unit;
        _unit unassignItem "NVGoggles_OPFOR";
        _unit removeItem "NVGoggles_OPFOR";
        _unit unassignItem "NVGoggles_INDEP";
        _unit removeItem "NVGoggles_INDEP";
        _unit setUnitPos "UP";
        sleep 1;
        private _grp = createGroup [KPLIB_side_civilian, true];
        [_unit] joinSilent _grp;
        if (KPLIB_ace) then {
            ["ace_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
        } else {
            _unit disableAI "ANIM";
            _unit disableAI "MOVE";
            _unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
            sleep 2;
            _unit setCaptive true;
        };
        waitUntil {sleep 1;
            !alive _unit || side group _unit == KPLIB_side_player
        };

        if (alive _unit) then {
            if (KPLIB_ace) then {
                ["ace_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
            } else {
                _unit enableAI "ANIM";
                _unit enableAI "MOVE";
                _unit setCaptive false;
            };
            sleep 1;
            [_unit] remoteExec ["remote_call_prisonner", _unit];
        };
    };
};
