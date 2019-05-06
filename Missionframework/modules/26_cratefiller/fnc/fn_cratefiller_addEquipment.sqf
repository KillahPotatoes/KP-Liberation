#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_cratefiller_addEquipment

    File: fn_cratefiller_addEquipment.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Adds the given amount of the selected item to the inventory.

    Parameter(s):
        _controlId - Id of the control which is selected [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_controlId", 0, [0]]
];

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlActive = _dialog displayCtrl _controlId;

// Read controls
private _indexActive = lbCurSel _ctrlActive;

// Check for empty selection
if (_indexActive isEqualTo -1 || ((lnbSize _ctrlActive) select 0) isEqualTo 0) exitWith {
    [localize "STR_KPLIB_HINT_SELECTION"] call CBA_fnc_notify;
};

// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _inventory = [] call KPLIB_fnc_cratefiller_getInventory;

// Check if the storage is in range
if ((_storage distance2D (getMarkerPos _nearFOB)) > KPLIB_param_fobRange) exitWith {
    [localize "STR_KPLIB_HINT_RANGE"] call CBA_fnc_notify;
    [] remoteExecCall ["KPLIB_fnc_cratefiller_getNearStorages", (allPlayers - entities "HeadlessClient_F")];
};

// Variables
private _item = "";

if (_controlId isEqualTo KPLIB_IDC_CRATEFILLER_INVENTORYLIST) then {
    // Item selection
    _item = (_inventory select _indexActive) select 1;
} else {
    private _cat = CCGVAR("activeCat", "");
    private _catStuff = CGVAR(_cat, []);
    _item = (_catStuff select _indexActive) select 1;
};

// Check for enough inventory capacity
if (!(_storage canAdd _item)) exitWith {
    CBA_ui_notifyQueue = [];
    [localize "STR_KPLIB_HINT_FULL"] call CBA_fnc_notify;
};

// Add the given item
if (_item isKindOf "Bag_Base") then {
    _storage addBackpackCargoGlobal [_item, 1];
} else {
    _storage addItemCargoGlobal [_item, 1];
};

[] remoteExecCall ["KPLIB_fnc_cratefiller_showInventory", (allPlayers - entities "HeadlessClient_F")];

private _config = [_item] call KPLIB_fnc_cratefiller_getConfigPath;
private _name = (getText (_config >> "displayName"));
private _picture = (getText (_config >> "picture"));
CBA_ui_notifyQueue = [];
[
    [_picture, 2],
    [format [localize "STR_KPLIB_HINT_ADDED", _name, 1]]
] call CBA_fnc_notify;

true
