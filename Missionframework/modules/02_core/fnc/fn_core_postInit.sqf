/*
    KPLIB_fnc_core_postInit

    File: fn_core_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides the very basic functions and mechanics for the general gameplay of the mission.
    Tasks of this module are:
        * Provide basic functions.
        * Show respawn, spawn and intro cinematics.
        * Spawning of Little Birds and Rubber Dinghies.
        * Spawning and respawn handling of Potato 01.
        * Track sectors to handle their activation/deactivation.

    Dependencies:
        * 00_init

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [CORE] Module initializing...", diag_tickTime];};

// Initialize BIS Revive
[] call KPLIB_fnc_core_reviveInit;

// Initialize actions
[] call KPLIB_fnc_core_setupPlayerActions;

if(KPLIB_param_clearVehicleCargo > 0) then {
    ["KPLIB_vehicle_spawned", {call KPLIB_fnc_common_clearVehicleCargo;}] call CBA_fnc_addEventHandler;
};

// Server section (dedicated and player hosted)
if (isServer) then {
    [] call KPLIB_fnc_core_spawnStartFobBox;
    [] call KPLIB_fnc_core_spawnStartVeh;
    [] call KPLIB_fnc_core_spawnPotato;
    [] call KPLIB_fnc_core_updateSectorMarkers;
    execVM "modules\02_core\scripts\server\sectorMonitor.sqf";
    execVM "modules\02_core\scripts\server\eventLoop.sqf";
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {
    // Add parameter diary entries
    [] call KPLIB_fnc_core_paramDiaryList;

    // Start the intro cinematic
    [] spawn KPLIB_fnc_core_intro;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [CORE] Module initialized", diag_tickTime];};

true
