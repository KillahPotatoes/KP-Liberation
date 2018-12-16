/*
    KPLIB_fnc_res_getResTotal

    File: fn_res_getResTotal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets total amount of resources from a given sector or FOB.

    Parameter(s):
        _location - Sector or FOB marker to get resources from [STRING, defaults to ""]

    Returns:
        Amount of supplies, ammo and fuel [ARRAY]
*/

params [
    ["_location", "", [""]]
];

// Get all storage areas in the vicinity of the marker
private _storages = nearestObjects [markerPos _location, KPLIB_res_storageClasses, KPLIB_param_fobRange];

// Get the stored resource values
private _supplies = 0;
private _ammo = 0;
private _fuel = 0;
{
    {
        switch (typeOf _x) do {
            case KPLIB_preset_crateSupplyE;
            case KPLIB_preset_crateSupplyF: {_supplies = _supplies + (_x getVariable ["KPLIB_res_crateValue", 0])};
            case KPLIB_preset_crateAmmoE;
            case KPLIB_preset_crateAmmoF: {_ammo = _ammo + (_x getVariable ["KPLIB_res_crateValue", 0])};
            case KPLIB_preset_crateFuelE;
            case KPLIB_preset_crateFuelF: {_fuel = _fuel + (_x getVariable ["KPLIB_res_crateValue", 0])};
        };
    } forEach (attachedObjects _x);
} forEach _storages;

// Return values
[_supplies, _ammo, _fuel]
