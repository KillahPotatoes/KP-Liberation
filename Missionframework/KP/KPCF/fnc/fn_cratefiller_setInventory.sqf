/*
    KPLIB_fnc_cratefiller_setInventory

    File: fn_cratefiller_setInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Adds the items to the active storage.

    Parameter(s):
        _inventory - Inventory data which should be applied to the active storage [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_inventory", [], [[]]]
];
// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;

// Check if the storage is in range
if ((_storage distance2D (getMarkerPos _nearFOB)) > KPLIB_param_fobRange) exitWith {
    [localize "STR_KPLIB_HINT_RANGE"] call CBA_fnc_notify;
    [] remoteExecCall ["KPLIB_fnc_cratefiller_getNearStorages", (allPlayers - entities "HeadlessClient_F")];
};

// Check if the storage will be empty
if (count _inventory isEqualTo 0) exitWith {
    clearWeaponCargoGlobal _storage;
    clearMagazineCargoGlobal _storage;
    clearItemCargoGlobal _storage;
    clearBackpackCargoGlobal _storage;
    [] remoteExecCall ["KPLIB_fnc_cratefiller_showInventory", (allPlayers - entities "HeadlessClient_F")];
};

// Clear the storage
clearWeaponCargoGlobal _storage;
clearMagazineCargoGlobal _storage;
clearItemCargoGlobal _storage;
clearBackpackCargoGlobal _storage;

// Count the variable index
private _count = count _inventory;
private _item = "";
private _amount = 0;

// Adapt the cargo into KPCF variable
for "_i" from 0 to (_count-1) do {
    _item = (_inventory select _i) select 1;
    _amount = (_inventory select _i) select 2;
    if (!(_storage canAdd [_item, _amount])) exitWith {};
    if (((_inventory select _i) select 1) isKindOf "Bag_Base") then {
        _storage addBackpackCargoGlobal [_item, _amount];
    } else {
        _storage addItemCargoGlobal [_item, _amount];
    };
};

[] remoteExecCall ["KPLIB_fnc_cratefiller_showInventory", (allPlayers - entities "HeadlessClient_F")];

true
