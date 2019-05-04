#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_logistic_selectRecycleTarget

    File: fn_logistic_selectRecycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-27
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Selects the vehicle from the combo cox and fills the dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG;
private _ctrlVehicleList = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_COMBOVEHICLES;
private _ctrlSupplyFactor = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_SUPPLYSTATEVALUE;
private _ctrlSupplyValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_SUPPLYREFUNDVALUE;
private _ctrlAmmoFactor = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_AMMOSTATEVALUE;
private _ctrlAmmoValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_AMMOREFUNDVALUE;
private _ctrlFuelFactor = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_FUELSTATEVALUE;
private _ctrlFuelValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_FUELREFUNDVALUE;
private _recycleButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RECYCLE_BUTTONRECYCLE;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

// Check for empty selection
if (_vehicleId isEqualTo "placeholder") exitWith {
    _ctrlSupplyFactor ctrlSetText "---";
    _ctrlSupplyValue ctrlSetText "---";
    _ctrlAmmoFactor ctrlSetText "---";
    _ctrlAmmoValue ctrlSetText "---";
    _ctrlFuelFactor ctrlSetText "---";
    _ctrlFuelValue ctrlSetText "---";
};

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

// Fill the controls
private _supplyValue = 0;
private _ammoValue = 0;
private _fuelValue = 0;

if !(_vehicleIndex isEqualTo -1) then {
    private _vehicleArray = _vehicles select _vehicleIndex;
    _supplyValue = (round ((_vehicleArray select 1) * (KPLIB_param_recycleFactor / 100) * _damage));
    _ctrlSupplyValue ctrlSetText str _supplyValue;
    _ammoValue = (round ((_vehicleArray select 2) * (KPLIB_param_recycleFactor / 100) * _ammo));
    _ctrlAmmoValue ctrlSetText str _ammoValue;
    _fuelValue = (round ((_vehicleArray select 3) * (KPLIB_param_recycleFactor / 100) * _fuel));
    _ctrlFuelValue ctrlSetText str _fuelValue;
} else {
    _ctrlSupplyValue ctrlSetText str (KPLIB_param_refundSupply * _damage);
    _ctrlAmmoValue ctrlSetText str (KPLIB_param_refundAmmo * _ammo);
    _ctrlFuelValue ctrlSetText str (KPLIB_param_refundFuel * _fuel);
};

_ctrlSupplyFactor ctrlSetText str (round (_damage * 100)) + " %";
_ctrlAmmoFactor ctrlSetText str (round (_ammo * 100)) + " %";
_ctrlFuelFactor ctrlSetText str (round (_fuel * 100)) + " %";

// Check if there's enough empty storage capacity
private _supplyCrates = ceil (_supplyValue / KPLIB_param_crateVolume);
private _ammoCrates = ceil (_ammoValue / KPLIB_param_crateVolume);
private _fuelCrates = ceil (_fuelValue / KPLIB_param_crateVolume);
private _crateCount = _supplyCrates + _ammoCrates + _fuelCrates;
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _storages = [getMarkerPos _nearFOB, KPLIB_param_fobRange] call KPLIB_fnc_resources_getStorages;
private _crateCapacity = 0;

{
    _crateCapacity = _crateCapacity + ([_x] call KPLIB_fnc_resources_getStorageSpace);
} forEach _storages;

if (_crateCapacity < _crateCount) then {
    _recycleButton ctrlEnable false;
    [
        ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
        [localize "STR_KPLIB_HINT_NOTENOUGHSTORAGE"]
    ] call CBA_fnc_notify;
} else {
    _recycleButton ctrlEnable true;
};

// Spawn camera object
camUseNVG false;
showCinemaBorder false;
private _cam = "camera" camCreate (getpos _vehicle);
_cam cameraEffect ["internal", "front", "rtt"];
KPLIB_logistic_activeCam = _cam;
_cam camSetTarget _vehicle;
_cam camSetFov 0.5;
_cam camSetPos ((_vehicle getRelPos [15, 0]) vectorAdd [0, 0, 90]);
_cam camCommit 0;

[_cam, _vehicle, 36, 60] call KPLIB_fnc_common_cameraCircleTarget;

true
