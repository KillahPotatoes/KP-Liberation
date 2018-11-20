/*
    KPLIB_fnc_virtual_preInit

    File: fn_virtual_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [VIRTUAL] Module initializing...", diag_tickTime]};

[] call KPLIB_fnc_virtual_settings;

if (isServer) then {
    ["KPLIB_player_giveZeus", KPLIB_fnc_virtual_addCurator] call CBA_fnc_addEventHandler;
};


if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [VIRTUAL] Module initialized", diag_tickTime]};

true
