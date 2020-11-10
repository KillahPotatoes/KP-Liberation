/*
    File: fn_fillStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-05-04
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Fills given storage with given amounts of resources.

    Parameter(s):
        _supply     - Amount of supply resource                                         [NUMBER, defaults to 0]
        _ammo       - Amount of ammo resource                                           [NUMBER, defaults to 0]
        _fuel       - Amount of fuel resource                                           [NUMBER, defaults to 0]
        _storage    - Storage object to fill                                            [OBJECT, defaults to objNull]
        _delay      - Enable a small delay between crate create and attach to storage   [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_supply", 0, [0]],
    ["_ammo", 0, [0]],
    ["_fuel", 0, [0]],
    ["_storage", objNull, [objNull]],
    ["_delay", false, [false]]
];

if (isNull _storage) exitWith {["Null object given"] call BIS_fnc_error; false};

// Make sure it's scheduled, if delay is enabled
if (_delay && {!canSuspend}) exitWith {_this spawn KPLIB_fnc_fillStorage};

private _amount = 0;
private _crate = objNull;
private _pos = getPos _storage;

{
    while {_x > 0} do {
        _amount = 100 min _x;
        _x = _x - _amount;

        _crate = [
            KPLIB_crates select _forEachIndex,
            _amount,
            _pos
        ] call KPLIB_fnc_createCrate;

        if (_delay) then {sleep 0.1;};

        [_crate, _storage] call KPLIB_fnc_crateToStorage;
    };
} forEach [_supply, _ammo, _fuel];

true
