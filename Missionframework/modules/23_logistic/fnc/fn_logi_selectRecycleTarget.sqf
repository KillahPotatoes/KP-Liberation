/*
    KPLIB_fnc_selectRecycleTarget

    File: fn_logi_selectRecycleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-27
    Last Update: 2019-02-08
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
private _ctrlCam = _dialog displayCtrl 68744;
private _recycleButton = _dialog displayCtrl 68745;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

// Check for empty selection
if (_vehicleId isEqualTo "placeholder") exitWith {
    _ctrlSupply ctrlSetText "---";
    _ctrlAmmo ctrlSetText "---";
    _ctrlFuel ctrlSetText "---";
    _ctrlCam ctrlSetText "KPGUI\res\kp512_CA.paa";
};

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;
private _vehicles = KPLIB_logi_data getVariable ["Vehicles", []];
private _vehicleIndex = _vehicles findIf {_x select 0 isEqualTo _type};
private _damage = 1;
private _ammo = 1;
private _fuel = 1;

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
if !(_vehicleIndex isEqualTo -1) then {
    private _vehicleArray = _vehicles select _vehicleIndex;
    _ctrlSupply ctrlSetText str (round ((_vehicleArray select 1) * (KPLIB_param_recycleFactor / 100) * _damage));
    _ctrlAmmo ctrlSetText str (round ((_vehicleArray select 2) * (KPLIB_param_recycleFactor / 100) * _ammo));
    _ctrlFuel ctrlSetText str (round ((_vehicleArray select 3) * (KPLIB_param_recycleFactor / 100) * _fuel));
} else {
    _ctrlSupply ctrlSetText str (KPLIB_param_refundSupply * _damage);
    _ctrlAmmo ctrlSetText str (KPLIB_param_refundAmmo * _ammo);
    _ctrlFuel ctrlSetText str (KPLIB_param_refundFuel * _fuel);
};

/* TODO:
- Implement check for empty cargo space
*/

_recycleButton ctrlEnable true;

// Spawn camera object
_ctrlCam ctrlSetText "#(argb,512,512,1)r2t(rtt,1)";
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

while {(lbCurSel _ctrlVehicleList) isEqualTo _index || !dialog} do {
    for "_i" from 1 to 36 do {
        _cam camSetPos ((_vehicle getRelPos [15, _i * 10]) vectorAdd [0, 0, 5]);
        _cam camCommit 30/36;
        waitUntil {camCommitted _cam};
    };
};

true
