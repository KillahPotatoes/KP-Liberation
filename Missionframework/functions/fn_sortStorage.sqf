/*
    File: fn_sortStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-06-09
    Last Update: 2020-04-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Stack and sort the resources inside a storage area.

    Parameter(s):
        _storage - Storage to sort [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_storage", objNull, [objNull]]
];

if (isNull _storage) exitWith {["Null object given"] call BIS_fnc_error; false};

private _supply = 0;
private _ammo = 0;
private _fuel = 0;

{
    switch (typeOf _x) do {
        case KP_liberation_supply_crate: {_supply = _supply + (_x getVariable ["KP_liberation_crate_value",0]);};
        case KP_liberation_ammo_crate: {_ammo = _ammo + (_x getVariable ["KP_liberation_crate_value",0]);};
        case KP_liberation_fuel_crate: {_fuel = _fuel + (_x getVariable ["KP_liberation_crate_value",0]);};
        default {[format ["Invalid object (%1) at storage area", (typeOf _x)], "ERROR"] call KPLIB_fnc_log;};
    };
    detach _x;
    deleteVehicle _x;
} forEach (attachedObjects _storage);

[_supply, _ammo, _fuel, _storage, true] spawn KPLIB_fnc_fillStorage;

true
