/*
f_kp_crate_checkValue.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-05-26

Description:
Checks content of given crate, checks if ropeAttach is enabled on the crate and if not set it to true.

Parameters:
_this select 0 - Object - Crate
*/

if (isDedicated) exitWith {};

hint format [localize "STR_ACTION_CRATE_VALUE_HINT", (_this select 0) getVariable ["KP_liberation_crate_value",0]];

if (!(ropeAttachEnabled (_this select 0))) then {
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Crate had ropeAttachEnabled %1. Checked by: %2", (ropeAttachEnabled (_this select 0)), debug_source];_text remoteExec ["diag_log",2];};
	[(_this select 0), true] remoteExec ["enableRopeAttach",(_this select 0)];
};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Crate check done - value: %1 - ropeAttachEnabled: %2 - Checked by: %3",((_this select 0) getVariable "KP_liberation_crate_value"), (ropeAttachEnabled (_this select 0)), debug_source];_text remoteExec ["diag_log",2];};
