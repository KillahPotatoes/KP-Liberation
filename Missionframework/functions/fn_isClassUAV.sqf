/*
    File: fn_isClassUAV.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-17
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns if given vehicle class is an UAV.

    Parameter(s):
        _vehicleclass - Class of object which will be checked if it is an UAV [STRING, defaults to ""]

    Returns:
        Class is UAV [BOOL]
*/
// TODO
params ["_vehicleclass"];

private _isUAV = false;

if ((typeName _vehicleclass) == "STRING") then {
    if ((getNumber(configFile >> "CfgVehicles" >> _vehicleclass >> "isUav")) == 1) then {
        _isUAV = true;
    };
};

_isUAV;
