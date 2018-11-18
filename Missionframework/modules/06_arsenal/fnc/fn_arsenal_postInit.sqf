/*
    KPLIB_fnc_arsenal_postInit

    File: fn_arsenal_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-12
    Last Update: 2018-11-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {
    diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initializing...", diag_tickTime];

    // Load arsenal
    [] call KPLIB_fnc_arsenal_fillArsenal;
};


if (hasInterface && KPLIB_ace_enabled) then {
    [player, KPLIB_arsenal_whitelist, false] call ace_arsenal_fnc_addVirtualItems;
};

// Setup of actions available to players
[] call KPLIB_fnc_arsenal_setupPlayerActions;

// Add event handler for gear check
if (hasInterface) then {
    [missionNamespace, "arsenalClosed", {[backpack player] call KPLIB_fnc_arsenal_checkGear}] call BIS_fnc_addScriptedEventHandler;
    ["ace_arsenal_displayClosed", {[backpack player] call KPLIB_fnc_arsenal_checkGear}] call CBA_fnc_addEventHandler;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initialized", diag_tickTime];};

true
