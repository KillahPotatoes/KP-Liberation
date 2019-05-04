/*
    KPLIB_fnc_persistence_preInit

    File: fn_persistence_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [PERSISTENCE", true] call KPLIB_fnc_common_log;};

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

    // Add default persistent variables
    {
        _x params ["_var", "_global"];
        [_var, _global] call KPLIB_fnc_persistence_addPersistentVar;
    } forEach [
        ["ace_rearm_magazineSupply", true],
        ["ace_rearm_currentSupply", true],
        ["ace_refuel_currentFuelCargo", true]
    ];
};

if (isServer) then {["Module initialized", "PRE] [PERSISTENCE", true] call KPLIB_fnc_common_log;};

true
