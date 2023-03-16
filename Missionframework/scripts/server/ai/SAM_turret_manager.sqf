/*
    File: SAM_turret_manager.sqf
    Author: Nicoman
    Date: 2020-09-29
    Last Update: 2023-03-07
    License: MIT License - http://www.opensource.org/licenses/MIT
    Description:
        Spawns and manages SAM turrets in the back country. Max number and spawn rate of SAM turrets is influenced by various factors:
        * KPLIB_param_difficulty	(game difficulty, ranges from 0.5 to 10)
        * KPLIB_enemyReadiness		(enemy combat readiness, ranges from 0 to 200)
        * KPLIB_param_aggressivity	(enemy aggressivity, ranges from 0.25 to 4)
        * Player count, if "adapt to player count" mission param is enabled.
    
	Parameter(s):
        NONE
    
	Returns:
        Nothing
*/

waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {!isNil "KPLIB_sectors_player"};																	// we wait with our mighty SAM units until those pesky players dare to conquer one of OUR nice sectors
waitUntil {KPLIB_saveLoaded};
waitUntil {KPLIB_param_serverInitDone};

if (isNil "KPLIB_o_turrets_SAM") exitWith {};																// leave, if there are no SAM turrets defined in currently played preset
if (KPLIB_param_difficulty < 0.75) exitWith {};																// no SAM turrets on easiest difficulty level (as of v0.96.8, KPLIB_param_difficulty values range from 0.5 to 10)
if (isNil "KPLIB_usedPositions_SAM") then {KPLIB_usedPositions_SAM = []};									// define array containing all currently used positions
if (isNil "KPLIB_backCountryTurrets_SAM") then {KPLIB_backCountryTurrets_SAM = []};							// define array containing all turrets corresponding to a used position

private ["_crew", "_group", "_i", "_killedTurretsSAM", "_maxSAMnumber", "_randomTurret", "_sleepTime", "_spawnMarker", "_turret", "_turretGroup"];
_killedTurretsSAM = 0;																						// counter of killed SAM turrets

while {KPLIB_endgame == 0} do {
    _sleepTime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * KPLIB_param_aggressivity);	// sleep time is 30 to 60 minutes
    if (KPLIB_enemyReadiness >= 80) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 80, reduce sleep time to 0.75
    if (KPLIB_enemyReadiness >= 90) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 90, reduce sleep time to 0.5625 (0.75 * 0.75)
    if (KPLIB_enemyReadiness >= 100) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 1000, reduce sleep time to 0.42 (0.75 * 0.75 * 0.75)	
	sleep _sleepTime;	

	if (KPLIB_backCountryTurrets_SAM != []) then {
		// Check and clear turret array for any destroyed or unmanned units
		{
			private _groupDestroyed = false;
			private _groupVehicles = _x;
			{
				if (side _x == KPLIB_side_player) exitWith {};												// ignore player owned turrets
				if (_groupDestroyed) exitWith {};															// skip if group already have destroyed vehicles
				if (!alive _x || !alive gunner _x || side _x != KPLIB_side_enemy) then {
					_groupDestroyed = true;
				};
			} forEach _groupVehicles;																		// in case turret is an array, choose each element of array as turret
			if (_groupDestroyed) then {
				{
					private _vehicle = _x;
					if (side _x == KPLIB_side_player) exitWith {};											// ignore player owned turrets
					[_vehicle] call KPLIB_fnc_cleanOpforVehicle;
				} forEach _groupVehicles;
				KPLIB_backCountryTurrets_SAM deleteAt _forEachIndex;										// delete any destroyed or unmanned SAM turret from turret array
				KPLIB_usedPositions_SAM deleteAt _forEachIndex;												// delete corresponding position from used positions array
				_killedTurretsSAM = _killedTurretsSAM + 1;													// raise kill counter
				if (isNil "KPLIB_backCountryTurrets_SAM") then {KPLIB_backCountryTurrets_SAM = []};			// avoid array is null
				if (isNil "KPLIB_usedPositions_SAM") then {KPLIB_usedPositions_SAM = []};					// avoid array is null
			};
		} forEach KPLIB_backCountryTurrets_SAM;
		// If SAM turrets were destroyed, add a 'punishment' time for the enemy. This extra time is meant to be a dampening of the production of SAM turrets
		if (_killedTurretsSAM > 0) then {
			sleep (_sleepTime * _killedTurretsSAM);															// killing SAM turrets 'damps' placement of further turrets
			_killedTurretsSAM = 0;																			// reset kill counter after performing 'damp' sleep
		};
	};

	// Calculate maximum amount of SAM turrets
	_maxSAMnumber = round (KPLIB_param_difficulty * 2);
	if (_maxSAMnumber > 12) then {_maxSAMnumber = 12};
	if (KPLIB_enemyReadiness > 0 && _maxSAMnumber > 0) then {
		_maxSAMnumber = _maxSAMnumber + round (KPLIB_enemyReadiness / 30);		
		if (_maxSAMnumber > 20) then {_maxSAMnumber = 20};
		if (_maxSAMnumber > (count KPLIB_sectors_all - count KPLIB_sectors_player)) then {_maxSAMnumber = count KPLIB_sectors_all - count KPLIB_sectors_player};	// maximum amount of SAM turrets should not exceed number of opfor sectors
	};

	// If maximum amount of SAM turrets has not been reached yet, add one to the map
	if (count KPLIB_backCountryTurrets_SAM < _maxSAMnumber) then {
		_spawnMarker = [] call KPLIB_fnc_getOpforSpawnPointSAM;												// get a sector for spawning an SAM turret
		if (_spawnMarker isEqualTo "") exitWith {};															// do not spawn, if no spawn marker was found		
		_randomTurret = selectRandom KPLIB_o_turrets_SAM;													// choose an OpFor turret to be spawned
		KPLIB_usedPositions_SAM pushBack _spawnMarker;														// update SAM used positions array with current sector 

		// The lower the difficulty level is, the less it is likely to have 'heavy' SAM defenses
		if (KPLIB_param_difficulty < 4 && count _randomTurret > 1) then {
			_i = 4 - (floor KPLIB_param_difficulty);
			while {count _randomTurret > 1 && _i > 0} do { 
				_randomTurret = selectRandom KPLIB_o_turrets_SAM;
				_i = _i - 1; 
			};
		};

		// spawn and memory turret / turrets
		_turretGroup = [];																					// create save array for currently spawned turret group
		{
			_turret = [markerpos _spawnMarker, _x] call KPLIB_fnc_spawnVehicle;							
			_turretGroup pushBack _turret;																	// append spawned turret to save array					
		} forEach _randomTurret;																			// spawn turret / turrets
		KPLIB_backCountryTurrets_SAM pushBack _turretGroup;													// update SAM turrets array with current turret

		// make sure turrets set enemy side and link all turrets because involved radar system.
		_group = createGroup [KPLIB_side_enemy, true];
		{
			_crew = units (_x);
			_crew joinSilent _group;
			_x setVehicleRadar 1;																			// turn on radar
		} forEach _turretGroup;
	};
};