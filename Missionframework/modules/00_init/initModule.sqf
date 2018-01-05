/*
	KP Liberation mission initialization module
	
	File: initModule.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2017-10-26

	Description:
	This module initialize basically everything what should be done before the player pass the briefing screen.
	Tasks of this module are:
		* Fetch parameters
		* Fetch config values
		* Define basic ui values
		* Fetch, check and distribute preset data
		* Sort sector markers
		* Initialize the save manager
		* Connect unlockable vehicles to military sectors
		* Load and save very basic data like date, sectors, FOB positions and unlockable vehicle sector links
		* Manage sector color changing
		* Manage FOB markers
	
	Dependencies:
	NONE
*/

// Read the module globals
call compile preprocessFileLineNumbers "modules\00_init\globals.sqf";

// Load preset files
call KPLIB_fnc_init_loadPresets;

// Load arsenal
call KPLIB_fnc_init_fillArsenal;

// Sort the sector markers to category arrays
call KPLIB_fnc_init_sortSectors;

// Run save manager script
execVM "modules\00_init\scripts\server\saveManager\saveManager.sqf";
execVM "modules\00_init\scripts\server\saveManager\saveManager_timeTrigger.sqf";

// Run sector marker color manager
execVM "modules\00_init\scripts\server\mapMarkers\sectorMarkers.sqf";

// Run FOB marker manager
execVM "modules\00_init\scripts\server\mapMarkers\fobMarkers.sqf";
