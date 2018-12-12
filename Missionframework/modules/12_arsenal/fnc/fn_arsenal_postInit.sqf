/*
    KPLIB_fnc_arsenal_postInit

    File: fn_arsenal_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-12
    Last Update: 2018-12-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initializing...", diag_tickTime];};

// Add event handler for gear check
if (hasInterface) then {
    // Setup of actions available to players
    [] call KPLIB_fnc_arsenal_setupPlayerActions;

    [missionNamespace, "arsenalOpened", {player setVariable ["KPLIB_backpack", backpack player]}] call BIS_fnc_addScriptedEventHandler;
    [missionNamespace, "arsenalClosed", {[] call KPLIB_fnc_arsenal_checkGear}] call BIS_fnc_addScriptedEventHandler;
    ["ace_arsenal_displayOpened", {player setVariable ["KPLIB_backpack", backpack player]}] call CBA_fnc_addEventHandler;
    ["ace_arsenal_displayClosed", {[] call KPLIB_fnc_arsenal_checkGear}] call CBA_fnc_addEventHandler;
    ["KPLIB_player_redeploy", {[] call KPLIB_fnc_arsenal_checkGear}] call CBA_fnc_addEventHandler;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initialized", diag_tickTime];};

true
