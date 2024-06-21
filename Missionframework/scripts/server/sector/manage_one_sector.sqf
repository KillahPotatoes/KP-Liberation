scriptName "manage_one_sector";
// base amount of sector lifetime tickets
// if there are no enemies one ticket is removed every SECTOR_TICK_TIME seconds
// 12 * 5 = 60s by default
#define BASE_TICKETS                12
#define SECTOR_TICK_TIME            5
// delay in minutes from which addional time will be added
#define ADDITIONAL_TICKETS_DELAY    5

params ["_sector"];

waitUntil {!isNil "KPLIB_enemyReadiness"};

[format ["Sector %1 (%2) activated - Managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];

private _sectorpos = markerPos _sector;
private _stopit = false;
private _spawncivs = false;
private _building_ai_max = 0;
private _infsquad = "army";
private _building_range = 50;
private _local_capture_size = KPLIB_range_sectorCapture;
private _iedcount = 0;
private _vehtospawn = [];
private _managed_units = [];
private _squad1 = [];
private _squad2 = [];
private _squad3 = [];
private _squad4 = [];
private _minimum_building_positions = 5;
private _sector_despawn_tickets = BASE_TICKETS;
private _maximum_additional_tickets = (KPLIB_param_maxDespawnDelay * 60 / SECTOR_TICK_TIME);
private _popfactor = 1;
private _guerilla = false;
private _lambsEnable = false;

if (isNil "KPLIB_o_turrets_HMG") then {KPLIB_o_turrets_HMG = ["Turret_Array_Empty"];};
if (isNil "KPLIB_o_turrets_GMG") then {KPLIB_o_turrets_GMG = ["Turret_Array_Empty"];};
if (isNil "KPLIB_o_turrets_AT") then {KPLIB_o_turrets_AT = ["Turret_Array_Empty"];};
if (isNil "KPLIB_o_turrets_AA") then {KPLIB_o_turrets_AA = ["Turret_Array_Empty"];};
if (isNil "KPLIB_o_turrets_MORTAR") then {KPLIB_o_turrets_MORTAR = ["Turret_Array_Empty"];};
if (isClass (configfile >> "CfgPatches" >> "lambs_wp")) then {_lambsEnable = true;};

if (KPLIB_param_unitcap < 1) then {_popfactor = KPLIB_param_unitcap;};

if (_sector in KPLIB_sectors_active) exitWith {};
KPLIB_sectors_active pushback _sector; publicVariable "KPLIB_sectors_active";

private _opforcount = [] call KPLIB_fnc_getOpforCap;
[_sector, _opforcount] call wait_to_spawn_sector;

if ((!(_sector in KPLIB_sectors_player)) && (([markerPos _sector, [_opforcount, _sector] call KPLIB_fnc_getSectorRange, KPLIB_side_player] call KPLIB_fnc_getUnitsCount) > 0)) then {

    if (_sector in KPLIB_sectors_capital) then {
        if (KPLIB_enemyReadiness < 30) then {_infsquad = "militia";};

        _squad1 = ([_infsquad] call KPLIB_fnc_getSquadComp);
        _squad2 = ([_infsquad] call KPLIB_fnc_getSquadComp);
        if (KPLIB_param_unitcap >= 1) then {_squad3 = ([_infsquad] call KPLIB_fnc_getSquadComp);};
        if (KPLIB_param_unitcap >= 1.5) then {_squad4 = ([_infsquad] call KPLIB_fnc_getSquadComp);};

        _vehtospawn = [(selectRandom KPLIB_o_militiaVehicles),(selectRandom KPLIB_o_militiaVehicles),(selectRandom KPLIB_o_turrets_HMG)];
        if ((random 100) > (66 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);};
        if ((random 100) > (50 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);};
        if ((random 100) > (66 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};
        if ((random 100) > (50 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_AT);};
        if (_infsquad == "army") then {
            _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
            _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
            _vehtospawn pushback (selectRandom KPLIB_o_turrets_AT);
            if ((random 100) > (33 / KPLIB_param_difficulty)) then {_vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);};
            if ((random 100) > (33 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_AA);};
            if ((random 100) > (33 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_GMG);};
        };

        _spawncivs = true;

        if (((random 100) <= KPLIB_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
            _guerilla = true;
        };

        _building_ai_max = round (50 * _popfactor);
        _building_range = 200;
        _local_capture_size = _local_capture_size * 1.4;

        if (KPLIB_civ_rep < 0) then {
            _iedcount = round (2 + (ceil (random 4)) * (round ((KPLIB_civ_rep * -1) / 33)) * KPLIB_param_difficulty);
        } else {
            _iedcount = 0;
        };
        if (_iedcount > 16) then {_iedcount = 16};
    };

    if (_sector in KPLIB_sectors_city) then {
        if (KPLIB_enemyReadiness < 50) then {_infsquad = "militia";};

        _squad1 = ([_infsquad] call KPLIB_fnc_getSquadComp);
        if (KPLIB_param_unitcap >= 1.25) then {_squad2 = ([_infsquad] call KPLIB_fnc_getSquadComp);};

        if ((random 100) > (66 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);};
        if ((random 100) > (33 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);};
        if ((random 100) > (33 / KPLIB_param_difficulty)) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};
        if (KPLIB_enemyReadiness > 50) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};
        if (_infsquad == "army") then {
            _vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);
            _vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);
            if ((random 100) > (33 / KPLIB_param_difficulty)) then {
                _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
                _vehtospawn pushback (selectRandom KPLIB_o_turrets_AT);
                _squad3 = ([_infsquad] call KPLIB_fnc_getSquadComp);
            };
        };

        _spawncivs = true;

        if (((random 100) <= KPLIB_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
            _guerilla = true;
        };

        _building_ai_max = round ((floor (18 + (round (KPLIB_enemyReadiness / 10 )))) * _popfactor);
        _building_range = 120;

        if (KPLIB_civ_rep < 0) then {
            _iedcount = round ((ceil (random 4)) * (round ((KPLIB_civ_rep * -1) / 33)) * KPLIB_param_difficulty);
        } else {
            _iedcount = 0;
        };
        if (_iedcount > 12) then {_iedcount = 12};
    };

    if (_sector in KPLIB_sectors_military) then {
        _squad1 = ([] call KPLIB_fnc_getSquadComp);
        _squad2 = ([] call KPLIB_fnc_getSquadComp);
        if (KPLIB_param_unitcap >= 1.5) then {_squad3 = ([] call KPLIB_fnc_getSquadComp);};

        _vehtospawn = [([] call KPLIB_fnc_getAdaptiveVehicle),([] call KPLIB_fnc_getAdaptiveVehicle),(selectRandom KPLIB_o_turrets_HMG),(selectRandom KPLIB_o_turrets_AT),(selectRandom KPLIB_o_turrets_MORTAR)];
        if ((random 100) > (33 / KPLIB_param_difficulty)) then {
            _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
            _vehtospawn pushback ((selectRandom KPLIB_o_turrets_HMG));
            _vehtospawn pushback ((selectRandom KPLIB_o_turrets_MORTAR));
            _squad4 = ([] call KPLIB_fnc_getSquadComp);
        };
        if ((random 100) > (66 / KPLIB_param_difficulty)) then {
            _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
            _vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);
            _vehtospawn pushback ((selectRandom KPLIB_o_turrets_GMG));
            _vehtospawn pushback ((selectRandom KPLIB_o_turrets_AA));
        };

        _spawncivs = false;

        _building_ai_max = round ((floor (18 + (round (KPLIB_enemyReadiness / 4 )))) * _popfactor);
        _building_range = 120;
    };

    if (_sector in KPLIB_sectors_factory) then {
        if (KPLIB_enemyReadiness < 40) then {_infsquad = "militia";};

        _squad1 = ([_infsquad] call KPLIB_fnc_getSquadComp);
        if (KPLIB_param_unitcap >= 1.25) then {_squad2 = ([_infsquad] call KPLIB_fnc_getSquadComp);};

        if ((random 100) > 66) then {_vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);};
        if ((random 100) > 33) then {_vehtospawn pushback (selectRandom KPLIB_o_militiaVehicles);};
        if ((random 100) > 33) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};
        if (KPLIB_enemyReadiness > 50) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};

        _spawncivs = false;

        if (((random 100) <= KPLIB_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
            _guerilla = true;
        };

        _building_ai_max = round ((floor (18 + (round (KPLIB_enemyReadiness / 10 )))) * _popfactor);
        _building_range = 120;

        if (KPLIB_civ_rep < 0) then {
            _iedcount = round ((ceil (random 3)) * (round ((KPLIB_civ_rep * -1) / 33)) * KPLIB_param_difficulty);
        } else {
            _iedcount = 0;
        };
        if (_iedcount > 8) then {_iedcount = 8};
    };

    if (_sector in KPLIB_sectors_tower) then {
        _squad1 = ([] call KPLIB_fnc_getSquadComp);
        if (KPLIB_enemyReadiness > 30) then {_squad2 = ([] call KPLIB_fnc_getSquadComp);};
        if (KPLIB_param_unitcap >= 1.5) then {_squad3 = ([] call KPLIB_fnc_getSquadComp);};

        if((random 100) > 95) then {_vehtospawn pushback ([] call KPLIB_fnc_getAdaptiveVehicle);};
        if (KPLIB_enemyReadiness > 50) then {_vehtospawn pushback (selectRandom KPLIB_o_turrets_HMG);};

        _spawncivs = false;

        _building_ai_max = 0;
    };

    _vehtospawn = _vehtospawn select {!(isNil "_x")};

    if (KPLIB_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - manage_one_sector calculated -> _infsquad: %3 - _squad1: %4 - _squad2: %5 - _squad3: %6 - _squad4: %7 - _vehtospawn: %8 - _building_ai_max: %9", (markerText _sector), _sector, _infsquad, (count _squad1), (count _squad2), (count _squad3), (count _squad4), (count _vehtospawn), _building_ai_max], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};

    if (_building_ai_max > 0 && KPLIB_param_adaptive) then {
        _building_ai_max = round (_building_ai_max * ([] call KPLIB_fnc_getOpforFactor));
    };

    {
        if (_x isEqualTo "Turret_Array_Empty") exitWith {};
        _vehicle = [_sectorpos, _x] call KPLIB_fnc_spawnVehicle;
        if ((_x in KPLIB_o_turrets_MORTAR) && _lambsEnable) then {
            [group ((crew _vehicle) select 0)] call lambs_wp_fnc_taskArtilleryRegister;
        };
        [group ((crew _vehicle) select 0),_sectorpos] spawn add_defense_waypoints;
        _managed_units pushback _vehicle;
        {_managed_units pushback _x;} foreach (crew _vehicle);
        sleep 0.25;
    } forEach _vehtospawn;

    if (_building_ai_max > 0) then {
        _allbuildings = (nearestObjects [_sectorpos, ["House"], _building_range]) select {alive _x};
        _buildingpositions = [];
        {
            _buildingpositions = _buildingpositions + ([_x] call BIS_fnc_buildingPositions);
        } forEach _allbuildings;
        if (KPLIB_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - manage_one_sector found %3 building positions", (markerText _sector), _sector, (count _buildingpositions)], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};
        if (count _buildingpositions > _minimum_building_positions) then {
            _managed_units = _managed_units + ([_infsquad, _building_ai_max, _buildingpositions, _sector] call KPLIB_fnc_spawnBuildingSquad);
        };
    };

    _managed_units = _managed_units + ([_sectorpos] call KPLIB_fnc_spawnMilitaryPostSquad);

    if (count _squad1 > 0) then {
        _grp = [_sector, _squad1] call KPLIB_fnc_spawnRegularSquad;
        [_grp, _sectorpos] spawn add_defense_waypoints;
        _managed_units = _managed_units + (units _grp);
    };

    if (count _squad2 > 0) then {
        _grp = [_sector, _squad2] call KPLIB_fnc_spawnRegularSquad;
        [_grp, _sectorpos] spawn add_defense_waypoints;
        _managed_units = _managed_units + (units _grp);
    };

    if (count _squad3 > 0) then {
        _grp = [_sector, _squad3] call KPLIB_fnc_spawnRegularSquad;
        [_grp, _sectorpos] spawn add_defense_waypoints;
        _managed_units = _managed_units + (units _grp);
    };

    if (count _squad4 > 0) then {
        _grp = [_sector, _squad4] call KPLIB_fnc_spawnRegularSquad;
        [_grp, _sectorpos] spawn add_defense_waypoints;
        _managed_units = _managed_units + (units _grp);
    };

    if (_spawncivs && KPLIB_param_civActivity > 0) then {
        _managed_units = _managed_units + ([_sector] call KPLIB_fnc_spawnCivilians);
    };

    if (KPLIB_asymmetric_debug > 0) then {[format ["Sector %1 (%2) - Range: %3 - Count: %4", (markerText _sector), _sector, _building_range, _iedcount], "ASYMMETRIC"] remoteExecCall ["KPLIB_fnc_log", 2];};
    [_sector, _building_range, _iedcount] spawn ied_manager;

    if (_guerilla) then {
        [_sector] spawn sector_guerilla;
    };

    sleep 10;

    if ((_sector in KPLIB_sectors_factory) || (_sector in KPLIB_sectors_city) || (_sector in KPLIB_sectors_capital) || (_sector in KPLIB_sectors_military)) then {
        [_sector] remoteExec ["reinforcements_remote_call",2];
    };

    if (KPLIB_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - populating done", (markerText _sector), _sector], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};

    private _activationTime = time;
    // sector lifetime loop
    while {!_stopit} do {
        // sector was captured
        if (([_sectorpos, _local_capture_size] call KPLIB_fnc_getSectorOwnership == KPLIB_side_player) && (KPLIB_endgame == 0)) then {
            if (isServer) then {
                [_sector] spawn sector_liberated_remote_call;
            } else {
                [_sector] remoteExec ["sector_liberated_remote_call",2];
            };

            _stopit = true;

            {
                if (captive _x) then {
                    [_x, true] spawn prisonner_ai;
                } else {
                    [_x] spawn prisonner_ai;
                };
            } forEach ((markerPos _sector) nearEntities [["CAManBase"], _local_capture_size * 1.2]);
            
            sleep 60;

            KPLIB_sectors_active = KPLIB_sectors_active - [_sector]; publicVariable "KPLIB_sectors_active";

            sleep 600;

            {
                if (_x isKindOf "CAManBase") then {
                    if (side group _x != KPLIB_side_player) then {
                        if (isNull objectParent _x) then {deleteVehicle _x} else {(objectParent _x) deleteVehicleCrew _x};
                    };
                } else {
                    if (!isNull _x) then {
                        [_x] call KPLIB_fnc_cleanOpforVehicle;
                    };
                };
            } forEach _managed_units;
        } else {
          if (([_sectorpos, (([_opforcount, _sector] call KPLIB_fnc_getSectorRange) + 300), KPLIB_side_player] call KPLIB_fnc_getUnitsCount) == 0) then {
                _sector_despawn_tickets = _sector_despawn_tickets - 1;
            } else {
                // start counting running minutes after ADDITIONAL_TICKETS_DELAY
                private _runningMinutes = (floor ((time - _activationTime) / 60)) - ADDITIONAL_TICKETS_DELAY;
                private _additionalTickets = (_runningMinutes * BASE_TICKETS);

                // clamp from 0 to "_maximum_additional_tickets"
                _additionalTickets = (_additionalTickets max 0) min _maximum_additional_tickets;

                _sector_despawn_tickets = BASE_TICKETS + _additionalTickets;
            };

            if (_sector_despawn_tickets <= 0) then {
                {
                    if (_x isKindOf "CAManBase") then {
                        if (isNull objectParent _x) then {deleteVehicle _x} else {(objectParent _x) deleteVehicleCrew _x};
                    } else {
                        if (!isNull _x) then {
                            [_x] call KPLIB_fnc_cleanOpforVehicle;
                        };
                    };
                } forEach _managed_units;

                _stopit = true;
                KPLIB_sectors_active = KPLIB_sectors_active - [_sector]; publicVariable "KPLIB_sectors_active";
            };
        };
        sleep SECTOR_TICK_TIME;
    };
} else {
    sleep 40;
    KPLIB_sectors_active = KPLIB_sectors_active - [_sector]; publicVariable "KPLIB_sectors_active";
};

[format ["Sector %1 (%2) deactivated - Was managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
