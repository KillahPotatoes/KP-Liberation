/*
    File: fn_isRadio.sqf
    Author: Zharf - https://github.com/zharf
    Date: 2019-07-07
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns whether the provided item is a radio or not.

    Parameter(s):
        _item - Description [STRING, defaults to ""]

    Returns:
        Item is a radio [BOOL]
*/
// TODO
params [
    ["_item", "", [""]]
];

if ((isClass (configFile >> "CfgPatches" >> "tfar_core")) || (isClass (configFile >> "CfgPatches" >> "task_force_radio"))) exitWith {
    _item call TFAR_fnc_isRadio
};

if (isClass (configFile >> "CfgPatches" >> "acre_api")) exitWith {
    [_item] call acre_api_fnc_isRadio
};

false
