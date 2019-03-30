/*
    KPLIB_fnc_persistence_preInit

    File: fn_persistence_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [PERSISTENCE] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

KPLIB_persistence_objects = [];
KPLIB_persistence_units = [];

// List of variables that will be persisted
KPLIB_persistenceSavedVars = [];

/*
    ----- Module Initialization -----
*/

// Server section (dedicated and player hosted)
if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_persistence_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_persistence_saveData;}] call CBA_fnc_addEventHandler;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [PERSISTENCE] Module initialized", diag_tickTime];};

true
