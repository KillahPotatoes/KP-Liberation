/*
    File: fn_spawnBuildingSquad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns given amount of infantry in buildings of given sector at given building positions.

    Parameter(s):
        _type       - Type of infantry. Either "militia" or "army"  [STRING, defaults to "army"]
        _amount     - Amount of infantry units to spawn             [NUMBER, defaults to 0]
        _positions  - Array of building positions                   [ARRAY, defaults to []]
        _sector     - Sector where to spawn the units               [STRING, defaults to ""]

    Returns:
        Spawned units [ARRAY]
*/

params [
    ["_type", "army", [""]],
    ["_amount", 0, [0]],
    ["_positions", [], [[]]],
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; []};

// Get classnames array
private _classnames = [[] call KPLIB_fnc_getSquadComp, militia_squad] select (_type == "militia");

// Adjust amount, if needed
if (_amount > floor ((count _positions) * GRLIB_defended_buildingpos_part)) then {
    _amount = floor ((count _positions) * GRLIB_defended_buildingpos_part)
};

// Get a random composition of classnames
private _toSpawn = [];
for "_i" from 1 to _amount do {_toSpawn pushBack (selectRandom _classnames);};

// Get random building positions
private _posToSet = [];
for "_i" from 1 to (count _toSpawn) do {
    _posToSet pushBack (_positions deleteAt (random (floor (count _positions) - 1)));
};

// Spawn units
private _grp = createGroup [GRLIB_side_enemy, true];
private _pos = markerPos _sector;
private _unit = objNull;
private _units = [];
{
    // Create new group, if current group has 10 units
    if (_forEachIndex > 9) then {
        _grp = createGroup [GRLIB_side_enemy, true];
    };

    _unit = [_x, _pos, _grp] call KPLIB_fnc_createManagedUnit;
    _unit setDir (random 360);
    _unit setPos (_posToSet select _forEachIndex);
    [_unit, _sector] spawn building_defence_ai;
    _units pushBack _unit;
} forEach _toSpawn;

_units
