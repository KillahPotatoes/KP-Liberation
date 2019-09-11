/*
    KPLIB_fnc_captive_preInit

    File: fn_captive_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-10
    Last Update: 2019-09-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;

/*
    ----- Module Initialization -----
*/

    // Units surrender on sector capture
    ["KPLIB_sector_captured", {[_this select 0] call KPLIB_fnc_captive_checkSector;}] call CBA_fnc_addEventHandler;

    // Check for handcuffed enemys
    ["call CBA_fnc_addEventHandler;", {[_this select 0, _this select 1, _this select 2] call KPLIB_fnc_captive_setAceCaptive}] call CBA_fnc_addEventHandler;

};

if (isServer) then {["Module initialized", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;};

true
