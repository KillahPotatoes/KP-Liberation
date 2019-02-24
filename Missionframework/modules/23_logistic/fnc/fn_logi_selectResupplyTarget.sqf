/*
    KPLIB_fnc_selectResupplyTarget

    File: fn_logi_selectResupplyTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
    Last Update: 2019-02-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Selects the vehicle from the combo cox and fills the dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 7580233;
private _ctrlVehicleList = _dialog displayCtrl 68740;
private _ctrlCargo = _dialog displayCtrl 68741;
private _ctrlCargoStateValue = _dialog displayCtrl 68742;
private _ctrlCosts = _dialog displayCtrl 68743;
private _ctrlSlider = _dialog displayCtrl 68744;
private _ctrlSliderValue = _dialog displayCtrl 68745;
private _ctrlTotalCosts = _dialog displayCtrl 68746;
private _resupplyButton = _dialog displayCtrl 68747;

private _cfgVeh = configFile >> "CfgVehicles";
private _cfgMag = configFile >> "CfgMagazines";

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

private _ammoMax = 0;
private _ammoState = 0;
private _fuelMax = 0;
private _fuelState = 0;

if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ammoMax = count magazinesAllTurrets _vehicle;
            _ammoState = {_x select 2 isEqualTo (getNumber (_cfgMag >> (_x select 0) >> "count"))} count magazinesAllTurrets _vehicle;
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATE", _ammoMax - _ammoState, _ammoMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSAMMO", str KPLIB_param_resupplyMagCost];
            _ctrlTotalCosts ctrlSetText str ((_ammoMax - _ammoState) * KPLIB_param_resupplyMagCost);
            _resupplyButton ctrlEnable true;
        };
        case "FUEL": {
            _ctrlSlider ctrlEnable true;
            _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            _fuelState = _fuelMax * (fuel _vehicle);
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATE", _fuelState toFixed 2, _fuelMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSFUEL", str KPLIB_param_resupplyGallCost];
            _ctrlSlider sliderSetRange [0, ceil (_fuelMax - _fuelState)];
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
                _ammoState = [_vehicle] call ace_rearm_fnc_getSupplyCount;
            };
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATEACE", _ammoState, _ammoMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSAMMOACE", str KPLIB_param_resupplyAmmoCost];
            _ctrlSlider sliderSetRange [0, ceil (_ammoMax - _ammoState)];
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [100, 100];
        };
        case "FUEL": {
            _ctrlSlider ctrlEnable true;
            _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            if (_fuelMax isEqualTo 0) then {
                _fuelState = 0;
            } else {
                _fuelState = [_vehicle] call ace_refuel_fnc_getFuel;
            };
            _ctrlCargoStateValue ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATEACE", _fuelState, _fuelMax];
            _ctrlCosts ctrlSetText format [localize "STR_KPLIB_DIALOG_RESUPPLY_COSTSFUELACE", str KPLIB_param_resupplyFuelCost];
            _ctrlSlider sliderSetRange [0, ceil (_fuelMax - _fuelState)];
            _ctrlSlider sliderSetPosition 0;
            _ctrlSlider sliderSetSpeed [1000, 1000];
        };
    };
};

/* TODO:
- Implement check for resources
*/

// Spawn camera object
camUseNVG false;
showCinemaBorder false;
private _cam = "camera" camCreate (getpos _vehicle);
_cam cameraEffect ["internal", "front", "rtt"];
KPLIB_logi_activeCam = _cam;
_cam camSetTarget _vehicle;
_cam camSetFov 0.5;
_cam camCommit 0;
_cam camSetPos ((_vehicle getRelPos [15, 0]) vectorAdd [0, 0, 5]);
_cam camCommit 0;

private _index = lbCurSel _ctrlVehicleList;
while {(lbCurSel _ctrlVehicleList) isEqualTo _index || !dialog} do {
    for "_i" from 1 to 36 do {
        _cam camSetPos ((_vehicle getRelPos [15, _i * 10]) vectorAdd [0, 0, 5]);
        _cam camCommit 30/36;
        waitUntil {camCommitted _cam};
    };
};

true
