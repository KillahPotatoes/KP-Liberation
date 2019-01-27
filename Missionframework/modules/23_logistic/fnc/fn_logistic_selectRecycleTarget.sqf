/*
    KPLIB_fnc_selectRecycleTarget

    File: fn_logistic_selectRecycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-27
    Last Update: 2019-01-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Selects the vehicle from the combo cox and fills the dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 7580232;
private _ctrlVehicleList = _dialog displayCtrl 68740;
private _ctrlSupply = _dialog displayCtrl 68741;
private _ctrlAmmo = _dialog displayCtrl 68742;
private _ctrlFuel = _dialog displayCtrl 68743;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _data = _ctrlVehicleList lbData _index;

// Fill the controls


true
