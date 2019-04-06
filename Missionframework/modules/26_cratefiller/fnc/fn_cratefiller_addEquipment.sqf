/*
    KPLIB_fnc_cratefiller_addEquipment

    File: fn_cratefiller_addEquipment.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds the given amount of the selected item to the inventory.

    Parameter(s):
        _amount - Amount of the equipment which will be added [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_amount", 0, [0]]
];

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlEquipment = _dialog displayCtrl 75812;

// Read controls
private _index = lbCurSel _ctrlEquipment;

// Check for empty selection
if (_index isEqualTo -1) exitWith {};

// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;
private _nearFOB = [player] call KPLIB_fnc_common_getPlayerFob;

// Check if the storage is in range
if ((_storage distance2D (getMarkerPos _nearFOB)) > KPLIB_param_fobRange) exitWith {
    [localize "STR_KPLIB_HINT_RANGE"] call CBA_fnc_notify;
    [] remoteExecCall ["KPLIB_fnc_cratefiller_getNearStorages", (allPlayers - entities "HeadlessClient_F")];
};

// Item selection
private _item = _ctrlEquipment lbData _index;

// Check for enough inventory capacity
if (!(_storage canAdd [_item, _amount])) exitWith {
    [localize "STR_KPLIB_HINT_FULL"] call CBA_fnc_notify;
};

// Add the given item
if (_item isKindOf "Bag_Base") then {
    _storage addBackpackCargoGlobal [_item, _amount];
} else {
    _storage addItemCargoGlobal [_item, _amount];
};

[] remoteExecCall ["KPLIB_fnc_cratefiller_showInventory", (allPlayers - entities "HeadlessClient_F")];

private _config = [_item] call KPLIB_fnc_cratefiller_getConfigPath;
private _name = (getText (configFile >> _config >> _item >> "displayName"));
private _picture = (getText (configFile >> _config >> _item >> "picture"));
[
    [_picture, 2],
    [format [localize "STR_KPLIB_HINT_ADDED", _name, _amount]]
] call CBA_fnc_notify;

true
