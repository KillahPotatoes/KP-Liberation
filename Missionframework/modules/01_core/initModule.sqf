/*
    KP LIBERATION MODULE INITIALIZATION

    File: initModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-05-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides the very basic functions and mechanics for the general gameplay of the mission.
    Tasks of this module are:
        * Provide basic functions.
        * Manage respawn / redeploy dialog.
        * Show respawn, spawn and intro cinematics.
        * Spawning of Little Birds and Rubber Dinghies.
        * Spawning and respawn handling of Potato 01.
        * Track sectors to handle their activation/deactivation.

    Dependencies:
        * 00_init
*/

// Read the module globals
call compile preprocessFileLineNumbers "modules\01_core\globals.sqf";

// Initialize actions
call KPLIB_fnc_core_setupPlayerActions;

// Server section (dedicated and player hosted)
if (isServer) then {
    call KPLIB_fnc_core_spawnStartFobBox;
    call KPLIB_fnc_core_spawnStartVeh;
    call KPLIB_fnc_core_spawnPotato;
    call KPLIB_fnc_core_updateSectorMarkers;
    execVM "modules\01_core\scripts\server\sectorMonitor.sqf";
    execVM "modules\01_core\scripts\server\eventLoop.sqf";
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {
    // Add parameter diary entries
    call KPLIB_fnc_core_paramDiaryList;

    // Start the intro cinematic
    [] spawn KPLIB_fnc_core_intro;
};
