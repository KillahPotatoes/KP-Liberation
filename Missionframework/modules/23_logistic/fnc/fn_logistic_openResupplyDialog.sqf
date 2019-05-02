#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_openResupplyDialog

    File: fn_logistic_openResupplyDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-21
    Last Update: 2019-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the logistic resupply dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_resupply";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RESUPPLY_DIALOG;
private _ctrlCargo = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOCARGO;
private _resupplyButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_BUTTONRESUPPLY;

_resupplyButton ctrlEnable false;

// Add the cargo variants
private _index = _ctrlCargo lbAdd "----------";
_ctrlCargo lbSetData [_index, "placeholder"];
_ctrlCargo lbSetCurSel _index;
_index = _ctrlCargo lbAdd localize "STR_KPLIB_DIALOG_RESUPPLY_CARGOAMMO";
_ctrlCargo lbSetData [_index, "AMMO"];
_index = _ctrlCargo lbAdd localize "STR_KPLIB_DIALOG_RESUPPLY_CARGOFUEL";
_ctrlCargo lbSetData [_index, "FUEL"];

// Get near vehicles
[KPLIB_IDC_LOGISTIC_RESUPPLY_DIALOG, KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOVEHICLES] call KPLIB_fnc_logistic_refreshTargets;

true
