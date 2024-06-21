/*
    File: fn_isRadio.sqf
    Author: Zharf - https://github.com/zharf
    Date: 2019-07-07
    Last Update: 2023-03-02
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns whether the classname is a TFAR/ACRE radio or not.

    Parameter(s):
        _class - Description [STRING, defaults to ""]

    Returns:
        Item is a radio [BOOL]
*/

params [
    ["_class", "", [""]]
];

if (_class isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};

private _cfgPatches = configFile >> "CfgPatches";

if ((isClass (_cfgPatches >> "tfar_core")) || (isClass (_cfgPatches >> "task_force_radio"))) exitWith {
    _class call TFAR_fnc_isRadio
};

if (isClass (_cfgPatches >> "acre_api")) exitWith {
    [_class] call acre_api_fnc_isRadio
};

false
