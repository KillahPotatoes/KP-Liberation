#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_selectResupplyTarget

    File: fn_logistic_selectResupplyTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
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
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RESUPPLY_DIALOG;
private _ctrlVehicleList = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOVEHICLES;
private _ctrlCargo = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOCARGO;
private _ctrlCargoStateValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_CARGOSTATEVALUE;
private _ctrlCosts = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_CARGOCOSTSVALUE;
private _ctrlSlider = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_RESUPPLYCOUNT;
private _ctrlSliderValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_SLIDERVALUE;
private _ctrlTotalCosts = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_TOTALCOSTSVALUE;
private _resupplyButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_BUTTONRESUPPLY;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

_ctrlSlider ctrlEnable false;
_ctrlSliderValue ctrlSetText "---";
_ctrlCargoStateValue CtrlSetText "---";
_ctrlCosts CtrlSetText "---";
_ctrlTotalCosts CtrlSetText "---";
_resupplyButton ctrlEnable false;

// Check for empty selection
if (_vehicleId isEqualTo "placeholder") exitWith {
};

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;

// Fill the controls
_index = lbCurSel _ctrlCargo;

// Variables
private _cfgVeh = configFile >> "CfgVehicles";
private _cfgMag = configFile >> "CfgMagazines";
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _res = [_nearFOB] call KPLIB_fnc_resources_getResTotal;
private _ammoMax = 0;
private _ammoState = 0;
private _fuelMax = 0;
private _fuelState = 0;

if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlSlider ctrlEnable true;
            _ammoMax = count magazinesAllTurrets _vehicle;
            _ammoState = {_x select 2 isEqualTo (getNumber (_cfgMag >> (_x select 0) >> "count"))} count magazinesAllTurrets _vehicle;
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATE", _ammoState, _ammoMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSAMMO", str KPLIB_param_resupplyMagCost];
            if ((ceil (_ammoMax - _ammoState)) > (floor ((_res select 1) / KPLIB_param_resupplyMagCost))) then {
                _ctrlSlider sliderSetRange [0, floor ((_res select 1) / KPLIB_param_resupplyMagCost)];
            } else {
                _ctrlSlider sliderSetRange [0, ceil (_ammoMax - _ammoState)];
            };
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [1, 1];
        };
        case "FUEL": {
            _ctrlSlider ctrlEnable true;
            _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            _fuelState = _fuelMax * (fuel _vehicle);
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATE", _fuelState toFixed 2, _fuelMax toFixed 2];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSFUEL", str KPLIB_param_resupplyGallCost];
            if ((ceil (_fuelMax - _fuelState)) > (floor ((_res select 2) / KPLIB_param_resupplyGallCost))) then {
                _ctrlSlider sliderSetRange [0, floor ((_res select 2) / KPLIB_param_resupplyGallCost)];
            } else {
                _ctrlSlider sliderSetRange [0, ceil (_fuelMax - _fuelState)];
            };
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [1, 1];
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlSlider ctrlEnable true;
            _ammoMax = getNumber (_cfgVeh >> _type >> "ace_rearm_defaultSupply");
            if (_ammoMax isEqualTo 0) then {
                _ammoState = 0;
            } else {
                _ammoState = _vehicle getVariable ["ace_rearm_currentSupply", 0];
            };
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATEACE", _ammoState, _ammoMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSAMMOACE", str KPLIB_param_resupplyAmmoCost];
            if (((ceil (_ammoMax - _ammoState)) / 100) > (floor ((_res select 1) / KPLIB_param_resupplyAmmoCost))) then {
                _ctrlSlider sliderSetRange [0, (floor ((_res select 1) / KPLIB_param_resupplyAmmoCost)) * 100];
            } else {
                _ctrlSlider sliderSetRange [0, ceil (_ammoMax - _ammoState)];
            };
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [10, 10];
        };
        case "FUEL": {
            _ctrlSlider ctrlEnable true;
            _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            if (_fuelMax isEqualTo 0) then {
                _fuelState = 0;
            } else {
                _fuelState = _vehicle getVariable ["ace_refuel_currentFuelCargo", 0];
            };
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATEACE", _fuelState, _fuelMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSFUELACE", str KPLIB_param_resupplyFuelCost];
            if (((ceil (_fuelMax - _fuelState)) / 1000) > (floor ((_res select 2) / KPLIB_param_resupplyFuelCost))) then {
                _ctrlSlider sliderSetRange [0, (floor ((_res select 2) / KPLIB_param_resupplyFuelCost)) * 1000];
            } else {
                _ctrlSlider sliderSetRange [0, ceil (_fuelMax - _fuelState)];
            };
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [100, 100];
        };
    };
};

// Spawn camera object
if (isNull KPLIB_logistic_activeCam) then {
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
} else {
    if !(_vehicle isEqualTo (camTarget KPLIB_logistic_activeCam)) then {
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
    };
};

true
