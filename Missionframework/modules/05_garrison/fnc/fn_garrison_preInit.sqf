/*
    KPLIB_fnc_garrison_preInit

    File: fn_garrison_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Generic Text ;)

    Dependencies:
    NONE

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [GARRISON] Module initializing...", diag_tickTime];};

if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_garrison_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_garrison_saveData;}] call CBA_fnc_addEventHandler;

    // Register sector activation event handler
    ["KPLIB_sector_activated", {[_this select 0] call KPLIB_fnc_garrison_spawn;}] call CBA_fnc_addEventHandler;

    // Register sector deactivation event handler
    ["KPLIB_sector_deactivated", {[_this select 0] call KPLIB_fnc_garrison_despawn;}] call CBA_fnc_addEventHandler;
};

/*
    ----- Module Globals -----
*/

// Array which contains all garrisons
KPLIB_garrison_array = [];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [GARRISON] Module initialized", diag_tickTime];};

true
