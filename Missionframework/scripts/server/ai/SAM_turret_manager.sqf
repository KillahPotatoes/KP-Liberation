/*
    File: SAM_turret_manager.sqf
    Author: Nicoman
    Date: 2020-09-29
    Last Update: 2023-04-16
    License: MIT License - http://www.opensource.org/licenses/MIT
    Description:
        Spawns and manages SAM turrets in the back country. Max number and spawn rate of SAM turrets is influenced by various factors:
        * KPLIB_param_difficulty      (game difficulty, ranges from 0.5 to 10)
        * KPLIB_enemyReadiness        (enemy combat readiness, ranges from 0 to 200)
        * KPLIB_param_aggressivity    (enemy aggressivity, ranges from 0.25 to 4)
        * Player count, if "adapt to player count" mission param is enabled.
    
    Parameter(s):
        NONE
    
    Returns:
        Nothing
*/

waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {KPLIB_saveLoaded};
waitUntil {!isNil "KPLIB_param_serverInitDone"};
waitUntil {KPLIB_param_serverInitDone};
if (isNil "KPLIB_o_turrets_SAM") exitWith {["KPLIB_o_turrets_SAM is notFound", "SAM"] call KPLIB_fnc_log;};
// no SAM turrets on easiest difficulty level (as of v0.96.8, KPLIB_param_difficulty values range from 0.5 to 10)
if (KPLIB_param_difficulty < 0.75) exitWith {[format ["difficulty is easy: %1", (str KPLIB_param_difficulty)], "SAM"] call KPLIB_fnc_log;};
// Wait until the player forces control the first sector
waitUntil {!isNil "KPLIB_sectors_player"};

if (isNil "KPLIB_usedPositions_SAM") then {KPLIB_usedPositions_SAM = []; publicVariable "KPLIB_usedPositions_SAM";};
if (isNil "KPLIB_backCountryTurrets_SAM") then {KPLIB_backCountryTurrets_SAM = []; publicVariable "KPLIB_backCountryTurrets_SAM";};

private ["_crew", "_group", "_i", "_killedTurretsSAM", "_maxSAMnumber", "_randomTurret", "_sleepTime", "_spawnMarker", "_turret", "_turretGroup"];
_killedTurretsSAM = 0;

while {KPLIB_endgame == 0} do {

    _sleepTime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * KPLIB_param_aggressivity); // sleep time is 30 to 60 minutes
    if (KPLIB_enemyReadiness >= 80) then {_sleepTime = _sleepTime * 0.75};  // when enemy readiness gets above 80, reduce sleep time to 0.75
    if (KPLIB_enemyReadiness >= 90) then {_sleepTime = _sleepTime * 0.75};  // when enemy readiness gets above 90, reduce sleep time to 0.5625 (0.75 * 0.75)
    if (KPLIB_enemyReadiness >= 100) then {_sleepTime = _sleepTime * 0.75}; // when enemy readiness gets above 100, reduce sleep time to 0.42 (0.75 * 0.75 * 0.75)    
    sleep _sleepTime;
    
    if (KPLIB_backCountryTurrets_SAM isNotEqualTo []) then {
        _SAMdeleteTargetArray = [];
        // Check and clear turret array for any destroyed or unmanned units
        {
            _groupDestroyed = false;
            private _groupVehicles = _x;
            {
                if (side _x == KPLIB_side_player) exitWith {};
                if (_groupDestroyed) exitWith {};
                if (!alive _x || !alive gunner _x || side _x != KPLIB_side_enemy) then {
                    _groupDestroyed = true;
                };
            } forEach _groupVehicles;
            if (_groupDestroyed) then {
                {
                    private _vehicle = _x;
                    if (side _x == KPLIB_side_player) exitWith {};
                    [_vehicle] call KPLIB_fnc_cleanOpforVehicle;
                } forEach _groupVehicles;
                _SAMdeleteTargetArray pushBack _x;
                _killedTurretsSAM = _killedTurretsSAM + 1;
                _groupDestroyed = false;
            };
        } forEach KPLIB_backCountryTurrets_SAM;

        while {_SAMdeleteTargetArray isNotEqualTo []} do {
            {
                private _SAMdeleteTargetIndex = KPLIB_backCountryTurrets_SAM find _x;
                
                KPLIB_backCountryTurrets_SAM deleteAt _SAMdeleteTargetIndex;
                KPLIB_usedPositions_SAM deleteAt _SAMdeleteTargetIndex;
                _SAMdeleteTargetArray deleteAt _forEachIndex;
            } forEach _SAMdeleteTargetArray;
        };
        publicVariable "KPLIB_backCountryTurrets_SAM";
        publicVariable "KPLIB_usedPositions_SAM";

        // If SAM turrets were destroyed, add a 'punishment' time for the enemy. This extra time is meant to be a dampening of the production of SAM turrets
        if (_killedTurretsSAM > 0) then {
            sleep (_sleepTime * _killedTurretsSAM);
            _killedTurretsSAM = 0;
        };
    };
    
    // Calculate maximum amount of SAM turrets
    _maxSAMnumber = 0.5;
    private _helislots = KPLIB_heli_slots;
    private _planeslots = KPLIB_plane_slots * 1.5;
    private _difficulty = KPLIB_param_difficulty;
    if (KPLIB_param_difficulty isEqualTo 4) then {_difficulty = 3};
    if (KPLIB_param_difficulty isEqualTo 10) then {_difficulty = 5};
    _maxSAMnumber = _maxSAMnumber + _helislots + _planeslots;
    _maxSAMnumber = _maxSAMnumber + (KPLIB_enemyReadiness / 30);
    _maxSAMnumber = _maxSAMnumber * _difficulty;
    _maxSAMnumber = round _maxSAMnumber;
    if (_maxSAMnumber > 20) then {_maxSAMnumber = 20};
    // maximum amount of SAM turrets should not exceed number of opfor sectors
    if (_maxSAMnumber > (count KPLIB_sectors_all - count KPLIB_sectors_player)) then {_maxSAMnumber = count KPLIB_sectors_all - count KPLIB_sectors_player};

    // If maximum amount of SAM turrets has not been reached yet, add one to the map
    if (count KPLIB_backCountryTurrets_SAM < _maxSAMnumber) then {
        _spawnMarker = [] call KPLIB_fnc_getOpforSpawnPointSAM;
        if (_spawnMarker isEqualTo "") exitWith {};   
        _randomTurret = selectRandom KPLIB_o_turrets_SAM;
        KPLIB_usedPositions_SAM pushBack _spawnMarker;
        publicVariable "KPLIB_usedPositions_SAM";

        // spawn and memory turret / turrets
        _turretGroup = [];
        {
            _turret = [markerpos _spawnMarker, _x] call KPLIB_fnc_spawnVehicle;                            
            _turretGroup pushBack _turret;            
        } forEach _randomTurret;
        KPLIB_backCountryTurrets_SAM pushBack _turretGroup;
        publicVariable "KPLIB_backCountryTurrets_SAM";

        // make sure turrets set enemy side and link all turrets because involved radar system.
        _group = createGroup [KPLIB_side_enemy, true];
        {
            _crew = units (_x);
            [_crew, _group] remoteExecCall ["joinSilent"];
            _x setVehicleRadar 1;
        } forEach _turretGroup;
    };
};