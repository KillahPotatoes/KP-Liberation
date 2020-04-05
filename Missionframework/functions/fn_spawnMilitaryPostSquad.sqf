/*
    File: fn_spawnMilitaryPostSquad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns soldiers inside military cargo towers around given position.

    Parameter(s):
        _pos - Center position of the area to look for military cargo towers [ARRAY, defaults to [0, 0, 0]]

    Returns:
        Spawned units [ARRAY]
*/

params [
    ["_pos", [0, 0, 0], [[]]]
];

if (_pos isEqualTo [0, 0, 0]) exitWith {["No or zero pos given"] call BIS_fnc_error; []};

// Get all military patrol towers near given position
private _allPosts = (
    nearestObjects [_pos, ["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V4_F"], GRLIB_capture_size, true]
) select {alive _x};

// Exit if no patrol towers were found
if (_allPosts isEqualTo []) exitWith {[]};

// Spawn units
private _grp = createGroup [GRLIB_side_enemy, true];
private _unit = objNull;
private _units = [];
{
    _unit = [[opfor_marksman, opfor_machinegunner] select (random 100 > 50), _pos, _grp] call KPLIB_fnc_createManagedUnit;
    _unit setdir (180 + (getdir _x));
    _unit setpos (([_x] call BIS_fnc_buildingPositions) select 1);
    [_unit] spawn building_defence_ai;
    _unit setUnitPos 'UP';
    _units pushback _unit;
} forEach _allPosts;

_units
