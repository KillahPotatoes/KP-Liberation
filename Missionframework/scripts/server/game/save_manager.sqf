if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] save_manager.sqf started - time: %1", diag_tickTime];};

if (!(isNil "GRLIB_param_wipe_savegame_1") && !(isNil "GRLIB_param_wipe_savegame_2")) then {
	if (GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1) then {
		profileNamespace setVariable [GRLIB_save_key,nil];
		saveProfileNamespace;
		if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Save wiped";};
	} else {
		if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] No save wipe";};
	};
} else {
	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Wipe params where nil";};
};

date_year = date select 0;
date_month = date select 1;
date_day = date select 2;
blufor_sectors = [];
GRLIB_all_fobs = [];
buildings_to_save= [];
combat_readiness = 0;
KP_liberation_storages = [];
KP_liberation_production = [];
KP_liberation_logistics = [];
stats_opfor_soldiers_killed = 0;
stats_opfor_killed_by_players = 0;
stats_blufor_soldiers_killed = 0;
stats_player_deaths = 0;
stats_opfor_vehicles_killed = 0;
stats_opfor_vehicles_killed_by_players = 0;
stats_blufor_vehicles_killed = 0;
stats_blufor_soldiers_recruited = 0;
stats_blufor_vehicles_built = 0;
stats_civilians_killed = 0;
stats_civilians_killed_by_players = 0;
stats_sectors_liberated = 0;
stats_playtime = 0;
stats_spartan_respawns = 0;
stats_secondary_objectives = 0;
stats_hostile_battlegroups = 0;
stats_ieds_detonated = 0; publicVariable "stats_ieds_detonated";
stats_saves_performed = 0;
stats_saves_loaded = 0;
stats_reinforcements_called = 0;
stats_prisonners_captured = 0;
stats_blufor_teamkills = 0;
stats_vehicles_recycled = 0;
stats_ammo_spent = 0;
stats_sectors_lost = 0;
stats_fobs_built = 0;
stats_fobs_lost = 0;
stats_readiness_earned = 0;
infantry_weight = 33;
armor_weight = 33;
air_weight = 33;
GRLIB_vehicle_to_military_base_links = [];
GRLIB_permissions = [];
ai_groups = [];
resources_intel = 0;
GRLIB_player_scores = [];
KP_liberation_civ_rep = 0;
KP_liberation_cr_vehicles = [];
KP_liberation_production_markers = [];
KP_liberation_guerilla_strength = 0;

no_kill_handler_classnames = [FOB_typename, huron_typename];
private _classnames_to_save = [FOB_typename, huron_typename];
private _classnames_to_save_blu = [];
private _building_classnames = [FOB_typename];
{
	no_kill_handler_classnames pushback (_x select 0);
	_classnames_to_save pushback (_x select 0);
	_building_classnames pushback (_x select 0);
} foreach buildings;

