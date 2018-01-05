/*
	KP LIBERATION MODULE INITIALIZATION
	
	File: initModule.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-28
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	This module provides the very basic functions and mechanics for the general gameplay of the mission.
	Tasks of this module are:
		* Provide basic functions
		* Manage respawn / redeploy dialog
		* Show respawn, spawn and intro cinematics

	Dependencies:
		* 00_init
*/

// Read the module globals
call compile preprocessFileLineNumbers "modules\01_core\globals.sqf";

if (hasInterface) then {
	// Start the intro cinematic
	[] spawn KPLIB_fnc_core_intro;
};
