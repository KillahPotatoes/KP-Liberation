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

    if (KPLIB_civinfo_debug > 0) then {["Informant waitUntil passed", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

    if ((KPLIB_civinfo_chance >= (random 100)) && KPLIB_endgame == 0) then {
        private _sector = selectRandom (KPLIB_sectors_player select {_x in KPLIB_sectors_city || _x in KPLIB_sectors_capital});
        private _house = (nearestObjects [[((markerPos _sector select 0) - 100 + (random 200)), ((markerPos _sector select 1) - 100 + (random 200))],["House", "Building"], 100]) select 0;

        private _grp = createGroup [KPLIB_side_civilian, true];
        private _informant = [selectRandom KPLIB_c_units, markerPos _sector, _grp] call KPLIB_fnc_createManagedUnit;
        private _waiting_time = KPLIB_civinfo_duration;

        _informant setPos (selectRandom (_house buildingPos -1));
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

        if (KPLIB_civinfo_debug > 0) then {[format ["Informant %1 spawned on: %2 - Position: %3", name _informant, debug_source, getPos _informant], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};

        [0, [((((getPos _informant) select 0) + 200) - random 400),((((getPos _informant) select 1) + 200) - random 400),0]] remoteExec ["civinfo_notifications"];

        while {alive _informant && ((side (group _informant)) == KPLIB_side_civilian) && _waiting_time > 0} do {
            uiSleep 1;
            private _player_near = false;
            {
                if (((_x distance _informant) < 150) && (alive _x)) exitWith {_player_near = true};
            } foreach allPlayers;

            if !(_player_near) then {
                _waiting_time = _waiting_time - 1;
            };

            if ((KPLIB_civinfo_debug > 0) && ((_waiting_time % 60) == 0)) then {[format ["Informant will despawn in %1 minutes", round (_waiting_time / 60)], "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
        };

        if (_waiting_time > 0) then {
            if (alive _informant) then {
                if (KPLIB_ace) then {
                    ["ace_captives_setSurrendered", [_informant, false], _informant] call CBA_fnc_targetEvent;
                } else {
                    _informant enableAI "ANIM";
                    _informant enableAI "MOVE";
                };
                sleep 1;
                [_informant] remoteExec ["civinfo_escort"];
            } else {
                if (KPLIB_civinfo_debug > 0) then {["Informant is dead", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
                [3] remoteExec ["civinfo_notifications"];
            };
        } else {
            deleteVehicle _informant;
            if (KPLIB_civinfo_debug > 0) then {["Informant despawned", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
            [2] remoteExec ["civinfo_notifications"];
        };
    } else {
        if (KPLIB_civinfo_debug > 0) then {["Informant spawn chance missed", "CIVINFO"] remoteExecCall ["KPLIB_fnc_log", 2];};
    };
};
