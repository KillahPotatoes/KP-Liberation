/*
    KPLIB_fnc_captive_preInit

    File: fn_captive_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-10
    Last Update: 2019-09-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;};

/*
    ----- Module Globals -----
*/


/*
    ----- Module Initialization -----
*/



// Server section (dedicated and player hosted)
if (isServer) then {

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {["Module initialized", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;};

true
