/*
    File: fn_setVehicleSeized.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-20
    Last Update: 2020-04-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets the seized variable on given vehicle, if vehicle class
        is in civilian preset.

    Parameter(s):
        _veh - Vehicle to seize [OBJECT, defaults to objNull]

    Returns:
        Vehicles is set to seized [BOOL]
*/

params [
    ["_veh", objNull, [objNull]]
];

if (isNull _veh) exitWith {["Null object given"] call BIS_fnc_error; false};

private _type = typeOf _veh;

if !(_type in civilian_vehicles) exitWith {false};

if !(_veh getVariable ["KPLIB_seized", false]) then {
    _veh setVariable ["KPLIB_seized", true, true];
    [0] remoteExec ["KPLIB_fnc_crGlobalMsg"];
    [KP_liberation_cr_vehicle_penalty, true] remoteExec ["F_cr_changeCR", 2];
    stats_civilian_vehicles_seized = stats_civilian_vehicles_seized + 1;
    publicVariable "stats_civilian_vehicles_seized";

    [
        format ["%1 seized a civilian %2 (%3)", name player, getText (configFile >> "CfgVehicles" >> _type >> "displayName"), _type],
        "CAPTURED"
    ] remoteExecCall ["KPLIB_fnc_log", 2];
};

true
