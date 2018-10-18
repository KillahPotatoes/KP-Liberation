/*
    KPLIB_fnc_respawn_preInitModule

    File: fn_respawn_preInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This preInit function defines just the global variables which are added due to this module.

    Dependencies:
        * 02_core

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESPAWN] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Last time a mobile respawn was done
KPLIB_respawn_time = time;

KPLIB_respawn_camera = "camera" camCreate KPLIB_zeroPos;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESPAWN] Module initialized", diag_tickTime];};

true
