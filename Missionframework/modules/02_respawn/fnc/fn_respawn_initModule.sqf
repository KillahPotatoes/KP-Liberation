/*
    KPLIB_fnc_resapwn_initModule

    File: fn_respawn_initModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides functions and UI defines for Liberation respawn system.
    Tasks of this module are:
        * Manage respawn / redeploy dialog.

    Dependencies:
        * 01_core

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [RESPAWN] Module initializing...", diag_tickTime];};

// Read the module globals
call compile preprocessFileLineNumbers "modules\02_respawn\globals.sqf";

// Server section (dedicated and player hosted)
if (isServer) then {

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {
    ["KPLIB_respawn_requested", {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [] call KPLIB_fnc_respawn_open;
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [RESPAWN] Module initialized", diag_tickTime];};

true
