/*
    KPLIB_fnc_logi_openResupplyDialog

    File: fn_logi_openResupplyDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-21
    Last Update: 2019-02-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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
private _dialog = findDisplay 7580233;
private _resupplyButton = _dialog displayCtrl 68747;

_resupplyButton ctrlEnable false;

// Get near vehicles
[7580233, 68740] call KPLIB_fnc_logi_refreshTargets;

true
