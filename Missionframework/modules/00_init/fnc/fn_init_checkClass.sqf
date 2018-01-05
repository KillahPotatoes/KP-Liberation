/*
	KPLIB_fnc_init_checkClass
	
	File: fn_init_checkClass.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Returns if given classname is available in CfgVehicles.

	Parameter(s):
		0: STRING - Classname which should be checked

	Returns:
	BOOL
*/

params ["_toCheck"];

private _return = false;

if (isClass (configFile >> "CfgVehicles" >> _toCheck)) then {
	_return = true;
} else {
	diag_log format ["[KP LIBERATION] [CHECKCLASS] %1 not found in CfgVehicles", _toCheck];
};

_return
