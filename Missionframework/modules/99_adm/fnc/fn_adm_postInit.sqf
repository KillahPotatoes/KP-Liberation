/*
    KPLIB_fnc_adm_postInit

    File: fn_adm_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        This module provides an admin menu for a KP Liberation server.

    Dependencies:
        NONE

    Returns:
        Module was initialized [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ADM] Module initializing...", diag_tickTime];};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ADM] Module initialized", diag_tickTime];};

true
