/*
    KPLIB_fnc_example_preInit

    File: fn_example_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CRATEFILLER] Module initializing...", diag_tickTime];};

/*
    ----- Module Initialization -----
*/

// Process CBA Settings
[] call KPLIB_fnc_cratefiller_settings;

// Server section (dedicated and player hosted)
if (isServer) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CRATEFILLER] Module initialized", diag_tickTime];};

true
