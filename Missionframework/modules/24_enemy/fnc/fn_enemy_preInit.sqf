/*
    KPLIB_fnc_enemy_preInit

    File: fn_enemy_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [ENEMY", true] call KPLIB_fnc_common_log;};

/*
    ----- Module Globals -----
*/

// Awareness of the enemy (0-100)
KPLIB_enemy_awareness = 0;
// All enemy patrols
KPLIB_enemy_patrols = [];
// Strength of the enemy (0-1000)
KPLIB_enemy_strength = 500;

/*
    ----- Module Initialization -----
*/

// Process CBA Settings
[] call KPLIB_fnc_enemy_settings;

// Server section (dedicated and player hosted)
if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_enemy_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_enemy_saveData;}] call CBA_fnc_addEventHandler;

    // Register sector activation event handler
    ["KPLIB_sector_activated", {[_this select 0] call KPLIB_fnc_enemy_sectorAct;}] call CBA_fnc_addEventHandler;

    // Register sector captured event handler
    ["KPLIB_sector_captured", {[_this select 0] call KPLIB_fnc_enemy_sectorCapture;}] call CBA_fnc_addEventHandler;

    // Register sector deactivation event handler
    ["KPLIB_sector_deactivated", {[_this select 0] call KPLIB_fnc_enemy_sectorDeact;}] call CBA_fnc_addEventHandler;

    // Register convoy arrival event handler
    ["KPLIB_transferConvoy_end", {_this call KPLIB_fnc_enemy_handleConvoyEnd;}] call CBA_fnc_addEventHandler;
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {["Module initialized", "PRE] [ENEMY", true] call KPLIB_fnc_common_log;};

true
