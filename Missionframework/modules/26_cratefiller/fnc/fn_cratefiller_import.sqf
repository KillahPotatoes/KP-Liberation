/*
    KPLIB_fnc_cratefiller_import

    File: fn_cratefiller_import.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-07
    Last Update: 2019-04-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Imports the selected inventory.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlImport = _dialog displayCtrl 75821;

// Get the storage object
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;

// Check if there's an active storage
if (isNull _storage) exitWith {
    //hint localize "STR_KPCF_HINTNOSTORAGE";
};

// Read the import name
private _index = lbCurSel _ctrlImport;
private _importName = _ctrlImport lbText _index;

// Check for empty selection
if (_index isEqualTo -1) exitWith {
    //hint localize "STR_KPCF_HINTSELECTION";
};

// Get the storage inventory
private _inventory = [] call KPLIB_fnc_cratefiller_getInventory;

// Read the presets from profileNamespace
private _import = profileNamespace getVariable ["KPLIB_cratefiller_preset", []];
private _index = _import findIf {(_x select 0) isEqualTo _importName};
_inventory append ((_import select _index) select 1);

[_inventory] call KPLIB_fnc_cratefiller_setInventory;

true
