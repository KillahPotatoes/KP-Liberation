scriptName "civinfo_escort";

params ["_informant"];

if (isDedicated) exitWith {};

if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort called on: %1 - Parameters: [%2]", debug_source, _informant], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

waitUntil {sleep 0.5; || !alive _informant};
if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort line 11"], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

if (alive _informant) then {
    private _capturedPlayer = _informant getVariable ["KPLIB_prisonner_whois", objNull];
    if (_CapturedPlayer == objNull) then {
        private _players = allPlayers;
        private _nearestPlayer = objNull;
        private _minDistance = 100;
        {
            private _distance = _informant distance _x;
            if (_distance < _minDistance) then {
                _minDistance = _distance;
                _nearestPlayer = _x;
            };
        } forEach _players;
        _CapturedPlayer = _nearestPlayer;
    };
    [[_informant], group _capturedPlayer] remoteExecCall ["joinSilent"];
    if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort line 27"], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

    if (KPLIB_ace) then {
        private _isCuffed = _informant getVariable ["ace_captives_isHandcuffed", false];
        if !(_isCuffed) then {
            ["ace_captives_setSurrendered", [_informant, false], _informant] call CBA_fnc_targetEvent;
        };
    } else {
        _informant setCaptive false;
        _informant enableAI "ANIM";
        _informant enableAI "MOVE";
        sleep 1;
        _informant playmove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
        sleep 2;
    };
    doStop _informant;
    _informant doFollow _capturedPlayer;
    if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort line 43"], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
};

private _is_near_fob = false;
waitUntil {
    sleep 5;
    private _nearestfob = [getPos _informant] call KPLIB_fnc_getNearestFob;
    _is_near_fob = false;
    if (count _nearestfob == 3) then {
        _is_near_fob = ((_informant distance _nearestfob) < 30);
    };
    !alive _informant || (_is_near_fob && (vehicle _informant == _informant))
};

if (alive _informant) then {
    if (_is_near_fob) then {
        sleep 5;
        private _grp = createGroup [KPLIB_side_civilian, true];
        [_informant] joinSilent _grp;
        if (KPLIB_ace) then {
            private _isCuffed = _informant getVariable ["ace_captives_isHandcuffed", false];
            if (_isCuffed) then {
                ["ace_captives_setHandcuffed", [_informant, false], _informant] call CBA_fnc_targetEvent;
            } else {
                ["ace_captives_setSurrendered", [_informant, false], _informant] call CBA_fnc_targetEvent;
            };
            sleep 1;
        };
        _informant playmove "AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground";
        _informant disableAI "ANIM";
        _informant disableAI "MOVE";
        sleep 5;
        [_informant, "AidlPsitMstpSnonWnonDnon_ground00"] remoteExecCall ["switchMove"];
        [_informant] remoteExec ["civinfo_delivered",2];
        if (KPLIB_civinfo_debug > 0) then {["civinfo_escort -> Informant at FOB", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
        _informant setVariable ["KPLIB_civinfo_under_control", false, true];
        sleep 600;
        if (isNull objectParent _informant) then {deleteVehicle _informant} else {(objectParent _informant) deleteVehicleCrew _informant};
        if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort finished by: %1", debug_source], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
    };
} else {
    if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_escort exited by: %1 - Informant isn't alive", debug_source], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
    [3] remoteExec ["civinfo_notifications"];
};
