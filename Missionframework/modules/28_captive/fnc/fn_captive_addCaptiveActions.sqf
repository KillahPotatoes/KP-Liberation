/*
    KPLIB_fnc_captive_addCaptiveAction

    File: fn_captive_addCaptiveAction.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-11
    Last Update: 2019-09-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Adds all needed actions to a surrendered unit.

    Parameter(s):
        _unit - Unit to set in captive mode [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_unit", objNull, [objNull]]
];

// Exit on missing object
if (isNull _unit) exitWith {
    false
};

if !(KPLIB_ace_enabled) then {
    // Add arrest action
    [
        _unit,
        "STR_KPLIB_ACTION_ARREST",
        [{[_this select 0] call KPLIB_fnc_captive_setCaptive;}, nil, -800, false, true, "", "(_target getVariable [""KPLIB_surrender"", false]) && !(_target getVariable [""KPLIB_captive"", false])", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];

    // Add escort action
    [
        _unit,
        "escort",
        [{}, nil, -800, false, true, "", "_target getVariable [""KPLIB_captive"", false]", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];

    // Add stop escort action
    // This action will be moved to the escorting unit later
    [
        _unit,
        "drop captive",
        [{}, nil, -800, false, true, "", "_target getVariable [""KPLIB_captive"", false]", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];

    // Add move in vehicle action
    [
        _unit,
        "move in cargo",
        [{}, nil, -800, false, true, "", "_target getVariable [""KPLIB_captive"", false]", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];

    // Add move out vehicle action
    // This action will be moved to the vehicle later
    [
        _unit,
        "move out cargo",
        [{}, nil, -800, false, true, "", "_target getVariable [""KPLIB_captive"", false]", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];
};

// Add interrogate action near FOB
[
    _unit,
    "interrogate captive",
    [{[10] call KPLIB_fnc_resources_addIntel; deleteVehicle _unit;}, nil, -800, false, true, "", "count (_target nearEntities [KPLIB_preset_fobBuildingF, 25]) isEqualTo 1", 10]
] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];

true
