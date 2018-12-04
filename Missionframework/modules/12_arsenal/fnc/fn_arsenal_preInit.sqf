/*
    KPLIB_fnc_arsenal_preInit

    File: fn_arsenal_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-14
    Last Update: 2018-11-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ARSENAL] Module initializing...", diag_tickTime];};

// Process CBA Settings
[] call KPLIB_fnc_arsenal_settings;

/*
    ----- Module Globals -----
*/

// Array of all whitelisted arsenal items
KPLIB_preset_arsenal_whitelist = [];

 // Array of all blacklisted arsenal items
KPLIB_preset_arsenal_blacklist = [];


if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ARSENAL] Module initialized", diag_tickTime];};

true
