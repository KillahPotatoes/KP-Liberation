#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_logistic_recycleTarget

    File: fn_logistic_recycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-31
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Recycles the selected vehicle.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG;
private _ctrlVehicleList = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_COMBOVEHICLES;
private _ctrlSupplyValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_SUPPLYREFUNDVALUE;
private _ctrlAmmoValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_AMMOREFUNDVALUE;
private _ctrlFuelValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_FUELREFUNDVALUE;
private _recycleButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_BUTTONRECYCLE;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;
private _supplyValue = parseNumber (ctrlText _ctrlSupplyValue);
private _ammoValue = parseNumber (ctrlText _ctrlAmmoValue);
private _fuelValue = parseNumber (ctrlText _ctrlFuelValue);

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;

// Variables
private _vehicles = LGVAR("Vehicles", []);
private _vehicleIndex = _vehicles findIf {_x select 0 isEqualTo _type};
private _damage = 1;
private _ammo = 1;
private _fuel = 1;

// Check for the influence params
if (KPLIB_param_damageInfluence) then {
    _damage = (1 - damage _vehicle);
};

if (KPLIB_param_ammoInfluence) then {
    private _ammoState = {_x select 2 != 0} count magazinesAllTurrets _vehicle;
    if (_ammoState > 0) then {
        private _ammoMax = count magazinesAllTurrets _vehicle;
        _ammo = _ammoState / _ammoMax;
    } else {
        _ammo = 0;
    };
};

if (KPLIB_param_fuelInfluence) then {
    _fuel = fuel _vehicle;
};

// Check if the Vehicle state has changed and exit
private _supplyValueCheck = 0;
private _ammoValueCheck = 0;
private _fuelValueCheck = 0;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;

if !(_vehicleIndex isEqualTo -1) then {
    private _vehicleArray = _vehicles select _vehicleIndex;
    _supplyValueCheck = (round ((_vehicleArray select 1) * (KPLIB_param_recycleFactor / 100) * _damage));
    _ammoValueCheck = (round ((_vehicleArray select 2) * (KPLIB_param_recycleFactor / 100) * _ammo));
    _fuelValueCheck = (round ((_vehicleArray select 3) * (KPLIB_param_recycleFactor / 100) * _fuel));
} else {
    _supplyValueCheck = (KPLIB_param_refundSupply * _damage);
    _ammoValueCheck = (KPLIB_param_refundAmmo * _ammo);
    _fuelValueCheck = (KPLIB_param_refundFuel * _fuel);
};

if (
    !(_supplyValue isEqualTo _supplyValueCheck) ||
    !(_ammoValue isEqualTo _ammoValueCheck) ||
    !(_fuelValue isEqualTo _fuelValueCheck) ||
    (((getMarkerPos _nearFOB) distance2D _vehicle) > KPLIB_param_fobRange)
) exitWith {
    _recycleButton ctrlEnable false;
    [
        ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
        [localize "STR_KPLIB_HINT_VEHICLECHANGES"]
    ] call CBA_fnc_notify;
};

// Pay the refund
private _storage = objNull;
private _crate = objNull;
private _storages = [getMarkerPos _nearFOB, KPLIB_param_fobRange] call KPLIB_fnc_resources_getStorages;

[_nearFOB, _supplyValue, _ammoValue, _fuelValue] remoteExecCall ["KPLIB_fnc_resources_refund", 2];

// Delete the vehicle
deleteVehicle _vehicle;

[KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG, KPLIB_IDC_LOGISTIC_RECYCLE_COMBOVEHICLES] call KPLIB_fnc_logistic_refreshTargets;

true
