params ["_unit", "_killer"];



    if (KPLIB_kill_debug > 0) then {[format ["Kill Manager executed - _unit: %1 (%2) - _killer: %3 (%4)", typeOf _unit, _unit, typeOf _killer, _killer], "KILL"] call KPLIB_fnc_log;};


    // Failsafe if something gets killed before the save manager is finished
    if (isNil "infantry_weight") then {infantry_weight = 33};
    if (isNil "armor_weight") then {armor_weight = 33};
    if (isNil "air_weight") then {air_weight = 33};

    // BLUFOR Killer handling
    if ((side _killer) == KPLIB_side_player) then {

        // Increase combat readiness for kills near a capital.
        private _nearby_bigtown = KPLIB_sectors_capital select {!(_x in KPLIB_sectors_player) && (_unit distance (markerpos _x) < 250)};
        if (count _nearby_bigtown > 0) then {
            KPLIB_enemyReadiness = KPLIB_enemyReadiness + (0.5 * KPLIB_param_difficulty);
            stats_readiness_earned = stats_readiness_earned + (0.5 * KPLIB_param_difficulty);
            if (KPLIB_enemyReadiness > 100.0 && KPLIB_param_difficulty < 2) then {KPLIB_enemyReadiness = 100.0};
        };

        // Weights adjustments depending on what vehicle the BLUFOR killer used
        if (_killer isKindOf "CAManBase") then {
            infantry_weight = infantry_weight + 1;
            armor_weight = armor_weight - 0.66;
            air_weight = air_weight - 0.66;
        } else {
            if ((toLowerANSI (typeOf (vehicle _killer))) in KPLIB_allLandVeh_classes) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight + 1;
                air_weight = air_weight - 0.66;
            };
            if ((toLowerANSI (typeOf (vehicle _killer))) in KPLIB_allAirVeh_classes) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight - 0.66;
                air_weight = air_weight + 1;
            };
        };

        // Keep within ranges
        infantry_weight = 0 max (infantry_weight min 100);
        armor_weight = 0 max (armor_weight min 100);
        air_weight = 0 max (air_weight min 100);
    };

    // Player was killed
    if (isPlayer _unit) then {
        stats_player_deaths = stats_player_deaths + 1;
        // Disconnect UAV from player on death
        _unit connectTerminalToUAV objNull;
        // Eject Player from vehicle
        if (vehicle _unit != _unit) then {moveOut _unit;};
    };

    // Check for Man or Vehicle
    if (_unit isKindOf "CAManBase") then {

        // OPFOR casualty
        if (side (group _unit) == KPLIB_side_enemy) then {
            // Killed by BLUFOR
            if (side _killer == KPLIB_side_player) then {
                stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
            };

            // Killed by a player
            if (isplayer _killer) then {
                stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
            };
        };

        // BLUFOR casualty
        if (side (group _unit) == KPLIB_side_player) then {
            stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;

            // Killed by BLUFOR
            if (side _killer == KPLIB_side_player) then {
                stats_blufor_teamkills = stats_blufor_teamkills + 1;
            };
        };

        // Resistance casualty
        if (side (group _unit) == KPLIB_side_resistance) then {
            KPLIB_guerilla_strength = KPLIB_guerilla_strength - 1;
            stats_resistance_killed = stats_resistance_killed + 1;

            // Resistance is friendly to BLUFOR
            if ((KPLIB_side_player getFriend KPLIB_side_resistance) >= 0.6) then {

                // Killed by BLUFOR
                if (side _killer == KPLIB_side_player) then {
                    if (KPLIB_asymmetric_debug > 0) then {[format ["Guerilla unit killed by: %1", name _killer], "ASYMMETRIC"] call KPLIB_fnc_log;};
                    [3, [(name _unit)]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                    stats_resistance_teamkills = stats_resistance_teamkills + 1;
                    [KPLIB_cr_resistance_penalty, true] spawn F_cr_changeCR;
                };

                // Killed by a player
                if (isplayer _killer) then {
                    stats_resistance_teamkills_by_players = stats_resistance_teamkills_by_players + 1;
                };
            };
        };

        // Civilian casualty
        if (side (group _unit) == KPLIB_side_civilian) then {
            stats_civilians_killed = stats_civilians_killed + 1;

            // Killed by BLUFOR
            if (side _killer == KPLIB_side_player) then {
                if (KPLIB_civrep_debug > 0) then {[format ["Civilian killed by: %1", name _killer], "CIVREP"] call KPLIB_fnc_log;};
                [2, [(name _unit), (name _killer)]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                [KPLIB_cr_kill_penalty, true] spawn F_cr_changeCR;
            };

            // Killed by a player
            if (isPlayer _killer) then {
                stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;
            };
        };
    } else {
        // Enemy vehicle casualty
        if ((toLowerANSI (typeof _unit)) in KPLIB_o_allVeh_classes) then {
            stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;

            // Destroyed by player
            if (isplayer _killer) then {
                stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;
            };
        } else {
            // Civilian vehicle casualty
            if (typeOf _unit in KPLIB_c_vehicles) then {
                stats_civilian_vehicles_killed = stats_civilian_vehicles_killed + 1;

                // Destroyed by player
                if (isplayer _killer) then {
                    stats_civilian_vehicles_killed_by_players = stats_civilian_vehicles_killed_by_players + 1;
                };
            } else {
                // It has to be a BLUFOR vehicle then
                stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
            };
        };
    };

    // Body/wreck cleanup
    if (!isPlayer _unit) then {
        [{
            params ["_unit"];
            if (_unit isKindOf "CAManBase") exitWith {
                hideBody _unit;
            };
            deleteVehicle _unit;
        }, [_unit], KPLIB_cleanup_delay] call CBA_fnc_waitAndExecute;
    };
