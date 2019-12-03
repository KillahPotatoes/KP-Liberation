/*
    File: fn_checkCrateValue.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-05-26
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks content of given crate and displays a hint about it.
        Additionally it makes sure that ropeAttach is enabled on the crate.

    Parameter(s):
        _crate - Crate to check [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

if (isDedicated) exitWith {};

params [
    ["_crate", objNull, [objNull]]
];

if (isNull _crate) exitWith {["Null object given"] call BIS_fnc_error; false};

hint format [localize "STR_ACTION_CRATE_VALUE_HINT", _crate getVariable ["KP_liberation_crate_value", 0]];

if !(ropeAttachEnabled _crate) then {
    [_crate, true] remoteExec ["enableRopeAttach"];
};

true
