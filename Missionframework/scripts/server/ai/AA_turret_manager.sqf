waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "GRLIB_vehicle_to_military_base_links"};
waitUntil {!isNil "blufor_sectors"};
waitUntil {save_is_loaded};

if (GRLIB_difficulty_modifier == 0) exitWith {};											// no AA turrets on easiest difficulty level
if (isNil "KPLIB_o_AA_Turrets") exitWith {};													// leave, if there are no AA turrets defined in currently played preset
private _AA_Killed_Turrets = 0;																// counter of killed AA turrets
if (isNil "AA_used_positions") then {AA_used_positions = []};								// define array containing all currently used positions
if (isNil "AA_backland_turrets") then {AA_backland_turrets = []};							// define array containing all turrets corresponding to a used position

while {GRLIB_endgame == 0} do {
    private _sleeptime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);

    if (combat_readiness >= 80) then {_sleeptime = _sleeptime * 0.75};
    if (combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75};
    if (combat_readiness >= 95) then {_sleeptime = _sleeptime * 0.75};
	sleep _sleeptime;

	// Check and clear turret array for any destroyed or unmanned units
	private _turret = objNull;
	{		
		if (typeName _x  == "ARRAY") then {			
			_turret = _x select 0;															// in case turret is an array, choose first element of array as turret
		} else {
			_turret = _x;
		};
		if (!alive _turret || !alive gunner _turret) then {
			if (typeName _x  == "ARRAY") then {			
				{
					if (alive _x) then {_x setDamage 1};
				} forEach _x;
			};
			AA_backland_turrets deleteAt _forEachIndex;										// delete any destroyed or unmanned AA turret from turret array
			AA_used_positions deleteAt _forEachIndex;										// delete corresponding position from used positions array
			_AA_Killed_Turrets = _AA_Killed_Turrets + 1;									// raise kill counter
		};
	} forEach AA_backland_turrets;

	// If AA turrets were destroyed, add a 'punishment' time for the enemy. This extra time is ment to be a dampening of the production of AA turrets
	if (_AA_Killed_Turrets > 0) then {
		_sleeptime = _sleeptime * _AA_Killed_Turrets;
		sleep _sleeptime;																	// killing AA turrets 'damps' placement of further turrets
		_AA_Killed_Turrets = 0;																// reset kill counter after performing 'damp' sleep
	};

	// Calculate maximum amount of AA turrets
	private _maxAAnumber = round (GRLIB_difficulty_modifier * 2);
	if (_maxAAnumber > 12) then {_maxAAnumber = 12};
	if (combat_readiness > 0 && _maxAAnumber > 0) then {
		_maxAAnumber = _maxAAnumber * round (combat_readiness / 30);		
		if (_maxAAnumber > 20) then {_maxAAnumber = 20};
		if (_maxAAnumber > (count sectors_allSectors - count blufor_sectors)) then {_maxAAnumber = count sectors_allSectors - count blufor_sectors};	// maximum amount of AA turrets should not exceed number of opfor sectors
	};

	// If maximum amount of AA turrets has not been reached yet, add one to the map
	if (count AA_backland_turrets < _maxAAnumber) then {
		private _spawn_marker = [] call KPLIB_fnc_getOpforAASpawnPoint;						// get a sector for spawning an AA turret
		if (_spawn_marker == "") exitWith {diag_log formatText ["%1%2", time, "s  (AA_turret_manager) _spawn_marker: Could not find AA position"];};		
		private _rndTurret = selectRandom KPLIB_o_AA_Turrets;									// choose an opfor turret to be spawned

		// The lower the difficulty level is, the less it is likely to have 'heavy' AA defenses
		if (GRLIB_difficulty_modifier < 4 && typeName _rndTurret == "ARRAY") then {
			private _i = 4 - GRLIB_difficulty_modifier;
			while {typeName _rndTurret == "ARRAY" && _i > 0} do { 
				_rndTurret = selectRandom KPLIB_o_AA_Turrets;
				_i = _i - 1; 
			};
		};

		private _vehicle = objNull;
		AA_used_positions pushBack _spawn_marker;		
		if (typeName _rndTurret == "ARRAY") exitWith {
			private _group = createGroup [GRLIB_side_enemy, true];
			private _groupVehicles = [];
			{
				_vehicle = [markerpos _spawn_marker, _x] call KPLIB_fnc_spawnVehicle;
				_groupVehicles pushBack _vehicle;
				[_vehicle] joinSilent _group;
			} forEach _rndTurret;
			AA_backland_turrets pushBack _groupVehicles;
			_group setBehaviour "AWARE";
		};
		private _vehicle = [markerpos _spawn_marker, _rndTurret] call KPLIB_fnc_spawnVehicle;
		AA_backland_turrets pushBack _vehicle;
		_vehicle setBehaviour "AWARE";
	};
};
