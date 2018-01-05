/*
	KPLIB_fnc_core_intro
	
	File: fn_core_intro.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-12-31
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Starts the intro cinematic with the optional credit introduction line.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

waitUntil {time > 0};

[] spawn KPLIB_fnc_core_cinematic;

if (KPLIB_param_intro) then {
	sleep 1;
	cutRsc ["intro1", "PLAIN", 1, true];
	sleep 5.5;
	cutRsc ["intro2", "PLAIN", 1, true];
	sleep 10;
};

createDialog "KPLIB_introMenu";
waitUntil {dialog};
waitUntil {KPLIB_intro_startGame || KPLIB_intro_tutorial || !dialog};

closeDialog 0;
if (KPLIB_intro_tutorial) then {
	KPLIB_intro_started = false;
};
KPLIB_intro_done = true;

true
