params ["_unit", ["_force_surrender", false]];

if ((!_force_surrender) && ((random 100) > GRLIB_surrender_chance)) exitWith {};

if ((_unit isKindOf "Man") && (alive _unit) && (side group _unit == GRLIB_side_enemy)) then {

    if (vehicle _unit != _unit) then {deleteVehicle _unit};

    sleep (random 5);

    if (alive _unit) then {
        removeAllWeapons _unit;
        if (typeof _unit != pilot_classname) then {
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
        private _grp = createGroup [GRLIB_side_civilian, true];
        [_unit] joinSilent _grp;
        if (KP_liberation_ace) then {
            ["ace_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
        } else {
            _unit disableAI "ANIM";
            _unit disableAI "MOVE";
            _unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
            sleep 2;
            _unit setCaptive true;
        };
        /*ALLOW PLAYERS TO INTEROGATE UNITS IN THE FIELD - kinda ugly should probably do this proper some day */
        _unit addAction ["interrogate in the field and release. (gives less intel)", {
            params ["_target", "_caller", "_actionId", "_arguments"];
            private _unit = _target;
            resources_intel = resources_intel + 2;
            stats_prisoners_captured = stats_prisoners_captured + 1;
            [0] remoteExec ["remote_call_intel"];
            if (alive _unit) then {
                if (KP_liberation_ace) then {
                    ["ace_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
                } else {
                    _unit enableAI "ANIM";
                    _unit enableAI "move";
                    _unit setCaptive false;
                };
            };
            private _grp = creategroup [civilian, true];
            [_unit] joinSilent _grp;
            _unit setunitPos "UP";
            _unit setCaptive false;
            null = _unit spawn {
                private _unit = _this;
                while (alive _unit) do
                {
                    _unit addWaypoint [position _unit,5000,0];
                    sleep 120;
                    if (count (allPlayers select {_unit distance _x < 300}) == 0) then
                    {
                        deleteVehicle _unit;
                    };
                };
            };
        },
        nil,
        1.5,
        true,
        true,
        "",
        "_this distance _target < 5"
        ];
        waitUntil {sleep 1;
            !alive _unit || side group _unit == GRLIB_side_friendly
        };

        if (alive _unit) then {
            if (KP_liberation_ace) then {
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
