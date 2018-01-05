/*
	KP Liberation mission core module
	
	File: initModule.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-28
	Last Update: 2017-12-03

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
