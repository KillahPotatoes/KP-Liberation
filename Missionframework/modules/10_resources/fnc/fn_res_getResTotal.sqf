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

// Exit if no location was given
if (_location isEqualTo "") exitWith {[0, 0, 0]};

// Get all storage areas in the vicinity of the marker
private _storages = nearestObjects [markerPos _location, KPLIB_res_storageClasses, KPLIB_param_fobRange];

// Get the stored resource values
private _resources = [0, 0, 0];
private _supplies = 0;
private _ammo = 0;
private _fuel = 0;
{
    _resources = [_x] call KPLIB_fnc_res_getStorageValue;
    _supplies = _supplies + (_resources select 0);
    _ammo = _ammo + (_resources select 1);
    _fuel = _fuel + (_resources select 2);
} forEach _storages;

// Return values
[_supplies, _ammo, _fuel]
