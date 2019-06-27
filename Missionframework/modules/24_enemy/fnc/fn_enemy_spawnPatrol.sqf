/*
    KPLIB_fnc_enemy_spawnPatrol

    File: fn_enemy_spawnPatrol.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-08
    Last Update: 2019-06-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Spawns a (motorized) patrol at nearest sector of given position. Random sector if no position is given.
        Destination of the patrol will be nearest enemy sector.

    Parameter(s):
        _spawnPos   - Position look for nearest sector to spawn patrol from. If empty, random sector selection  [ARRAY, defaults to []]
        _motorized  - Bool to select if the patrol should be motorized                                          [BOOL, defaults to false]
        _unitCount  - Amount of infantry units, when not motorized                                              [NUMBER, defaults to 4]

    Returns:
        Spawned patrol [GROUP]
*/

params [
    ["_spawnPos", [], [[]]],
    ["_motorized", false, [false]],
    ["_unitCount", 4, [0]]
];

// Only inactive opfor sectors
private _sectors = (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
private _patrolSectors = [];
private _grp = grpNull;
private _veh = objNull;

// Get random sector, when no position given. Otherwise get nearest sector
if (_spawnPos isEqualTo []) then {
    _patrolSectors pushBack (_sectors deleteAt (floor random count _sectors));
} else {
    _patrolSectors pushBack ([1200, _spawnPos, _sectors] call KPLIB_fnc_core_getNearestMarker);
    _sectors = _sectors - _patrolSectors;
};

// Exit if no sector was found
if ((_patrolSectors select 0) isEqualTo "") exitWith {
    private _text = format ["Spawn patrol couldn't find a sector within 1200m distance of given position: %1", _spawnPos];
    [_text, "ENEMY"] call KPLIB_fnc_common_log
};

// Fetch some nearby patrol sectors
_patrolSectors append ((_sectors select {((getMarkerPos (_patrolSectors select 0)) distance2D (getMarkerPos _x)) < 2000}) call BIS_fnc_arrayShuffle);

// Exit if sector is too far away from other sectors for a patrol route
if ((count _patrolSectors) < 2) exitWith {
    private _text = format ["Spawn patrol couldn't find sectors within 2000m distance for patrol from sector: %1 (%2)", markerText (_patrolSectors select 0), _patrolSectors select 0];
    [_text, "ENEMY"] call KPLIB_fnc_common_log
};

// Take a maximum of 4 sectors
if ((count _patrolSectors) > 4) then {_patrolSectors resize 4;};

// Spawn infantry or motorized patrol
if (_motorized) then {
    // Get spawnpos on road
    _spawnPos = [getMarkerPos (_patrolSectors select 0)] call KPLIB_fnc_garrison_getVehSpawnPos;
    // Spawn vehicle with crew
    _veh = [selectRandom (["vehLightArmed", KPLIB_preset_sideE, true] call KPLIB_fnc_common_getPresetClass), _spawnPos, random 360, false, true] call KPLIB_fnc_common_createVehicle;
    _grp = group ((crew _veh) select 0);
} else {
    // Get spawn und destination pos in vicinity of sector
    _spawnPos = (getMarkerPos (_patrolSectors select 0)) getPos [random 100, random 360];

    // Gather infantry classnames
    private _soldierArray = [] call KPLIB_fnc_common_getSoldierArray;
    private _units = [];
    for "_i" from 1 to _unitCount do {
        _units pushBack (selectRandom _soldierArray);
    };

    // Create group
    _grp = [_units, _spawnPos] call KPLIB_fnc_common_createGroup;
};

// Set waypoints
private _waypoint = [];
{
    if (_forEachIndex > 0) then {
        _waypoint = _grp addWaypoint [getMarkerPos _x, 50];
        _waypoint setWaypointType "MOVE";
        _waypoint setWaypointSpeed "LIMITED";
        _waypoint setWaypointBehaviour "SAFE";
        _waypoint setWaypointCombatMode "YELLOW";
        _waypoint setWaypointCompletionRadius 30;
    };
} forEach _patrolSectors;

// Add cycle waypoint at spawnpoint
_waypoint = _grp addWaypoint [_spawnPos, 0];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 30;

// Add group to patrols array
KPLIB_enemy_patrols pushBack _grp;

// !DEBUG! Add patrol to Zeus
if (KPLIB_param_enemyDebug) then {
    {
        _x addCuratorEditableObjects [(units _grp) + [_veh], true];
    } forEach allCurators;
};

_grp
