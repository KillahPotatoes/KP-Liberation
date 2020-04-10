/*
    File: fn_checkClass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-04-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks if given classname is available in currently loaded modset.

    Parameter(s):
        _classname - Classname of class to check [STRING, defaults to ""]

    Returns:
        Classname in config [BOOL]
*/

params [
    ["_classname", "", [""]]
];

if (_classname isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};

if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
    true
} else {
    if (isServer) then {diag_log text format ["[KP LIBERATION] [PRESETS] %1 not found in CfgVehicles", _classname];};
    false
};
