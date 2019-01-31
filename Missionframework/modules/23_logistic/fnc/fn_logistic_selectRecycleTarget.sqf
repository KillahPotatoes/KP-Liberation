/*
    KPLIB_fnc_selectRecycleTarget

    File: fn_logistic_selectRecycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-27
    Last Update: 2019-01-31
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
private _recycleButton = _dialog displayCtrl 68745;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

// Check for empty selection
if (_vehicleId isEqualTo "placeholder") exitWith {
    _ctrlSupply ctrlSetText "---";
    _ctrlAmmo ctrlSetText "---";
    _ctrlFuel ctrlSetText "---";
};

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;
private _vehicles = KPLIB_logistic_data getVariable ["Vehicles", []];
private _vehicleArray = _vehicles select (_vehicles findIf {_x select 0 isEqualTo _type});

_vehicle = _vehicles select (_vehicles findIf {_x select 0 isEqualTo "B_APC_Wheeled_01_cannon_F"});

// Fill the controls
    _ctrlSupply ctrlSetText str (round ((_vehicleArray select 1) * (KPLIB_param_recycleFactor / 100)));
    _ctrlAmmo ctrlSetText str (round ((_vehicleArray select 2) * (KPLIB_param_recycleFactor / 100)));
    _ctrlFuel ctrlSetText str (round ((_vehicleArray select 3) * (KPLIB_param_recycleFactor / 100)));

_recycleButton ctrlEnable true;

true
