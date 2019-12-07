/*
    File: fn_isClassUAV.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-17
    Last Update: 2019-12-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns if given vehicle class is an UAV.

    Parameter(s):
        _class - Class of object which will be checked if it is an UAV [STRING, defaults to ""]

    Returns:
        Class is UAV [BOOL]
*/

params [
    ["_class", "", [""]]
];

if (_class isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};

(getNumber (configFile >> "CfgVehicles" >> _class >> "isUav")) == 1
