/*
    KPLIB_fnc_garrison_spawnSectorInfantry

    File: fn_garrison_spawnSectorInfantry.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns an infantry squad with given amount of soldiers of given side at given sector.

    Parameter(s):
        _sector         - Markername of the sector      [STRING, defaults to ""]
        _ownerNumber    - Owner number of the sector    [NUMBER, defaults to 0]
        _amount         - Amount of soldiers to spawn   [NUMBER, defaults to 6]

    Returns:
        Spawned infantry squad [GROUP]
*/

params [
    ["_sector", "", [""]],
    ["_ownerNumber", 0, [0]],
    ["_amount", 6, [0]]
];

// Exit if no or invalid sector was given
if (_sector == "") exitWith {grpNull};
if !(_sector in KPLIB_sectors_all) exitWith {grpNull};

// Initialize local variables
private _grp = grpNull;
private _side = sideEmpty;
private _sectorPos = getMarkerPos _sector;
private _spawnPos = _sectorPos getPos [random 150, random 360];
private _soldierArray = [];
private _activeGarrisonRef = ([_sector, true] call KPLIB_fnc_garrison_getGarrison) select 2;

// Avoid spawn position on water
while {surfaceIsWater _spawnPos} do {
    _spawnPos = _sectorPos getPos [random 150, random 360];
};

// Set array to select soldier classnames from
switch (_ownerNumber) do {
    case 1: {_soldierArray = KPLIB_preset_oMilUnits; _side = KPLIB_preset_sideEnemy;};
    case 2: {_soldierArray = KPLIB_preset_lightSquad; _side = KPLIB_preset_sidePlayers;};
    default {_soldierArray = KPLIB_preset_oInfantry; _side = KPLIB_preset_sideEnemy;};
};

// Create group
_grp = createGroup [_side, true];

// Add soldiers to group
for "_i" from 1 to _amount do {
    _activeGarrisonRef pushBack (_grp createUnit [selectRandom _soldierArray, _spawnPos, [], 10, "NONE"]);
};

// FOR DEBUG: Add group to Zeus
{
    _x addCuratorEditableObjects [units _grp, true]
} forEach allCurators;

// Remove possible initialization waypoints
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
// Make sure every soldier is following the leader
{_x doFollow (leader _grp)} forEach (units _grp);

// 35% chance to garrison nearby buildings, otherwise act as patrol
if ((random 1 > 0.65) && !(_sector in KPLIB_sectors_tower)) then {
    [_grp, _spawnPos] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";
} else {
    [_grp, _sectorPos, 200, 4, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_taskPatrol;
};

// Return group
_grp
