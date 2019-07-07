/*
	F_isRadio

	File: F_kp_isRadio.sqf
	Author: Zharf
	Date: 2019-07-07
	Last Update: 2019-07-07

	Description:
	Returns whether the provided item is a radio or not (ACRE version)

	Parameter(s):
		0: STRING - a class name to check

	Returns:
	BOOL
*/
params ["_item"];

_ret = [_item] call acre_api_fnc_isRadio;
_ret
