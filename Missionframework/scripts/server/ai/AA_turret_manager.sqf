/*
    File: AA_turret_manager.sqf
    Author: Nicoman
    Date: 2020-09-29
    Last Update: 2020-09-29
    License: MIT License - http://www.opensource.org/licenses/MIT
    Description:
        Spawns and manages AA turrets in the back country. Max number and spawn rate of AA turrets is influenced by various factors:
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
waitUntil {!isNil "KPLIB_sectors_player"};																	// we wait with our mighty AA units until those pesky players dare to conquer one of OUR nice sectors
waitUntil {KPLIB_saveLoaded};

if (isNil "KPLIB_o_turretsAA") exitWith {};																	// leave, if there are no AA turrets defined in currently played preset
if (KPLIB_param_difficulty < 0.75) exitWith {};																// no AA turrets on easiest difficulty level (as of v0.96.8, KPLIB_param_difficulty values range from 0.5 to 10)
if (isNil "KPLIB_usedPositionsAA") then {KPLIB_usedPositionsAA = []};										// define array containing all currently used positions
if (isNil "KPLIB_backCountryTurretsAA") then {KPLIB_backCountryTurretsAA = []};								// define array containing all turrets corresponding to a used position

private ["_group", "_i", "_killedTurretsAA", "_maxAAnumber", "_randomTurret", "_sleepTime", "_spawnMarker", "_turret", "_turretGroup"];
_killedTurretsAA = 0;																						// counter of killed AA turrets

while {KPLIB_endgame == 0} do {
    _sleepTime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * KPLIB_param_aggressivity);	// sleep time is 30 to 60 minutes
    if (KPLIB_enemyReadiness >= 80) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 80, reduce sleep time to 0.75
    if (KPLIB_enemyReadiness >= 90) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 90, reduce sleep time to 0.5625 (0.75 * 0.75)
    if (KPLIB_enemyReadiness >= 100) then {_sleepTime = _sleepTime * 0.75};									// when enemy readiness gets above 1000, reduce sleep time to 0.42 (0.75 * 0.75 * 0.75)	
	sleep _sleepTime;	
		
	// Check and clear turret array for any destroyed or unmanned units
	{			
		_turret = _x select 0;																				// in case turret is an array, choose first element of array as turret
		if (!alive _turret || !alive gunner _turret || side _turret != KPLIB_side_enemy) then {
			{
				if (side _x == KPLIB_side_player) exitWith {};
				if (alive _x) then {_x setDamage 1};
			} forEach _x;
			KPLIB_backCountryTurretsAA deleteAt _forEachIndex;												// delete any destroyed or unmanned AA turret from turret array
			KPLIB_usedPositionsAA deleteAt _forEachIndex;													// delete corresponding position from used positions array
			_killedTurretsAA = _killedTurretsAA + 1;														// raise kill counter
		};
	} forEach KPLIB_backCountryTurretsAA;
	
	// If AA turrets were destroyed, add a 'punishment' time for the enemy. This extra time is meant to be a dampening of the production of AA turrets
	if (_killedTurretsAA > 0) then {
		sleep (_sleepTime * _killedTurretsAA);																// killing AA turrets 'damps' placement of further turrets
		_killedTurretsAA = 0;																				// reset kill counter after performing 'damp' sleep
	};

	// Calculate maximum amount of AA turrets
	_maxAAnumber = round (KPLIB_param_difficulty * 2);
	if (_maxAAnumber > 12) then {_maxAAnumber = 12};
	if (KPLIB_enemyReadiness > 0 && _maxAAnumber > 0) then {
		_maxAAnumber = _maxAAnumber + round (KPLIB_enemyReadiness / 30);		
		if (_maxAAnumber > 20) then {_maxAAnumber = 20};
		if (_maxAAnumber > (count KPLIB_sectors_all - count KPLIB_sectors_player)) then {_maxAAnumber = count KPLIB_sectors_all - count KPLIB_sectors_player};	// maximum amount of AA turrets should not exceed number of opfor sectors
	};
	
	// If maximum amount of AA turrets has not been reached yet, add one to the map
	if (count KPLIB_backCountryTurretsAA < _maxAAnumber) then {
		_spawnMarker = [] call KPLIB_fnc_getOpforSpawnPointAA;												// get a sector for spawning an AA turret
		if (_spawnMarker isEqualTo "") exitWith {};															// do not spawn, if no spawn marker was found		
		_randomTurret = selectRandom KPLIB_o_turretsAA;														// choose an OpFor turret to be spawned
		KPLIB_usedPositionsAA pushBack _spawnMarker;														// update AA used positions array with current sector 

		// The lower the difficulty level is, the less it is likely to have 'heavy' AA defenses
		if (KPLIB_param_difficulty < 4 && count _randomTurret > 1) then {
			_i = 4 - (floor KPLIB_param_difficulty);
			while {count _randomTurret > 1 && _i > 0} do { 
				_randomTurret = selectRandom KPLIB_o_turretsAA;
				_i = _i - 1; 
			};
		};
		
		// spawn and memory turret / turrets
		_turretGroup = [];																					// create save array for currently spawned turret group
		{
			_turret = [markerpos _spawnMarker, _x] call KPLIB_fnc_spawnVehicle;							
			_turretGroup pushBack _turret;																	// append spawned turret to save array			
						
		} forEach _randomTurret;																			// spawn turret / turrets
		KPLIB_backCountryTurretsAA pushBack _turretGroup;													// update AA turrets array with current turret
		
		// if turret group has more than one unit, that means there is a radar vehicle involved; so link all units in turret group to that radar
		if (count _turretGroup > 1) then {
			_group = createGroup [KPLIB_side_enemy, true];
			private ["_crew"];
			{
				_crew = units (_x);
				_crew joinSilent _group;
				_x setVehicleRadar 1;																		// fucking turn on radar
			} forEach _turretGroup;	
			sleep 0.1; 
		};
	};
};
