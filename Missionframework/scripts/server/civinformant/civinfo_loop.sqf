scriptName "civinfo_loop";

waitUntil {sleep 10; ({_x in KPLIB_sectors_city || _x in KPLIB_sectors_capital} count KPLIB_sectors_player) > 0};

if (KPLIB_civinfo_debug > 0) then {[format ["Loop spawned on: %1", debug_source], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

while {true} do {
    uiSleep (KPLIB_civinfo_min + round (random (KPLIB_civinfo_max - KPLIB_civinfo_min)));

    if (KPLIB_civinfo_debug > 0) then {["Informant sleep passed", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

    waitUntil {
        sleep 10;
        ({_x in KPLIB_sectors_city || _x in KPLIB_sectors_capital} count KPLIB_sectors_player) > 0 &&
        KPLIB_civ_rep >= 25
    };

    if (KPLIB_civinfo_debug > 0) then {["Informant waitUntil search city passed", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

    if ((KPLIB_civinfo_chance >= (random 100)) && KPLIB_endgame == 0) then {
        private _sector = selectRandom (KPLIB_sectors_player select {_x in KPLIB_sectors_city || _x in KPLIB_sectors_capital});
        private _houses = [];
        private _grp = createGroup [KPLIB_side_civilian, true];
        private _informant = [selectRandom KPLIB_c_units, markerPos _sector, _grp] call KPLIB_fnc_createManagedUnit;
        private _waiting_time = KPLIB_civinfo_duration;
        
        _houses = (nearestObjects [[((markerPos _sector select 0) - 100 + (random 200)), ((markerPos _sector select 1) - 100 + (random 200))],["House", "Building"], 100]);
        if (count _houses == 0) then {
            _randomPos = ((markerPos _sector) getPos [random 150, random 360]) findEmptyPosition [3, 150, KPLIB_b_crateAmmo];
            if (count _randomPos == 0) then {_randomPos = [(markerPos _sector select 0),(markerPos _sector select 1),0];};
            _informant setPos _randomPos;
        } else {
            _house = selectRandom _houses;
            _informant setPos (selectRandom (_house buildingPos -1));
        };
        _informant setUnitPos "UP";
        sleep 1;
        
        if (KPLIB_ace) then {
            ["ace_captives_setSurrendered", [_informant, true], _informant] call CBA_fnc_targetEvent;
        } else {
            _informant disableAI "ANIM";
            _informant disableAI "MOVE";
            _informant playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
            sleep 2;
            _informant setCaptive true;
        };
        _informant setVariable ["KPLIB_prisonner_surrendered", true, true];

        if (KPLIB_civinfo_debug > 0) then {[format ["Informant %1 spawned on: %2 - Position: %3", name _informant, debug_source, getPos _informant], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

        [0, [((((getPos _informant) select 0) + 35) - random 70),((((getPos _informant) select 1) + 35) - random 70),0]] remoteExec ["civinfo_notifications"];

        // Time-based despawn
        private _time_start = time;
        private _player_not_near = true;
        while {
            (alive _informant && ((time - _time_start) < _waiting_time))
        } do {
            uiSleep 1;
            
            private _isCaptured = _informant getVariable ["KPLIB_prisonner_captured", false];
            private _isCuffed = _informant getVariable ["ace_captives_isHandcuffed", false];
            if (_isCaptured || _isCuffed) exitWith {};
            
            if (KPLIB_ace) then {
                private _isSurrendering = _informant getVariable ["ace_captives_isSurrendering", false];
                if !(_isSurrendering) then {
                    ["ace_captives_setSurrendered", [_informant, true], _informant] call CBA_fnc_targetEvent;
                };
            };
            
            _player_not_near = true;
            {
                if (((_x distance _informant) < 150) && (alive _x)) exitWith {_player_not_near = false};
            } foreach allPlayers;
            
            if (_player_not_near) then {
                _waiting_time = _waiting_time - 1;
                if ((KPLIB_civinfo_debug > 0) && ((_waiting_time % 60) == 0)) then {
                    [format ["Informant will despawn in %1 minutes", round (_waiting_time / 60)], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];
                };
            };
        };
        if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_loop Countdown exit"], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
        
        private _timeover = false;
        if ((time - _time_start) > _waiting_time) then {
            _timeover = true;
            if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_loop Countdown TimeOver!"], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
        };
        
        private _isCaptured = _informant getVariable ["KPLIB_prisonner_captured", false];
        private _isCuffed = _informant getVariable ["ace_captives_isHandcuffed", false];
        if (_isCaptured || _isCuffed) then {
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
            
            private _capturedPlayer = _informant getVariable ["KPLIB_prisonner_whois", objNull];
            if (isNull _capturedPlayer) then {
                private _players = allPlayers;
                private _nearestPlayer = player;
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
            if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_loop civilian joined to group: %1", name _capturedPlayer], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
            doStop _informant;
            _informant doFollow _capturedPlayer;

            [_informant] remoteExec ["civinfo_escort"];
            [7, [0,0,0], _capturedPlayer] remoteExec ["civinfo_notifications"];
            _informant setVariable ["KPLIB_civinfo_under_control", true, true];
        };
        
        waitUntil {!alive _informant || _timeover || !(_informant getVariable ["KPLIB_civinfo_under_control", false])};
        
        if (!(_informant getVariable ["KPLIB_civinfo_under_control", false]) && _timeover) exitWith {
            if (isNull objectParent _informant) then {deleteVehicle _informant} else {(objectParent _informant) deleteVehicleCrew _informant};
            if (KPLIB_civinfo_debug > 0) then {["Informant despawned", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
            [2] remoteExec ["civinfo_notifications"];
        };
        if (!(_informant getVariable ["KPLIB_civinfo_under_control", false]) && !alive _informant) exitWith {
            if (KPLIB_civinfo_debug > 0) then {[format ["civinfo_loop is reset by: %1 - Informant isn't alive", debug_source], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
            [3] remoteExec ["civinfo_notifications"];
        };
    } else {
        if (KPLIB_civinfo_debug > 0) then {["Informant spawn chance missed", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
    };
};
