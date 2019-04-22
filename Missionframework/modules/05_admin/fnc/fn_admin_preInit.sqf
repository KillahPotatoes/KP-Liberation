/*
    KPLIB_fnc_admin_preInit

    File: fn_admin_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [ADMIN", true] call KPLIB_fnc_common_log;};

if (isServer) then {["Module initialized", "PRE] [ADMIN", true] call KPLIB_fnc_common_log;};

true
