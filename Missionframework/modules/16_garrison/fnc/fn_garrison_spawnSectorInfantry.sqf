/*
    KPLIB_fnc_garrison_spawnSectorInfantry

    File: fn_garrison_spawnSectorInfantry.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-12-21
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
    case 1: {_soldierArray = KPLIB_preset_unitsPlE; _side = KPLIB_preset_sideE;};
    case 2: {_soldierArray = KPLIB_preset_unitsPlF; _side = KPLIB_preset_sideF;};
    default {_soldierArray = KPLIB_preset_unitsPlE; _side = KPLIB_preset_sideE;};
};

// Remove unwanted soldier types
_soldierArray = _soldierArray - [
    ["rsCrewmanHeli", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsCrewmanVeh", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsPilotHeli", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsPilotJet", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsParatrooper", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsSurvivor", _side] call KPLIB_fnc_common_getPresetClass
];

// Fetch unit classnames
for "_i" from 1 to _amount do {
    _classnames pushBack (selectRandom _soldierArray);
};

// Create group
_grp = [_side, _classnames, _spawnPos] call KPLIB_fnc_common_createGroup;

// Add units of created group to active garrison array
{
    _activeGarrisonRef pushBack _x;
} forEach (units _grp);

// FOR DEBUG: Add group to Zeus
{
    _x addCuratorEditableObjects [units _grp, true]
} forEach allCurators;

// Remove possible initialization waypoints
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
// Make sure every soldier is following the leader
{_x doFollow (leader _grp)} forEach (units _grp);

// Order group to defend sector position
[_grp, _sectorPos, 150, 3, 0.25, 0.6] call CBA_fnc_taskDefend;

// Return group
_grp
