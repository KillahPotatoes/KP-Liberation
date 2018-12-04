params ["_sector"];

waitUntil {!isNil "combat_readiness"};

if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - manage_one_sector spawned on: %3 - time: %4", (markerText _sector), _sector, debug_source, time];_text remoteExec ["diag_log",2];};

private _sectorpos = getmarkerpos _sector;
private _stopit = false;
private _spawncivs = false;
private _building_ai_max = 0;
private _infsquad = "militia";
private _building_range = 50;
private _local_capture_size = GRLIB_capture_size;
private _iedcount = 0;
private _vehtospawn = [];
private _managed_units = [];
private _squad1 = [];
private _squad2 = [];
private _squad3 = [];
private _squad4 = [];
private _minimum_building_positions = 5;
private _sector_despawn_tickets = 12;
private _popfactor = 1;
private _guerilla = false;

if (GRLIB_unitcap < 1) then {_popfactor = GRLIB_unitcap;};

if (isNil "active_sectors") then {active_sectors = []};
if (_sector in active_sectors) exitWith {};
active_sectors pushback _sector; publicVariable "active_sectors";

private _opforcount = [] call F_opforCap;
[_sector, _opforcount] call wait_to_spawn_sector;

if ((!(_sector in blufor_sectors)) && (([getmarkerpos _sector, [_opforcount] call F_getCorrectedSectorRange, GRLIB_side_friendly] call F_getUnitsCount) > 0)) then {

	if (_sector in sectors_bigtown) then {	
		if (combat_readiness > 30) then {_infsquad = "army";};
		
		_squad1 = ([_infsquad] call F_getAdaptiveSquadComp);
		_squad2 = ([_infsquad] call F_getAdaptiveSquadComp);
		if (GRLIB_unitcap >= 1) then {_squad3 = ([_infsquad] call F_getAdaptiveSquadComp);};
		if (GRLIB_unitcap >= 1.5) then {_squad4 = ([_infsquad] call F_getAdaptiveSquadComp);};

		_vehtospawn = [(selectRandom militia_vehicles),(selectRandom militia_vehicles)];
		if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback (selectRandom militia_vehicles);};
		if ((random 100) > (50 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback (selectRandom militia_vehicles);};
		if (_infsquad == "army") then {
			_vehtospawn pushback ([] call F_getAdaptiveVehicle);
			_vehtospawn pushback ([] call F_getAdaptiveVehicle);
			if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback ([] call F_getAdaptiveVehicle);};
		};
		
		_spawncivs = true;

		if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call F_cr_getMulti) > 0)) then {
			_guerilla = true;
		};

		_building_ai_max = round (50 * _popfactor);
		_building_range = 200;
		_local_capture_size = _local_capture_size * 1.4;
		
		if (KP_liberation_civ_rep < 0) then {
			_iedcount = round (2 + (ceil (random 4)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
		} else {
			_iedcount = 0;
		};
		if (_iedcount > 16) then {_iedcount = 16};
	};

	if (_sector in sectors_capture) then {
		if (combat_readiness > 50) then {_infsquad = "army";};
		
		_squad1 = ([_infsquad] call F_getAdaptiveSquadComp);
		if (GRLIB_unitcap >= 1.25) then {_squad2 = ([_infsquad] call F_getAdaptiveSquadComp);};
		
		if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback (selectRandom militia_vehicles);};
		if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback (selectRandom militia_vehicles);};
		if (_infsquad == "army") then {
			_vehtospawn pushback (selectRandom militia_vehicles);
			if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {
				_vehtospawn pushback ([] call F_getAdaptiveVehicle);
				_squad3 = ([_infsquad] call F_getAdaptiveSquadComp);
			};
		};
		
		_spawncivs = true;

		if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call F_cr_getMulti) > 0)) then {
			_guerilla = true;
		};
		
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 120;
		
		if (KP_liberation_civ_rep < 0) then {
			_iedcount = round ((ceil (random 4)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
		} else {
			_iedcount = 0;
		};
		if (_iedcount > 12) then {_iedcount = 12};
	};

	if (_sector in sectors_military) then {
		_infsquad = "army";
		
		_squad1 = ([_infsquad] call F_getAdaptiveSquadComp);
		_squad2 = ([_infsquad] call F_getAdaptiveSquadComp);
		if (GRLIB_unitcap >= 1.5) then {_squad3 = ([_infsquad] call F_getAdaptiveSquadComp);};
		
		_vehtospawn = [([] call F_getAdaptiveVehicle),([] call F_getAdaptiveVehicle)];
		if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {
			_vehtospawn pushback ([] call F_getAdaptiveVehicle);
			_squad4 = ([_infsquad] call F_getAdaptiveSquadComp);
		};
		if ((random 100) > (66 / GRLIB_difficulty_modifier)) then {_vehtospawn pushback ([] call F_getAdaptiveVehicle);};
		
		_spawncivs = false;
		
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 4 )))) * _popfactor);
		_building_range = 120;
	};

	if (_sector in sectors_factory) then {
		if (combat_readiness > 40) then {_infsquad = "army";};
		
		_squad1 = ([_infsquad] call F_getAdaptiveSquadComp);
		if (GRLIB_unitcap >= 1.25) then {_squad2 = ([_infsquad] call F_getAdaptiveSquadComp);};

		if ((random 100) > 66) then {_vehtospawn pushback ([] call F_getAdaptiveVehicle);};
		if ((random 100) > 33) then {_vehtospawn pushback (selectRandom militia_vehicles);};
		
		_spawncivs = false;

		if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call F_cr_getMulti) > 0)) then {
			_guerilla = true;
		};
		
		_building_ai_max = round ((floor (18 + (round (combat_readiness / 10 )))) * _popfactor);
		_building_range = 120;
		
		if (KP_liberation_civ_rep < 0) then {
			_iedcount = round ((ceil (random 3)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
		} else {
			_iedcount = 0;
		};
		if (_iedcount > 8) then {_iedcount = 8};
	};

	if (_sector in sectors_tower) then {
		_infsquad = "army";

		_squad1 = ([_infsquad] call F_getAdaptiveSquadComp);
		if (combat_readiness > 30) then {_squad2 = ([_infsquad] call F_getAdaptiveSquadComp);};
		if (GRLIB_unitcap >= 1.5) then {_squad3 = ([_infsquad] call F_getAdaptiveSquadComp);};

		if((random 100) > 95) then {_vehtospawn pushback ([] call F_getAdaptiveVehicle);};

		_spawncivs = false;

		_building_ai_max = 0;
	};

	if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - manage_one_sector calculated -> _infsquad: %3 - _squad1: %4 - _squad2: %5 - _squad3: %6 - _squad4: %7 - _vehtospawn: %8 - _building_ai_max: %9", (markerText _sector), _sector, _infsquad, (count _squad1), (count _squad2), (count _squad3), (count _squad4), (count _vehtospawn), _building_ai_max];_text remoteExec ["diag_log",2];};

	if (_building_ai_max > 0 && GRLIB_adaptive_opfor) then {
		_building_ai_max = round (_building_ai_max * ([] call F_adaptiveOpforFactor));
	};

	{
		_vehicle = [_sectorpos, _x] call F_libSpawnVehicle;
		[group ((crew _vehicle) select 0),_sectorpos] spawn add_defense_waypoints;
		_managed_units pushback _vehicle;
		{_managed_units pushback _x;} foreach (crew _vehicle);
		sleep 0.25;
	} forEach _vehtospawn;

	if (_building_ai_max > 0) then {
		_allbuildings = [nearestObjects [_sectorpos, ["House"], _building_range], {alive _x}] call BIS_fnc_conditionalSelect;
		_buildingpositions = [];
		{
			_buildingpositions = _buildingpositions + ([_x] call BIS_fnc_buildingPositions);
		} forEach _allbuildings;
		if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - manage_one_sector found %3 building positions", (markerText _sector), _sector, (count _buildingpositions)];_text remoteExec ["diag_log",2];};
		if (count _buildingpositions > _minimum_building_positions) then {
			_managed_units = _managed_units + ([_infsquad, _building_ai_max, _buildingpositions, _sectorpos, _sector] call F_spawnBuildingSquad);
		};
	};

	_managed_units = _managed_units + ([_sectorpos] call F_spawnMilitaryPostSquad);

	if (count _squad1 > 0) then {
		_grp = [_sector, _squad1] call F_spawnRegularSquad;
		[_grp, _sectorpos] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if (count _squad2 > 0) then {
		_grp = [_sector, _squad2] call F_spawnRegularSquad;
		[_grp, _sectorpos] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if (count _squad3 > 0) then {
		_grp = [_sector, _squad3] call F_spawnRegularSquad;
		[_grp, _sectorpos] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if (count _squad4 > 0) then {
		_grp = [_sector, _squad4] call F_spawnRegularSquad;
		[_grp, _sectorpos] spawn add_defense_waypoints;
		_managed_units = _managed_units + (units _grp);
	};

	if (_spawncivs && GRLIB_civilian_activity > 0) then {
		_managed_units = _managed_units + ([_sector] call F_spawnCivilians);
	};

	if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Sector %1 (%2) - Range: %3 - Count: %4", (markerText _sector), _sector, _building_range, _iedcount];_text remoteExec ["diag_log",2];};
	[_sector, _building_range, _iedcount] spawn ied_manager;

	if (_guerilla) then {
		[_sector] spawn sector_guerilla;
	};

	sleep 10;

	if ((_sector in sectors_factory) || (_sector in sectors_capture) || (_sector in sectors_bigtown) || (_sector in sectors_military)) then {
		[_sector] remoteExec ["reinforcements_remote_call",2];
	};

	if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - populating done at %3", (markerText _sector), _sector, time];_text remoteExec ["diag_log",2];};

	while {!_stopit} do {
		if (([_sectorpos, _local_capture_size] call F_sectorOwnership == GRLIB_side_friendly) && (GRLIB_endgame == 0)) then {
			if (isServer) then {
				[_sector] spawn sector_liberated_remote_call;
			} else {
				[_sector] remoteExec ["sector_liberated_remote_call",2];
			};

			_stopit = true;

			{[_x] spawn prisonner_ai;} forEach ((getmarkerpos _sector) nearEntities [["Man"], _local_capture_size * 1.2]);

			sleep 60;

			active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";

			sleep 600;

			{
				if (_x isKindOf "Man") then {
					if (side group _x != GRLIB_side_friendly) then {
						deleteVehicle _x;
					};
				} else {
					[_x] call F_cleanOpforVehicle;
				};
			} forEach _managed_units;
		} else {
			if (([_sectorpos, (([_opforcount] call F_getCorrectedSectorRange) + 300), GRLIB_side_friendly] call F_getUnitsCount) == 0) then {
				_sector_despawn_tickets = _sector_despawn_tickets - 1;
			} else {
				_sector_despawn_tickets = 12;
			};

			if (_sector_despawn_tickets <= 0) then {
				{
					if (_x isKindOf "Man") then {
						deleteVehicle _x;
					} else {
						[_x] call F_cleanOpforVehicle;
					};
				} forEach _managed_units;

				_stopit = true;
				active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";
			};
		};
		sleep 5;
	};
} else {
	sleep 40;
	active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";
};

if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - manage_one_sector dropped on: %3", (markerText _sector), _sector, debug_source];_text remoteExec ["diag_log",2];};