{
	_classnames_to_save_blu pushback (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

_classnames_to_save = _classnames_to_save + _classnames_to_save_blu + all_hostile_classnames + civilian_vehicles;

trigger_server_save = false;
greuh_liberation_savegame = profileNamespace getVariable GRLIB_save_key;

if (!isNil "greuh_liberation_savegame") then {

	blufor_sectors = greuh_liberation_savegame select 0;
	GRLIB_all_fobs = greuh_liberation_savegame select 1;
	buildings_to_save = greuh_liberation_savegame select 2;
	time_of_day = greuh_liberation_savegame select 3;
	combat_readiness = greuh_liberation_savegame select 4;
	KP_liberation_storages = greuh_liberation_savegame select 5;
	KP_liberation_production = greuh_liberation_savegame select 6;
	KP_liberation_logistics = greuh_liberation_savegame select 7;

	if (count greuh_liberation_savegame > 8) then {
		_stats = greuh_liberation_savegame select 8;
		stats_opfor_soldiers_killed = _stats select 0;
		stats_opfor_killed_by_players = _stats select 1;
		stats_blufor_soldiers_killed = _stats select 2;
		stats_player_deaths = _stats select 3;
		stats_opfor_vehicles_killed = _stats select 4;
		stats_opfor_vehicles_killed_by_players = _stats select 5;
		stats_blufor_vehicles_killed = _stats select 6;
		stats_blufor_soldiers_recruited = _stats select 7;
		stats_blufor_vehicles_built = _stats select 8;
		stats_civilians_killed = _stats select 9;
		stats_civilians_killed_by_players = _stats select 10;
		stats_sectors_liberated = _stats select 11;
		stats_playtime = _stats select 12;
		stats_spartan_respawns = _stats select 13;
		stats_secondary_objectives = _stats select 14;
		stats_hostile_battlegroups = _stats select 15;
		stats_ieds_detonated = _stats select 16; publicVariable "stats_ieds_detonated";
		stats_saves_performed = _stats select 17;
		stats_saves_loaded = _stats select 18;
		stats_reinforcements_called = _stats select 19;
		stats_prisonners_captured = _stats select 20;
		stats_blufor_teamkills = _stats select 21;
		stats_vehicles_recycled = _stats select 22;
		stats_ammo_spent = _stats select 23;
		stats_sectors_lost = _stats select 24;
		stats_fobs_built = _stats select 25;
		stats_fobs_lost = _stats select 26;
		stats_readiness_earned = _stats select 27;
	};

	if (count greuh_liberation_savegame > 9) then {
		_weights = greuh_liberation_savegame select 9;
		infantry_weight = _weights select 0;
		armor_weight = _weights select 1;
		air_weight = _weights select 2;
	};

	if (count greuh_liberation_savegame > 10) then {
		GRLIB_vehicle_to_military_base_links = greuh_liberation_savegame select 10;
	};

	if (count greuh_liberation_savegame > 11) then {
		GRLIB_permissions = greuh_liberation_savegame select 11;
	};

	if (count greuh_liberation_savegame > 12) then {
		ai_groups = greuh_liberation_savegame select 12;
	};

	if (count greuh_liberation_savegame > 13) then {
		resources_intel = greuh_liberation_savegame select 13;
	};

	if (count greuh_liberation_savegame > 14) then {
		GRLIB_player_scores = greuh_liberation_savegame select 14;
	};

	if (count greuh_liberation_savegame > 15) then {
		KP_liberation_civ_rep = greuh_liberation_savegame select 15;
		if (KP_liberation_civ_rep <= -25) then {
			GRLIB_side_resistance setFriend [GRLIB_side_enemy, 1];
			GRLIB_side_enemy setFriend [GRLIB_side_resistance, 1];
			GRLIB_side_resistance setFriend [GRLIB_side_friendly, 0];
			GRLIB_side_friendly setFriend [GRLIB_side_resistance, 0];
		};
		if (KP_liberation_civ_rep > -25 && KP_liberation_civ_rep < 25) then {
			GRLIB_side_resistance setFriend [GRLIB_side_enemy, 1];
			GRLIB_side_enemy setFriend [GRLIB_side_resistance, 1];
			GRLIB_side_resistance setFriend [GRLIB_side_friendly, 1];
			GRLIB_side_friendly setFriend [GRLIB_side_resistance, 1];
		};
		if (KP_liberation_civ_rep >= 25) then {
			GRLIB_side_resistance setFriend [GRLIB_side_friendly, 1];
			GRLIB_side_friendly setFriend [GRLIB_side_resistance, 1];
			GRLIB_side_resistance setFriend [GRLIB_side_enemy, 0];
			GRLIB_side_enemy setFriend [GRLIB_side_resistance, 0];
		};
		if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] %1 getFriend %2: %3 - %1 getFriend %4: %5", GRLIB_side_resistance, GRLIB_side_enemy, (GRLIB_side_resistance getFriend GRLIB_side_enemy), GRLIB_side_friendly, (GRLIB_side_resistance getFriend GRLIB_side_friendly)];};
	};

	if (count greuh_liberation_savegame > 16) then {
		KP_liberation_production_markers = greuh_liberation_savegame select 16;
	};

	if (count greuh_liberation_savegame > 17) then {
		KP_liberation_guerilla_strength = greuh_liberation_savegame select 17;
	};

	setDate [2045, 6, 6, time_of_day, 0];

	private _correct_fobs = [];
	{
		private _next_fob = _x;
		private _keep_fob = true;
		{
			if (_next_fob distance (markerpos _x) < 50) exitWith {_keep_fob = false};
		} forEach sectors_allSectors;
		if (_keep_fob) then {_correct_fobs pushback _next_fob};
	} forEach GRLIB_all_fobs;
	GRLIB_all_fobs = _correct_fobs;

	stats_saves_loaded = stats_saves_loaded + 1;

	// Arty Supp deactivated for now
	/*if (KP_liberation_suppMod_enb > 0) then {
		waitUntil {!isNil "KP_liberation_suppMod_created"};
	};*/

	private _spawnedBuildings = [];

	{
		private _nextclass = _x select 0;

		if (_nextclass in _classnames_to_save) then {

			//buildings_to_save pushback [_nextclass,_savedpos,_nextdir,_hascrew,_savedvec];		OLD
			//buildings_to_save pushback [_nextclass,_savedpos,_savedvecdir,_savedvecup,_hascrew];		NEW

			private _nextpos = _x select 1;
			private _nextvecdir = _x select 2;
			private _nextvecup = _x select 3;
			private _hascrew = false;

			private _nextbuilding = createVehicle [_nextclass, _nextpos, [], 0, "CAN_COLLIDE"];
			_nextbuilding allowdamage false;
			_nextbuilding enableSimulation false;
			_spawnedBuildings pushBack _nextbuilding;

			// Old savegame version (Backwards compatibility)
			if (typeName _nextvecdir == typeName 0) then {
				_nextbuilding setPosATL _nextpos;
				_nextbuilding setdir _nextvecdir;	// actually a number
				_hascrew = _x param [3, false];

			// New savegame version
			} else {
				_nextbuilding setPosWorld _nextpos;
				_nextbuilding setVectorDirAndUp [_nextvecdir, _nextvecup];
				_hascrew = _x param [4, false];
			};


			// Arty Supp deactivated for now
			/*if ((KP_liberation_suppMod_enb > 0) && (_nextclass in KP_liberation_artySupp)) then {
				[_nextbuilding] remoteExec ["arty_monitor", 2];
			};*/

			if (_hascrew) then {
				[ _nextbuilding ] call F_forceBluforCrew;
			};

			if !(_nextclass in no_kill_handler_classnames) then {
				_nextbuilding addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
			};

			if (_nextclass in all_hostile_classnames) then {
				_nextbuilding setVariable ["GRLIB_captured", 1, true];
			};

			if (_nextclass == FOB_typename) then {
				_nextbuilding addEventHandler ["HandleDamage", {0}];
			};

			if (_nextclass in KP_liberation_medical_vehicles) then {
				_nextbuilding setVariable ["ace_medical_medicClass", 1, true];
			};

			if (_nextclass == "Land_Medevac_house_V1_F" || _nextclass == "Land_Medevac_HQ_V1_F") then {
				_nextbuilding setVariable ["ace_medical_isMedicalFacility", true, true];
			};

			if (_nextclass == KP_liberation_recycle_building) then {
				_nextbuilding setVariable ["ace_isRepairFacility", 1, true];
			};

			if (_nextclass == "Flag_White_F") then {
				_nextbuilding setFlagTexture "res\kpflag.jpg";
			};

			if !(_nextclass in KP_liberation_ace_crates) then {
				if(KP_liberation_clear_cargo || !(_nextclass isKindOf "AllVehicles")) then {
					clearWeaponCargoGlobal _nextbuilding;
					clearMagazineCargoGlobal _nextbuilding;
					clearBackpackCargoGlobal _nextbuilding;
					clearItemCargoGlobal _nextbuilding;
				};
			};

			if (_nextclass == "Land_HelipadSquare_F" || _nextclass == "Land_HelipadCircle_F" || _nextclass == "Land_HelipadRescue_F") then {
				{
					_x addCuratorEditableObjects [[_nextbuilding],true];
				} forEach allCurators;
			};

			if (_nextclass in civilian_vehicles) then {
				KP_liberation_cr_vehicles pushBack _nextbuilding;
			};
		};
	} forEach buildings_to_save;

	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved buildings placed";};

	{
		private _nextclass = _x select 0;

		if (_nextclass in _classnames_to_save) then {

			//KP_liberation_storages pushback [_nextclass,_savedpos,_nextdir,_supplyValue,_ammoValue,_fuelValue,_savedvec];			OLD
			//KP_liberation_storages pushback [_nextclass,_savedpos,_savedvecdir,_savedvecup,_supplyValue,_ammoValue,_fuelValue];		NEW

			private _nextpos = _x select 1;
			private _nextvecdir = _x select 2;
			private _nextvecup = _x select 3;
			private _supply = 0;
			private _ammo = 0;
			private _fuel = 0;

			private _nextbuilding = createVehicle [_nextclass, _nextpos, [], 0, "CAN_COLLIDE"];;
			_nextbuilding allowdamage false;
			_nextbuilding enableSimulation false;

			// Old savegame version (Backwards compatibility)
			if (typeName _nextvecdir == typeName 0) then {
				_nextbuilding setPosATL _nextpos;
				_nextbuilding setdir _nextvecdir;	// actually a number
				_supply = floor (_x select 3);
				_ammo = floor (_x select 4);
				_fuel = floor (_x select 5);

			// New savegame version
			} else {
				_nextbuilding setPosWorld _nextpos;
				_nextbuilding setVectorDirAndUp [_nextvecdir, _nextvecup];
				_supply = floor (_x select 4);
				_ammo = floor (_x select 5);
				_fuel = floor (_x select 6);
			};

			_nextbuilding setdamage 0;
			_nextbuilding enableSimulation true;
			_nextbuilding allowdamage true;

			_nextbuilding setVariable ["KP_liberation_storage_type", 0, true];

			while {_supply > 0} do {
				private _amount = 100;
				if ((_supply / 100) < 1) then {
					_amount = _supply;
				};
				_supply = _supply - _amount;
				private _crate = [KP_liberation_supply_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};

			while {_ammo > 0} do {
				private _amount = 100;
				if ((_ammo / 100) < 1) then {
					_amount = _ammo;
				};
				_ammo = _ammo - _amount;
				private _crate = [KP_liberation_ammo_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};

			while {_fuel > 0} do {
				private _amount = 100;
				if ((_fuel / 100) < 1) then {
					_amount = _fuel;
				};
				_fuel = _fuel - _amount;
				private _crate = [KP_liberation_fuel_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};
		};
	} forEach KP_liberation_storages;

	// Re-enable physics on the spawned objects
	{
		_x enableSimulation true;
		_x setdamage 0;
		_x allowdamage true;
	} forEach _spawnedBuildings;


	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved storages placed"};

	{
		private _storage = _x select 3;

		if ((count _storage) == 3) then {
			private _nextpos = _storage select 0;
			private _nextdir = _storage select 1;

			private _nextbuilding = createVehicle [KP_liberation_small_storage_building, _nextpos, [], 0, "CAN_COLLIDE"];
			_nextbuilding enableSimulationGlobal false;
			_nextbuilding allowdamage false;
			if (count (_storage select 2) == 3) then {
				_nextbuilding setVectorUp (_storage select 2);
			};
			_nextbuilding setPosATL _nextpos;
			_nextbuilding setdamage 0;
			_nextbuilding setdir _nextdir;
			_nextbuilding setVariable ["KP_liberation_storage_type", 1, true];

			_nextbuilding enableSimulationGlobal true;
			_nextbuilding allowdamage true;

			private _supply = floor (_x select 9);
			private _ammo = floor (_x select 10);
			private _fuel = floor (_x select 11);

			while {_supply > 0} do {
				private _amount = 100;
				if ((_supply / 100) < 1) then {
					_amount = _supply;
				};
				_supply = _supply - _amount;
				private _crate = [KP_liberation_supply_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};

			while {_ammo > 0} do {
				private _amount = 100;
				if ((_ammo / 100) < 1) then {
					_amount = _ammo;
				};
				_ammo = _ammo - _amount;
				private _crate = [KP_liberation_ammo_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};

			while {_fuel > 0} do {
				private _amount = 100;
				if ((_fuel / 100) < 1) then {
					_amount = _fuel;
				};
				_fuel = _fuel - _amount;
				private _crate = [KP_liberation_fuel_crate, _amount, _nextpos] call F_createCrate;
				[_crate, _nextbuilding] call F_crateToStorage;
			};
		};
	} forEach KP_liberation_production;

	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved sector storages placed";};

	{
		private _nextgroup = _x;
		private _grp = createGroup GRLIB_side_friendly;
		{
			private _nextunit = _x;
			private _nextpos = [(_nextunit select 1) select 0, (_nextunit select 1) select 1, ((_nextunit select 1) select 2) + 0.2];
			private _nextdir = _nextunit select 2;
			(_nextunit select 0) createUnit [ _nextpos, _grp, 'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}] '];
			private _nextobj = ((units _grp) select ((count (units _grp)) - 1));
			_nextobj setPosATL _nextpos;
			_nextobj setDir _nextdir;
		} forEach _nextgroup;
	} forEach ai_groups;

	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Save loading finished";};
} else {
	if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Save nil";};
};

publicVariable "blufor_sectors";
publicVariable "GRLIB_all_fobs";

if (count GRLIB_vehicle_to_military_base_links == 0) then {
	private _assigned_bases = [];
	private _assigned_vehicles = [];

	while {count _assigned_bases < count sectors_military && count _assigned_vehicles < count elite_vehicles} do {
		private _nextbase =  selectRandom ([sectors_military, {!(_x in _assigned_bases)}] call BIS_fnc_conditionalSelect);
		private _nextvehicle =  selectRandom ([elite_vehicles, {!(_x in _assigned_vehicles)}] call BIS_fnc_conditionalSelect);
		_assigned_bases pushback _nextbase;
		_assigned_vehicles pushback _nextvehicle;
		GRLIB_vehicle_to_military_base_links pushback [_nextvehicle, _nextbase];
	};
} else {
	private _classnames_to_check = GRLIB_vehicle_to_military_base_links;
	{
		if !([_x select 0] call F_checkClass) then {
			GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links - [_x];
		};
	} forEach _classnames_to_check;
};
publicVariable "GRLIB_vehicle_to_military_base_links";
publicVariable "GRLIB_permissions";
publicVariable "KP_liberation_cr_vehicles";
save_is_loaded = true; publicVariable "save_is_loaded";

if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] save_manager.sqf done - time: %1", diag_tickTime];};

while {true} do {
	waitUntil {
		sleep 0.5;
		trigger_server_save || GRLIB_endgame == 1;
	};

	if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Save interval started - time: %1", time];};

	if (GRLIB_endgame == 1) then {
		profileNamespace setVariable [GRLIB_save_key, nil];
		saveProfileNamespace;
		while {true} do {sleep 300;};
	} else {
		trigger_server_save = false;
		buildings_to_save = [];
		KP_liberation_storages = [];
		ai_groups = [];

		private _all_buildings = [];
		private _all_storages = [];
		{
			private _fobpos = _x;
			private _nextbuildings = [_fobpos nearobjects (GRLIB_fob_range * 2), {
				((typeof _x) in _classnames_to_save ) &&
				(alive _x) &&					// Exclude dead or broken objects
				(speed _x < 5) &&				// Exclude moving objects (like civilians driving through)
				(isNull attachedTo _x) &&			// Exclude attachTo'd objects
				(((getpos _x) select 2) < 10) &&		// Exclude hovering helicopters and the like
				(getObjectType _x >= 8) &&			// Exclude preplaced terrain objects
				!((typeOf _x) in KP_liberation_crates) &&	// Exclude storage crates (those are handled separately)
				!(_x getVariable ["KP_liberation_preplaced", false])
 			}] call BIS_fnc_conditionalSelect;

			_all_buildings = [(_all_buildings + _nextbuildings), {!((typeOf _x) in KP_liberation_storage_buildings)}] call BIS_fnc_conditionalSelect;
			_all_storages = [(_all_storages + _nextbuildings), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

			{
				private _nextgroup = _x;
				if (side _nextgroup == GRLIB_side_friendly) then {
					if ({isPlayer _x} count (units _nextgroup) == 0) then {
						if ({ alive _x} count (units _nextgroup) > 0) then {
							if ((_fobpos distance (leader _nextgroup) < GRLIB_fob_range * 2) && ((typeOf (leader _nextgroup)) in friendly_infantry_classnames)) then {
								private _grouparray = [];
								{
									if (alive _x && (vehicle _x == _x)) then {
										_grouparray pushback [typeof _x, getPosATL _x, getDir _x];
									};
								} forEach (units _nextgroup);
								ai_groups pushback _grouparray;
							};
						};
					};
				};
			} forEach allGroups;
		} forEach GRLIB_all_fobs;

		// Save all buildings and vehicles
		{
			private _savedpos = getPosWorld _x;;
			private _savedvecdir = vectorDirVisual _x;
			private _savedvecup = vectorUpVisual _x;;
			private _nextclass = typeof _x;
			private _hascrew = false;

			if (_nextclass in _classnames_to_save_blu) then {
				if (({!isPlayer _x} count (crew _x) ) > 0) then {
					_hascrew = true;
				};
			};
			if (!(_nextclass in civilian_vehicles) || (_x in KP_liberation_cr_vehicles)) then {
				//buildings_to_save pushback [_nextclass,_savedpos,_nextdir,_hascrew,_savedvec];
				buildings_to_save pushback [_nextclass,_savedpos,_savedvecdir,_savedvecup,_hascrew];
			};
		} forEach _all_buildings;

		{
			private _savedpos = getPosWorld _x;;
			private _savedvecdir = vectorDirVisual _x;
			private _savedvecup = vectorUpVisual _x;;
			private _nextclass = typeof _x;
			_supplyValue = 0;
			_ammoValue = 0;
			_fuelValue = 0;

			{
				switch ((typeOf _x)) do {
					case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
				};
			} forEach (attachedObjects _x);

			//KP_liberation_storages pushback [_nextclass,_savedpos,_nextdir,_supplyValue,_ammoValue,_fuelValue,_savedvec];
			KP_liberation_storages pushback [_nextclass,_savedpos,_savedvecdir,_savedvecup,_supplyValue,_ammoValue,_fuelValue];
		} forEach _all_storages;

		time_of_day = date select 3;

		stats_saves_performed = stats_saves_performed + 1;

		private _knownplayers = [];
		private _newscores = [] + GRLIB_player_scores;
		{ _knownplayers pushback (_x select 0) } foreach GRLIB_player_scores;

		{
			if (score _x >= 20) then {
				private _playerindex = _knownplayers find (getPlayerUID _x);
				if (_playerindex >= 0) then {
					_newscores set [_playerindex, [getPlayerUID _x, score _x]];
				} else {
					_newscores pushback [getPlayerUID _x, score _x];
				};
			};
		} forEach allPlayers;
		GRLIB_player_scores = _newscores;

		_stats = [];
		_stats pushback stats_opfor_soldiers_killed;
		_stats pushback stats_opfor_killed_by_players;
		_stats pushback stats_blufor_soldiers_killed;
		_stats pushback stats_player_deaths;
		_stats pushback stats_opfor_vehicles_killed;
		_stats pushback stats_opfor_vehicles_killed_by_players;
		_stats pushback stats_blufor_vehicles_killed;
		_stats pushback stats_blufor_soldiers_recruited;
		_stats pushback stats_blufor_vehicles_built;
		_stats pushback stats_civilians_killed;
		_stats pushback stats_civilians_killed_by_players;
		_stats pushback stats_sectors_liberated;
		_stats pushback stats_playtime;
		_stats pushback stats_spartan_respawns;
		_stats pushback stats_secondary_objectives;
		_stats pushback stats_hostile_battlegroups;
		_stats pushback stats_ieds_detonated;
		_stats pushback stats_saves_performed;
		_stats pushback stats_saves_loaded;
		_stats pushback stats_reinforcements_called;
		_stats pushback stats_prisonners_captured;
		_stats pushback stats_blufor_teamkills;
		_stats pushback stats_vehicles_recycled;
		_stats pushback stats_ammo_spent;
		_stats pushback stats_sectors_lost;
		_stats pushback stats_fobs_built;
		_stats pushback stats_fobs_lost;
		_stats pushback stats_readiness_earned;

		greuh_liberation_savegame = [blufor_sectors, GRLIB_all_fobs, buildings_to_save, time_of_day, round combat_readiness, KP_liberation_storages,
		KP_liberation_production, KP_liberation_logistics, _stats, [round infantry_weight, round armor_weight, round air_weight], GRLIB_vehicle_to_military_base_links,
		GRLIB_permissions, ai_groups, resources_intel, GRLIB_player_scores, KP_liberation_civ_rep, KP_liberation_production_markers, KP_liberation_guerilla_strength];

		profileNamespace setVariable [GRLIB_save_key, greuh_liberation_savegame];
		saveProfileNamespace;

		if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Save interval finished - time: %1", time];};
	};
};
