params ["_unit", ["_force_surrender", false]];

// define who do not surrender
if ((!_force_surrender) && ((random 100) > KPLIB_surrender_chance)) exitWith {};

if ((side group _unit == KPLIB_side_enemy) && (_unit isKindOf "CAManBase") && (alive _unit)) then {

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
        _unit setVariable ["KPLIB_prisonner_surrendered", true, true];

        if (KPLIB_ace) then {
            ["ace_captives_setSurrendered", [_unit, true], _unit] call CBA_fnc_targetEvent;
        } else {
            _unit disableAI "ANIM";
            _unit disableAI "MOVE";
            _unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
            sleep 2;
            _unit setCaptive true;
        };
        waitUntil {
            sleep 1;
            private _isCaptured = _unit getVariable ["KPLIB_prisonner_captured", false];
            private _isCuffed = _unit getVariable ["ace_captives_isHandcuffed", false];
            !alive _unit || _isCaptured || _isCuffed
        };

        if (alive _unit) then {
            private _CapturedPlayer = _unit getVariable ["KPLIB_prisonner_whois", objNull];
            if (_CapturedPlayer == objNull) then {
                private _players = allPlayers;
                private _nearestPlayer = objNull;
                private _minDistance = 100;
                {
                    private _distance = _unit distance _x;
                    if (_distance < _minDistance) then {
                        _minDistance = _distance;
                        _nearestPlayer = _x;
                    };
                } forEach _players;
                _CapturedPlayer = _nearestPlayer;
            };
            [[_unit], group _CapturedPlayer] remoteExecCall ["joinSilent"];
            if (KPLIB_ace) then {
                private _isCuffed = _unit getVariable ["ace_captives_isHandcuffed", false];
                if (_isCuffed) then {
                    _unit setVariable ["KPLIB_prisonner_captured", true, true];
                } else {
                    ["ace_captives_setSurrendered", [_unit, false], _unit] call CBA_fnc_targetEvent;
                };
            } else {
                _unit setCaptive false;
                _unit enableAI "ANIM";
                _unit enableAI "MOVE";
                sleep 1;
                _unit playmove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
                sleep 2;
                [_unit, ""] remoteExecCall ["switchMove"];
            };
            sleep 1;
            doStop _unit;
            _unit doFollow _CapturedPlayer;
            [_unit] remoteExec ["remote_call_prisonner", _unit];
        };
    };
};