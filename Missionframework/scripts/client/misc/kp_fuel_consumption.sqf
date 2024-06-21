scriptName "kp_fuel_consumption";
/*
kp_fuel_consumption.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-02-02
Update: 2023-05-11

Description:
This script handles the fuel consumption of vehicles, so that refueling will be necessary more often.

Parameters:
_vehicle - OBJECT - Vehicle

Method:
execVM

Example for initPlayerLocal.sqf:
player addEventHandler ["GetInMan", {[ _this select 2] execVM "scripts\kp_fuel_consumption.sqf";}];
*/

//CONFIG
// Time in Minutes till a full tank depletes when the vehicle is standing with running engine
private _kp_neutral_consumption = KPLIB_fuel_neutral;
// Time in Minutes till a full tank depletes when the vehicle is driving
private _kp_normal_consumption = KPLIB_fuel_normal;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
private _kp_max_consumption = KPLIB_fuel_max;

/*
DO NOT EDIT BELOW
*/

params ["_vehicle"];

if (isNil "kp_fuel_consumption_vehicles") then {
    kp_fuel_consumption_vehicles = [];
};
if (isNil "kp_fuel_ignore_vehicles") then {
    kp_fuel_ignore_vehicles = [];
};

if (_vehicle in kp_fuel_ignore_vehicles) exitWith {};
if (!(_vehicle in kp_fuel_consumption_vehicles)) then {
    kp_fuel_consumption_vehicles pushBack _vehicle;
    private _maxspeed = (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed") * 0.9);
    while {local _vehicle} do {
        if (isEngineOn _vehicle) then {
            if (speed _vehicle > 5) then {
                if (speed _vehicle > _maxspeed) then {
                    _vehicle setFuel (fuel _vehicle - (1 / (_kp_max_consumption * 60)));
                } else {
                    _vehicle setFuel (fuel _vehicle - (1 / (_kp_normal_consumption * 60)));
                };
            } else {
                _vehicle setFuel (fuel _vehicle - (1 / (_kp_neutral_consumption * 60)));
            };
        };
        uiSleep 1;
    };
    kp_fuel_consumption_vehicles deleteAt (kp_fuel_consumption_vehicles find _vehicle);
};
