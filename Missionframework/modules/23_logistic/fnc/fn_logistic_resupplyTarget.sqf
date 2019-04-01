/*
    KPLIB_fnc_logistic_resupplyTarget

    File: fn_logistic_resupplyTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-04-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Resupplies the given vehicle.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 7580233;
private _ctrlVehicleList = _dialog displayCtrl 68740;
private _ctrlCargo = _dialog displayCtrl 68741;
private _ctrlCosts = _dialog displayCtrl 68743;
private _ctrlSliderValue = _dialog displayCtrl 68745;
private _ctrlTotalCosts = _dialog displayCtrl 68746;

private _cfgVeh = configFile >> "CfgVehicles";
private _cfgMag = configFile >> "CfgMagazines";

// Read controls
private _index = lbCurSel _ctrlVehicleList;
private _vehicleId = _ctrlVehicleList lbData _index;

// Get the target vehicle
private _vehicle = objectFromNetId _vehicleId;
private _type = typeOf _vehicle;

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
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            private _fuelState = _fuelMax * (fuel _vehicle);
            private _newFuelState = ((_fuelState + _addValue) / _fuelMax);
            if (_newFuelState > 1) then {
                _newFuelState = 1;
            };
            _vehicle setFuel _newFuelState;
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
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            private _fuelState = _vehicle getVariable ["ace_refuel_currentFuelCargo", 0];
            if ((_fuelState + _addValue) > _fuelMax) then {
                _vehicle setVariable ["ace_refuel_currentFuelCargo", _fuelMax];
            } else {
                _vehicle setVariable ["ace_refuel_currentFuelCargo", _fuelState + _addValue];
            };
        };
    };
};

[] call KPLIB_fnc_logistic_selectResupplyTarget;

true
