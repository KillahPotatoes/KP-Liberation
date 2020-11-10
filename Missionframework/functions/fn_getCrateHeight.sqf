/*
    File: fn_getCrateHeight.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-26
    Last Update: 2020-03-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the height for the relative positioning of a crate.

    Parameter(s):
        _crateClass - Classname of the crate to get the height for [STRING, defaults to ""]

    Returns:
        Height for given class [NUMBER]
*/

params [
    ["_crateClass", "", [""]]
];

if (_crateClass isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; 0};

private _height = 0;

switch (_crateClass) do {
    case KP_liberation_supply_crate: {_height = 0.4;};
    case KP_liberation_ammo_crate: {_height = 0.6;};
    case KP_liberation_fuel_crate: {_height = 0.3;};
    default {_height = 0.6;};
};

_height
