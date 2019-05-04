#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_resupplyTarget

    File: fn_logistic_resupplyTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Resupplies the given vehicle.

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
private _ctrlSliderValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_SLIDERVALUE;
private _ctrlTotalCosts = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_TOTALCOSTSVALUE;
private _resupplyButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_BUTTONRESUPPLY;

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;
private _costs = parseNumber (ctrlText _ctrlTotalCosts);

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;

// Variables
private _cfgVeh = configFile >> "CfgVehicles";
private _cfgMag = configFile >> "CfgMagazines";
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _cargo = ctrlText _ctrlCargoStateValue;
private _cargoCheck = "";
private _ammoMax = 0;
private _ammoState = 0;
private _fuelMax = 0;
private _fuelState = 0;

// Check if the Vehicle state has changed and exit
if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ammoMax = count magazinesAllTurrets _vehicle;
            _ammoState = {_x select 2 isEqualTo (getNumber (_cfgMag >> (_x select 0) >> "count"))} count magazinesAllTurrets _vehicle;
            _cargoCheck = format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATE", _ammoState, _ammoMax];
        };
        case "FUEL": {
            _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            _fuelState = _fuelMax * (fuel _vehicle);
            _cargoCheck = format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATE", _fuelState toFixed 2, _fuelMax toFixed 2];
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ammoMax = getNumber (_cfgVeh >> _type >> "ace_rearm_defaultSupply");
            if (_ammoMax isEqualTo 0) then {
                _ammoState = 0;
            } else {
                _ammoState = _vehicle getVariable ["ace_rearm_currentSupply", 0];
            };
            _cargoCheck = format [localize "STR_KPLIB_DIALOG_RESUPPLY_AMMOSTATEACE", _ammoState, _ammoMax];
        };
        case "FUEL": {
            _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            if (_fuelMax isEqualTo 0) then {
                _fuelState = 0;
            } else {
                _fuelState = _vehicle getVariable ["ace_refuel_currentFuelCargo", 0];
            };
            _cargoCheck = format [localize "STR_KPLIB_DIALOG_RESUPPLY_FUELSTATEACE", _fuelState, _fuelMax];
        };
    };
};

if (
    !(_cargo isEqualTo _cargoCheck) ||
    (((getMarkerPos _nearFOB) distance2D _vehicle) > KPLIB_param_fobRange)
) exitWith {
    _resupplyButton ctrlEnable false;
    [
        ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
        [localize "STR_KPLIB_HINT_VEHICLECHANGES"]
    ] call CBA_fnc_notify;
};

// Do the resupply
_index = lbCurSel _ctrlCargo;
private _addValue = parseNumber ctrlText _ctrlSliderValue;

if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ammoMax = count magazinesAllTurrets _vehicle;
            _ammoState = {_x select 2 isEqualTo (getNumber (_cfgMag >> (_x select 0) >> "count"))} count magazinesAllTurrets _vehicle;
            private _newAmmoState = ((_ammoState + _addValue) / _ammoMax);
            if (_newAmmoState > 1) then {
                _newAmmoState = 1;
            };
            _vehicle setVehicleAmmo _newAmmoState;
            [_nearFOB, 0, _costs, 0] call KPLIB_fnc_resources_pay;
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            private _fuelState = _fuelMax * (fuel _vehicle);
            private _newFuelState = ((_fuelState + _addValue) / _fuelMax);
            if (_newFuelState > 1) then {
                _newFuelState = 1;
            };
            _vehicle setFuel _newFuelState;
            [_nearFOB, 0, 0, _costs] call KPLIB_fnc_resources_pay;
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            private _ammoMax = getNumber (_cfgVeh >> _type >> "ace_rearm_defaultSupply");
            private _ammoState = _vehicle getVariable ["ace_rearm_currentSupply", 0];
            if ((_ammoState + _addValue) > _ammoMax) then {
                _vehicle setVariable ["ace_rearm_currentSupply", _ammoMax];
            } else {
                _vehicle setVariable ["ace_rearm_currentSupply", _ammoState + _addValue];
            };
            [_nearFOB, 0, _costs, 0] call KPLIB_fnc_resources_pay;
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            private _fuelState = _vehicle getVariable ["ace_refuel_currentFuelCargo", 0];
            if ((_fuelState + _addValue) > _fuelMax) then {
                _vehicle setVariable ["ace_refuel_currentFuelCargo", _fuelMax];
            } else {
                _vehicle setVariable ["ace_refuel_currentFuelCargo", _fuelState + _addValue];
            };
            [_nearFOB, 0, 0, _costs] call KPLIB_fnc_resources_pay;
        };
    };
};

[] call KPLIB_fnc_logistic_selectResupplyTarget;

true
