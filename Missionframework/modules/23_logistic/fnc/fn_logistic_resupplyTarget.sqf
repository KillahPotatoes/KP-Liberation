/*
    KPLIB_fnc_logistic_resupplyTarget

    File: fn_logistic_resupplyTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-03-30
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

if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _vehicle setVehicleAmmo 1;
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "fuelCapacity");
            private _fuelState = _fuelMax * (fuel _vehicle);
            private _addValue = parseNumber ctrlText _ctrlSliderValue;
            private _newFuelState = ((_fuelState + _addValue) /_fuelMax);
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
            private _ammoState = [_vehicle] call ace_rearm_fnc_getSupplyCount;
            private _addValue = parseNumber ctrlText _ctrlSliderValue;
            [_vehicle, _ammoState + _addValue] call ace_rearm_fnc_setSupplyCount;
        };
        case "FUEL": {
            private _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            private _fuelState = [_vehicle] call ace_refuel_fnc_getFuel;
            private _addValue = parseNumber ctrlText _ctrlSliderValue;
            [_vehicle, _fuelState + _addValue] call ace_refuel_fnc_setFuel;
        };
    };
};

[] call KPLIB_fnc_logistic_selectResupplyTarget;

true
