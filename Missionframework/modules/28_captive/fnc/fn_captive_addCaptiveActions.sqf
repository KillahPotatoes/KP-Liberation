/*
    KPLIB_fnc_captive_addCaptiveAction

    File: fn_captive_addCaptiveAction.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-11
    Last Update: 2019-09-11
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

// Add arrest action without active ACE
if !(KPLIB_ace_enabled) then {
    [
        _unit,
        "arrest",
        [{[_this select 0] call KPLIB_fnc_captive_setCaptive;}, true, -800, false, true, "", "_target getVariable [KPLIB_surrender, false]", 10]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _unit];
};


true
