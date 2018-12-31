/*
    KPLIB_fnc_res_getStorageValue

    File: fn_res_getStorageValue.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets the amount of resources from the stored crates of a given storage.

    Parameter(s):
        _storage - Storage which should be ordered [OBJECT, defaults to objNull]

    Returns:
        Amount of supplies, ammo and fuel [ARRAY]
*/

params [
    ["_storage", objNull, [objNull]]
];

// Exit if no storage was given
if (isNull _storage) exitWith {[0, 0, 0]};

// Fetch the amount of resources from storage
private _supplies = 0;
private _ammo = 0;
private _fuel = 0;
{
    switch (typeOf _x) do {
        case KPLIB_preset_crateSupplyE;
        case KPLIB_preset_crateSupplyF: {_supplies = _supplies + (_x getVariable ["KPLIB_res_crateValue", 0])};
        case KPLIB_preset_crateAmmoE;
        case KPLIB_preset_crateAmmoF: {_ammo = _ammo + (_x getVariable ["KPLIB_res_crateValue", 0])};
        case KPLIB_preset_crateFuelE;
        case KPLIB_preset_crateFuelF: {_fuel = _fuel + (_x getVariable ["KPLIB_res_crateValue", 0])};
    };
} forEach (attachedObjects _storage);

[_supplies, _ammo, _fuel]
