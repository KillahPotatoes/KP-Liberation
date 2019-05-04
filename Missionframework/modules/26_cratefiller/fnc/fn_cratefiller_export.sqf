#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_export

    File: fn_cratefiller_export.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-07
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Exports the active inventory.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlExport = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_EXPORTNAME;

// Read the presets from profileNamespace
private _preset = profileNamespace getVariable ["KPLIB_cratefiller_preset", []];

// Read the export name
private _exportName = ctrlText _ctrlExport;
_ctrlExport ctrlSetText "";

// Check if the name is empty
if (_exportName isEqualTo "") exitWith {
    [localize "STR_KPLIB_HINT_NAME"] call CBA_fnc_notify;
};

// Check if the variable is empty
if !(_preset isEqualTo []) then {
    // Check if the exportname already exists
    _preset deleteAt (_preset findIf {(_x select 0) isEqualTo _exportName});
};

// Get the storage inventory
private _inventory = [] call KPLIB_fnc_cratefiller_getInventory;

// Save the inventory into profileNamespace
_preset pushBack [_exportName, +_inventory];

profileNamespace setVariable ["KPLIB_cratefiller_preset", _preset];
saveProfileNamespace;

[] call KPLIB_fnc_cratefiller_showPresets;

true
