#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_openRecycleDialog

    File: fn_logistic_openRecycleDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-25
    Last Update: 2019-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the logistic recycle dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_recycle";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG;
private _recycleButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_FUELSTATEVALUE;

_recycleButton ctrlEnable false;

// Get near vehicles
[KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG, KPLIB_IDC_LOGISTIC_RECYCLE_COMBOVEHICLES] call KPLIB_fnc_logistic_refreshTargets;

true
