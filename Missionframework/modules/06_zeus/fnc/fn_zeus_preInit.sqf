/*
    KPLIB_fnc_zeus_preInit

    File: fn_zeus_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [zeus] Module initializing...", diag_tickTime];};

if (hasInterface) then {

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [zeus] Module initialized", diag_tickTime];};

true
