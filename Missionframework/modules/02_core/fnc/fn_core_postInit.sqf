/*
    KPLIB_fnc_core_postInit

    File: fn_core_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [CORE] Module initializing...", diag_tickTime];};

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

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [CORE] Module initialized", diag_tickTime];};

true
