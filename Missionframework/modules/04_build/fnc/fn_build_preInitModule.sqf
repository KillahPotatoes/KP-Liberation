/*
    KPLIB_fnc_build_preInitModule

    File: fn_build_preInitModule.sqf
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

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [BUILD] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Build camera
KPLIB_build_camera = objNull;

KPLIB_buildLogic = locationNull;

// Build camera PFH ticker id
KPLIB_build_ticker = -1;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [BUILD] Module initialized", diag_tickTime];};

true
