/*
    KPLIB_fnc_adm_preInit

    File: fn_adm_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This preInit function defines just the global variables which are added due to this module.

    Dependencies:
        * KP GUI system

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ADM] Module initializing...", diag_tickTime];};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [ADM] Module initialized", diag_tickTime];};

true
