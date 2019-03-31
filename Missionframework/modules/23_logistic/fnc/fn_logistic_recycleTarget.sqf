/*
    KPLIB_fnc_logistic_recycleTarget

    File: fn_logistic_recycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-31
    Last Update: 2019-03-31
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

// Pay the refund
private _storage = objNull;
private _crate = objNull;
private _nearFOB = [player] call KPLIB_fnc_common_getPlayerFob;
private _storages = [getMarkerPos _nearFOB, KPLIB_param_fobRange] call KPLIB_fnc_res_getStorages;

private _supplyValue = KPLIB_logistic_supplyValue;
private _ammoValue = KPLIB_logistic_ammoValue;
private _fuelValue = KPLIB_logistic_fuelValue;

[_nearFOB, _supplyValue, _ammoValue, _fuelValue] remoteExecCall ["KPLIB_fnc_res_refund", 2];

// Delete the vehicle
deleteVehicle _vehicle;

[7580232, 68740] call KPLIB_fnc_logistic_refreshTargets;

true
