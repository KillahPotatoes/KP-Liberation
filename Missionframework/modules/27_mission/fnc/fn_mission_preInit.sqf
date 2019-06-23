/*
    KPLIB_fnc_mission_preInit

    File: fn_mission_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-09
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {

    ["Module initializing...", "PRE] [Mission", true] call KPLIB_fnc_common_log;

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_mission_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_mission_saveData;}] call CBA_fnc_addEventHandler;

    // Register mission execution event handler
    ["KPLIB_missionExec", {call compile preprocessFileLineNumbers (_this select 0);}] call CBA_fnc_addEventHandler;

    // Register mission end event handler
    ["KPLIB_missionEnd", {[_this select 0] call KPLIB_fnc_mission_endMission;}] call CBA_fnc_addEventHandler;

    KPLIB_mission_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_mission_data";

};

// Process CBA Settings
[] call KPLIB_fnc_mission_settings;

if (isServer) then {["Module initialized", "PRE] [MISSION", true] call KPLIB_fnc_common_log;};

true
