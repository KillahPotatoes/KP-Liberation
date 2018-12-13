/*
    KPLIB_fnc_res_preInit

    File: fn_res_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initializing...", diag_tickTime];};

// Server section (dedicated and player hosted)
if (isServer) then {

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

/*
    ----- Module Globals -----
*/



if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initialized", diag_tickTime];};

true
