params ["_unit", ["_force_surrender", false]];

if ((!_force_surrender) && ((random 100) > KPLIB_surrender_chance)) exitWith {};


if ((_force_surrender) || ((side group _unit == KPLIB_side_enemy) && (_unit isKindOf "CAManBase") && (alive _unit))) then {

    if (!isNull objectParent _unit) then {objectParent _unit deleteVehicleCrew _unit};

    sleep (random 5);

    if (alive _unit) then {

        removeAllWeapons _unit;
        if (typeof _unit != KPLIB_b_heliPilotUnit) then {
            removeHeadgear _unit;
        };
        removeBackpack _unit;
        removeVest _unit;
        _unit unlinkItem hmd _unit;
        _unit setUnitPos "UP";
        sleep 1;
        private _grp = createGroup [KPLIB_side_enemy, true];
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
                _unit setCaptive false;
                _unit enableAI "ANIM";
                _unit enableAI "MOVE";
                sleep 1;
                _unit playmove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
                sleep 2;
            };
            sleep 1;
            [_unit] remoteExec ["remote_call_prisonner", _unit];
        };
    };
};
