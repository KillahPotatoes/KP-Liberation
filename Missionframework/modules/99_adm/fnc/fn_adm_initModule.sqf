/*
    KPLIB_fnc_adm_initModule

    File: fn_adm_initModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-08-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides an admin menu for a KP Liberation server.

    Dependencies:
    NONE

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [ADM] Module initializing...", diag_tickTime];};

// Read the module globals
call compile preprocessFileLineNumbers "modules\99_adm\globals.sqf";

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [ADM] Module initialized", diag_tickTime];};

true
