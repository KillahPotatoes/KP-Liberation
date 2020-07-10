#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_deletePreset

    File: fn_cratefiller_deletePreset.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-07
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Deletes the selected preset.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlImport = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_IMPORTNAME;

// Read the import name
private _index = lbCurSel _ctrlImport;
private _importName = _ctrlImport lbText _index;

// Check for empty selection
if (_index isEqualTo -1) exitWith {
    [localize "STR_KPLIB_HINT_SELECTION"] call CBA_fnc_notify;
};

// Read the presets from profileNamespace
private _import = profileNamespace getVariable ["KPLIB_cratefiller_preset", []];

_import deleteAt (_import findIf {(_x select 0) isEqualTo _importName});

// Save the inventory into profileNamespace
profileNamespace setVariable ["KPLIB_cratefiller_preset", _import];
saveProfileNamespace;

[] call KPLIB_fnc_cratefiller_showPresets;

true
