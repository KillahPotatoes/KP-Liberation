/*
    KPLIB_fnc_logi_openRecycleDialog

    File: fn_logi_openRecycleDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-25
    Last Update: 2019-01-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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
private _dialog = findDisplay 7580232;
private _recycleButton = _dialog displayCtrl 68745;

_recycleButton ctrlEnable false;

// Get near vehicles
[] call KPLIB_fnc_logi_refreshVehicles;

true
