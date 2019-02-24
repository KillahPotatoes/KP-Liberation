/*
    KPLIB_fnc_logi_recycleTarget

    File: fn_logi_recycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-31
    Last Update: 2019-02-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Recycles the selected vehicle.

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
private _recycleButton = _dialog displayCtrl 68745;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;

// Delete the vehicle
deleteVehicle _vehicle;

/* TODO:
- Implement Resource refund
*/

[7580232, 68740] call KPLIB_fnc_logi_refreshTargets;

true
