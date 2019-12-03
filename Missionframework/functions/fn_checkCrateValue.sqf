/*
    File: fn_checkCrateValue.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-05-26
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks content of given crate, checks if ropeAttach is enabled on the crate and if not set it to true.

    Parameter(s):
        _crate - Crate to check [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
if (isDedicated) exitWith {};

hint format [localize "STR_ACTION_CRATE_VALUE_HINT", (_this select 0) getVariable ["KP_liberation_crate_value",0]];

if (!(ropeAttachEnabled (_this select 0))) then {
    [(_this select 0), true] remoteExec ["enableRopeAttach"];
};

true
