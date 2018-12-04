/*
    KPLIB_fnc_build_postInit

    File: fn_build_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [BUILD] Module initializing...", diag_tickTime];};

[] call KPLIB_fnc_build_setupPlayerActions;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [BUILD] Module initialized", diag_tickTime];};

true
