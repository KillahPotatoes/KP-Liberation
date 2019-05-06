/*
    KPLIB_fnc_respawn_postInit

    File: fn_respawn_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2019-04-22
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

if (isServer) then {["Module initializing...", "POST] [RESPAWN", true] call KPLIB_fnc_common_log;};

// Server section (dedicated and player hosted)
if (isServer) then {

};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {
    ["KPLIB_respawn_requested", {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [] call KPLIB_fnc_respawn_open;
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {["Module initialized", "POST] [RESPAWN", true] call KPLIB_fnc_common_log;};

true
