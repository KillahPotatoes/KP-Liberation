/*
    File: fn_spawnRegularSquad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-05-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns a regular enemy squad with given soldier classnames at given sector.

    Parameter(s):
        _sector     - Sector to spawn the squad at          [STRING, defaults to ""]
        _classnames - Classnames of units to spawn in squad [ARRAY, defaults to []]

    Returns:
        Created squad [GROUP]
*/

params [
    ["_sector", "", [""]],
    ["_classnames", [], [[]]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; grpNull};

// Get spawn position for squad
private _sectorPos = (markerPos _sector) getPos [random 100, random 360];
private _spawnPos = [];
private _i = 0;
while {_spawnPos isEqualTo []} do {
    _i = _i + 1;
    _spawnPos = (_sectorPos getPos [random 50, random 360]) findEmptyPosition [5, 100, "B_Heli_Light_01_F"];
    if (_i isEqualTo 10) exitWith {};
};

if (_spawnPos isEqualTo zeroPos) exitWith {
    ["No suitable spawn position found."] call BIS_fnc_error;
    [format ["Couldn't find infantry spawn position for sector %1", _sector], "WARNING"] call KPLIB_fnc_log;
    grpNull
};

// Spawn units of squad
private _corrected_amount = round ((count _classnames) * ([] call KPLIB_fnc_getOpforFactor));
private _grp = createGroup [GRLIB_side_enemy, true];
{
    if (_forEachIndex < _corrected_amount) then {
        [_x, _spawnPos, _grp] call KPLIB_fnc_createManagedUnit;
    };
} forEach _classnames;

_grp
