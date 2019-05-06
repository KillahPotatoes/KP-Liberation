#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_showPresets

    File: fn_cratefiller_showPresets.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Reads all saved presets and lists them.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlImport = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_IMPORTNAME;

// Reset variables
lbClear _ctrlImport;

// Read the presets from profileNamespace
private _import = profileNamespace getVariable ["KPLIB_cratefiller_preset", []];

// Fill controls
{
    _ctrlImport lbAdd (_x select 0);
} forEach _import;

true
