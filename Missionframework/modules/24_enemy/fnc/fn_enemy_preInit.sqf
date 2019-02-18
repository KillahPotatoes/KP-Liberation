/*
    KPLIB_fnc_enemy_preInit

    File: fn_enemy_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-02-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ENEMY] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Strength of the enemy (0-1000)
KPLIB_enemy_strength = 500;

// Awareness of the enemy (0-100)
KPLIB_enemy_awareness = 0;

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
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ENEMY] Module initialized", diag_tickTime];};

true
