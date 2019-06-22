/*
    KPLIB_fnc_mission_postInit

    File: fn_mission_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-09
    Last Update: 2019-06-23
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

if (isServer) then {
    ["Module initializing...", "POST] [MISSION", true] call KPLIB_fnc_common_log;

    // Mission permission
    [
        "Mission",
        {},
        false
    ] call KPLIB_fnc_permission_addPermissionHandler;

};

if (hasInterface) then {

    // Setup of actions available to players
    [] call KPLIB_fnc_mission_setupPlayerActions;

};

if (isServer) then {["Module initialized", "POST] [MISSION", true] call KPLIB_fnc_common_log;};

true
