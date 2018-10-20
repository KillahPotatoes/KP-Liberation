/*
    KPLIB_fnc_garrison_spawnSectorPatrol

    File: fn_garrison_spawnSectorPatrol.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns an infantrie squad with given amount of soldiers of given side at given sector.

    Parameter(s):
        _sector - Markername of the sector      [STRING, defaults to ""]
        _side   - Side of the patrol            [SIDE, defaults to KPLIB_preset_sideEnemy]
        _amount - Amount of soldiers to spawn   [NUMBER, defaults to 6]

    Returns:
        Spawned infantry squad [GROUP]
*/

params [
    ["_sector", "", [""]],
    ["_side", KPLIB_preset_sideEnemy, [sideEmpty]],
    ["_amount", 6, [0]]
];

// Exit if no or invalid sector was given
if (_sector == "") exitWith {grpNull};
if !(_sector in KPLIB_sectors_all) exitWith {grpNull};

// Initialize local variables
private _grp = grpNull;
private _sectorPos = getMarkerPos _sector;
private _spawnPos = _sectorPos getPos [random 150, random 360];
private _soldierArray = [];

// Set array to select soldier classnames from
switch (_side) do {
    case KPLIB_preset_sidePlayers: {_soldierArray = KPLIB_preset_lightSquad;};
    default {_soldierArray = KPLIB_preset_oMilUnits;};
};

// Create group
_grp = createGroup [_side, true];

// Add soldiers to group
for "_i" from 1 to _amount do {
    _grp createUnit [selectRandom _soldierArray, _spawnPos, [], 10, "NONE"];
};

// FOR DEBUG: Add group to Zeus
{
    _x addCuratorEditableObjects [units _grp, true]
} forEach allCurators;

// Remove possible initialization waypoints
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
// Make sure every soldier is following the leader
{_x doFollow (leader _grp)} forEach (units _grp);

// Set patrol waypoints around the sector
private _waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCompletionRadius 10;

_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "MOVE";

_waypoint = _grp addWaypoint [_sectorPos, 200];
_waypoint setWaypointType "CYCLE";

_grp setCurrentWaypoint [_grp, 0];

// Return group
_grp
