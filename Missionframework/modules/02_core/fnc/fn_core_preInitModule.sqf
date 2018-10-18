/*
    KPLIB_fnc_core_preInitModule

    File: fn_core_preInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This preInit function defines just the global variables which are added due to this module.

    Dependencies:
        * 00_init

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CORE] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Potato 01 vehicle reference
KPLIB_core_potato01 = objNull;
// Deploy button trigger for redeploy dialog
KPLIB_dialog_deploy = 0;
// Intro cinematic done
KPLIB_intro_done = false;
// Intro cinematic running
KPLIB_intro_running = false;
// Start game button state in intro cinematic
KPLIB_intro_startGame = 0;
// Tutorial button state in intro cinematic
KPLIB_intro_tutorial = 0;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CORE] Module initialized", diag_tickTime];};

true
