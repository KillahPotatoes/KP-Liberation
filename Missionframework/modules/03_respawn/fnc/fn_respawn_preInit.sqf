/*
    KPLIB_fnc_respawn_preInit

    File: fn_respawn_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESPAWN] Module initializing...", diag_tickTime];};

// Process CBA Settings
[] call KPLIB_fnc_respawn_settings;

/*
    ----- Module Globals -----
*/

// Last time a mobile respawn was done
KPLIB_respawn_time = time;

KPLIB_respawn_camera = "camera" camCreate KPLIB_zeroPos;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESPAWN] Module initialized", diag_tickTime];};

true
