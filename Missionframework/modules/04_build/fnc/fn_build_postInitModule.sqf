/*
    KPLIB_fnc_build_postInitModule

    File: fn_build_postInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides building functionalities

    Dependencies:
        * 02_core

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [BUILD] Module initializing...", diag_tickTime];};

[] call KPLIB_fnc_build_setupPlayerActions;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [BUILD] Module initialized", diag_tickTime];};

true
