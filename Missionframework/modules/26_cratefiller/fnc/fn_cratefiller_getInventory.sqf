#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_getInventory

    File: fn_cratefiller_getInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Gets all inventory items of the storage.

    Parameter(s):
        NONE

    Returns:
        Inventory of the active storage [ARRAY]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;

// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;

// Check for an active storage
private _cargo = [];
if (isNull _storage) exitWith {
    _cargo
};

// Get all cargo
private _item = getItemCargo _storage;
private _weapon = getWeaponCargo _storage;
private _magazine = getMagazineCargo _storage;
private _backpack = getBackpackCargo _storage;

_cargo = _item;
(_cargo select 0) append (_weapon select 0);
(_cargo select 1) append (_weapon select 1);
(_cargo select 0) append (_magazine select 0);
(_cargo select 1) append (_magazine select 1);
(_cargo select 0) append (_backpack select 0);
(_cargo select 1) append (_backpack select 1);

// Count the variable index
private _count = count (_cargo select 0);

private _config = "";

// Adapt the cargo
private _finalCargo = [];
for "_i" from 0 to (_count - 1) do {
    _config = [(_cargo select 0) select _i] call KPLIB_fnc_cratefiller_getConfigPath;
    _finalCargo pushBack [
        (getText (_config >> "displayName")),
        (_cargo select 0) select _i,
        (_cargo select 1) select _i
    ];
};

_finalCargo sort true;

_finalCargo
