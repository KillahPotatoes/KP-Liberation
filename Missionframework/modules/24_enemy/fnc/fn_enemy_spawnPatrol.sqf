/*
    KPLIB_fnc_enemy_spawnPatrol

    File: fn_enemy_spawnPatrol.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-08
    Last Update: 2019-06-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Spawns a (motorized) patrol at nearest sector of given position. Random sector if no position is given.
        Destination of the patrol will be nearest enemy sector.

    Parameter(s):
        _spawnPos   - Position look for nearest sector to spawn patrol from. If empty, random sector selection  [ARRAY, defaults to []]
        _unitCount  - Amount of infantry units                                                                  [NUMBER, defaults to 4]
        _motorized  - Bool to select if the patrol should be motorized                                          [BOOL, defaults to false]

    Returns:
        Spawned patrol [GROUP]
*/

params [
    ["_spawnPos", [], [[]]],
    ["_unitCount", 4, [0]],
    ["_motorized", false, [false]]
];

// Only inactive opfor sectors
private _sectors = (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
private _sector = "";
private _veh = objNull;

// Get random sector, when no position given. Otherwise get nearest sector
if (_spawnPos isEqualTo []) then {
    _sector = _sectors deleteAt (floor random count _sectors);
} else {
    _sector =  [1000, _spawnPos, _sectors] call KPLIB_fnc_core_getNearestMarker;
    _sectors = _sectors - [_sector];
};

// Exit if no sector was found
if (_sector isEqualTo "") exitWith {
    private _text = format ["Spawn patrol couldn't find sector in vicinity of given position: %1", _spawnPos];
    [_text, "ENEMY"] call KPLIB_fnc_common_log
};

// Get spawn und destination pos in vicinity of sector
_spawnPos = (getMarkerPos _sector) getPos [random 100, random 360];
private _destPos = getMarkerPos ([2500, _spawnPos, _sectors] call KPLIB_fnc_core_getNearestMarker);

// Gather infantry classnames
private _soldierArray = [] call KPLIB_fnc_common_getSoldierArray;
private _units = [];
for "_i" from 1 to _unitCount do {
    _units pushBack (selectRandom _soldierArray);
};

// Tweak spawnPos to a road and spawn vehicle when motorized
if (_motorized) then {
    _spawnPos = [_spawnPos] call KPLIB_fnc_garrison_getVehSpawnPos;
    _veh = [selectRandom (["vehLightArmed", KPLIB_preset_sideE, true] call KPLIB_fnc_common_getPresetClass), _spawnPos] call KPLIB_fnc_common_createVehicle;
};

// Create group
private _grp = [_units, _spawnPos] call KPLIB_fnc_common_createGroup;
// Remove possible initialization waypoints
{deleteWaypoint [_grp, 0];} forEach (waypoints _grp);
// Make sure every soldier is following the leader
{_x doFollow (leader _grp);} forEach (units _grp);
// Add possible vehicle to group
_grp addVehicle _veh;

// !DEBUG! Add patrol to Zeus
{
    _x addCuratorEditableObjects [(units _grp) + [_veh], true];
} forEach allCurators;

// Set waypoints
private _waypoint = _grp addWaypoint [_destPos, 50];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 30;

_waypoint = _grp addWaypoint [_spawnPos, 50];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 30;

_waypoint = _grp addWaypoint [_spawnPos, 50];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 30;

_grp
