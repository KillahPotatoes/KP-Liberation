/*
    KPLIB_fnc_cratefiller_removeEquipment

    File: fn_cratefiller_removeEquipment.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Removes the given amount of the selected item from the storage.

    Parameter(s):
        _amount - Amount of the equipment which will be removed [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_amount", 0, [0]]
];

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlInventory = _dialog displayCtrl 68748;

// Read controls
private _index = lbCurSel _ctrlInventory;

// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;

// Get the storage inventory
private _inventory = [] call KPLIB_fnc_cratefiller_getInventory;

// Check for empty selection
if (_index isEqualTo -1) exitWith {
    [localize "STR_KPLIB_HINT_SELECTION"] call CBA_fnc_notify;
};

// Check if the storage is in range
if ((_storage distance2D (getMarkerPos _nearFOB)) > KPLIB_param_fobRange) exitWith {
    [localize "STR_KPLIB_HINT_RANGE"] call CBA_fnc_notify;
    [] remoteExecCall ["KPLIB_fnc_cratefiller_getNearStorages", (allPlayers - entities "HeadlessClient_F")];
};

// Check for inventory clear
if (_amount isEqualTo 0) exitWith {
    _inventory = [];
    [_inventory] call KPLIB_fnc_cratefiller_setInventory;
    [localize "STR_KPLIB_HINT_CLEARFULL"] call CBA_fnc_notify;
};

// Item selection
private _item = ((_inventory select _index) select 1);

// New item amount
private _modify = (((_inventory select _index) select 2) - _amount);

// Check if the amount is negative
if (_modify < 0) then {
    _modify = 0;
};

// Modify array
(_inventory select _index) set [2, _modify];

[_inventory] call KPLIB_fnc_cratefiller_setInventory;

private _config = [_item] call KPLIB_fnc_cratefiller_getConfigPath;
private _name = (getText (_config >> "displayName"));
private _picture = (getText (_config >> "picture"));
[
    [_picture, 2],
    [format [localize "STR_KPLIB_HINT_UNLOAD", _name, _amount]]
] call CBA_fnc_notify;

true
