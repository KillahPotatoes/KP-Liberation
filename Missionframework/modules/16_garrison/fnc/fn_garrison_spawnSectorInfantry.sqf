/*
    KPLIB_fnc_garrison_spawnSectorInfantry

    File: fn_garrison_spawnSectorInfantry.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2019-04-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

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
if !(_sector in KPLIB_sectors_all) exitWith {grpNull};

// Initialize local variables
private _grp = grpNull;
private _side = sideEmpty;
private _sectorPos = getMarkerPos _sector;
private _spawnPos = _sectorPos getPos [random 150, random 360];
private _soldierArray = [];
private _classnames = [];
private _activeGarrisonRef = ([_sector, true] call KPLIB_fnc_garrison_getGarrison) select 2;

// Avoid spawn position on water
while {surfaceIsWater _spawnPos} do {
    _spawnPos = _sectorPos getPos [random 150, random 360];
};

// Set array to select soldier classnames from
switch (_ownerNumber) do {
    case 2: {_soldierArray = [KPLIB_preset_sideF] call KPLIB_fnc_common_getSoldierArray; _side = KPLIB_preset_sideF;};
    default {_soldierArray = [] call KPLIB_fnc_common_getSoldierArray; _side = KPLIB_preset_sideE;};
};

// Fetch unit classnames
for "_i" from 1 to _amount do {
    _classnames pushBack (selectRandom _soldierArray);
};

// Create group
_grp = [_classnames, _spawnPos, _side] call KPLIB_fnc_common_createGroup;

// Add units of created group to active garrison array
{
    _activeGarrisonRef pushBack _x;
} forEach (units _grp);

// !DEBUG! Add group to Zeus
/* {
    _x addCuratorEditableObjects [units _grp, true]
} forEach allCurators; */

// Remove possible initialization waypoints
{deleteWaypoint [_grp, 0];} forEach (waypoints _grp);
// Make sure every soldier is following the leader
{_x doFollow (leader _grp)} forEach (units _grp);

// Order group to defend sector position
[_grp, _sectorPos, 150, 3, 0.25, 0.6] call CBA_fnc_taskDefend;

// Return group
_grp
