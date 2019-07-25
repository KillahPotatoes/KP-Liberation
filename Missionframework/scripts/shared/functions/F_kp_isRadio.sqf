/*
    F_isRadio

    File: F_kp_isRadio.sqf
    Author: Zharf - https://github.com/zharf
    Date: 2019-07-07
    Last Update: 2019-07-23

    Description:
    Returns whether the provided item is a radio or not

    Parameter(s):
        0: STRING - Classname to check. (Default "")

    Returns:
    BOOL
*/

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
