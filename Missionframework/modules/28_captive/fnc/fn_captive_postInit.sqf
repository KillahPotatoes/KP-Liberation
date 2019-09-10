/*
    KPLIB_fnc_captive_postInit

    File: fn_captive_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-10
    Last Update: 2019-09-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "POST] [CAPTIVE", true] call KPLIB_fnc_common_log;};

// Server section (dedicated and player hosted)
if (isServer) then {

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {["Module initialized", "POST] [CAPTIVE", true] call KPLIB_fnc_common_log;};

true
