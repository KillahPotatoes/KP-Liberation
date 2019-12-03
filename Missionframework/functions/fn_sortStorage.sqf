/*
    File: fn_sortStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-06-09
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Stack and sort the resources inside a storage area.

    Parameter(s):
        _storage - Storage to sort [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_storage"];

private _pos = getPos _storage;

private _supply = 0;
private _ammo = 0;
private _fuel = 0;

{
    switch ((typeOf _x)) do {
        case KP_liberation_supply_crate: {_supply = _supply + (_x getVariable ["KP_liberation_crate_value",0]);};
        case KP_liberation_ammo_crate: {_ammo = _ammo + (_x getVariable ["KP_liberation_crate_value",0]);};
        case KP_liberation_fuel_crate: {_fuel = _fuel + (_x getVariable ["KP_liberation_crate_value",0]);};
        default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
    };
    detach _x;
    deleteVehicle _x;
} forEach (attachedObjects _storage);

sleep 0.5;

[_supply, _ammo, _fuel, _storage, true] spawn KPLIB_fnc_fillStorage;

true
