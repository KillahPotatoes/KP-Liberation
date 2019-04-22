/*
    KPLIB_fnc_core_postInit

    File: fn_core_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "POST] [CORE", true] call KPLIB_fnc_common_log;};

// Initialize BIS Revive
[] call KPLIB_fnc_core_reviveInit;

// Initialize actions
[] call KPLIB_fnc_core_setupPlayerActions;

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

};

if (isServer) then {["Module initialized", "POST] [CORE", true] call KPLIB_fnc_common_log;};

true
