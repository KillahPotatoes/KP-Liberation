/*
    File: fn_setVehicleCaptured.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-10
    Last Update: 2020-04-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets the captured variable on given vehicle, if vehicle class
        is in enemy preset.

    Parameter(s):
        _veh - Vehicle to capture [OBJECT, defaults to objNull]

    Returns:
        Vehicles is set to captured [BOOL]
*/

params [
    ["_veh", objNull, [objNull]]
];

if (isNull _veh) exitWith {["Null object given"] call BIS_fnc_error; false};

private _type = typeOf _veh;

if !((toLower _type) in KPLIB_o_allVeh_classes) exitWith {false};

if !(_veh getVariable ["KPLIB_captured", false]) then {
    _veh setVariable ["KPLIB_captured", true, true];

    [
        format ["%1 captured an enemy %2 (%3)", name player, getText (configFile >> "CfgVehicles" >> _type >> "displayName"), _type],
        "CAPTURED"
    ] remoteExecCall ["KPLIB_fnc_log", 2];
};

true
