/*
    KPLIB_fnc_garrison_postInit

    File: fn_garrison_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        This module provides a persistent garrison for each sector.
        It handles the spawn, despawn, capture and despawn events which are affecting the garrison strength.
        It'll also provide functions to change garrison data and a garrison management dialog for the player owned sectors.

    Dependencies:
        * 00_init
        * 01_common
        * 02_core

    Returns:
        Module was initialized [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [GARRISON] Module initializing...", diag_tickTime];};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [GARRISON] Module initialized", diag_tickTime];};

true
