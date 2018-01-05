/*
	KPLIB_fnc_init_filterMods
	
	File: fn_init_filterMods.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2017-10-16

	Description:
	Filters not available classnames out of a given array of vehicle classnames or buildlist array and returns the resulting array.

	Parameter(s):
		0: ARRAY - Array of vehicle classname strings or multidimensional array with vehicle classname string in select 0 of each array

	Returns:
	ARRAY
*/

params ["_array"];

_array = _array select {if (_x isEqualType []) then {[_x select 0] call KPLIB_fnc_init_checkClass} else {[_x] call KPLIB_fnc_init_checkClass}};

_array
