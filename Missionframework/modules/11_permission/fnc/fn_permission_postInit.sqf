/*
    KPLIB_fnc_permission_postInit

    File: fn_permission_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-23
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
    diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initializing...", diag_tickTime];

    ["LightVehicle", {[player, "LightVehicle"] call KPLIB_fnc_permission_getPermission}, "STR_KPLIB_PERMISSION_LIGHTVEHICLE", true, KPLIB_preset_lightVeh] call KPLIB_fnc_permission_addPermissionHandler;
    ["HeavyVehicle", {[player, "HeavyVehicle"] call KPLIB_fnc_permission_getPermission}, "STR_KPLIB_PERMISSION_HEAVYVEHICLE", false, KPLIB_preset_heavyVeh] call KPLIB_fnc_permission_addPermissionHandler;
    ["Helicopter", {[player, "Helicopter"] call KPLIB_fnc_permission_getPermission}, "STR_KPLIB_PERMISSION_HELICOPTER", false, KPLIB_preset_airVeh] call KPLIB_fnc_permission_addPermissionHandler;
};

if (hasInterface) then {
    // Check if player is already registered to the permission system
    [] call KPLIB_fnc_permission_registerPlayer;

    // Setup of actions available to players
    [] call KPLIB_fnc_permission_setupPlayerActions;

    // Add vehicle event handlers
    player addEventHandler ["GetInMan", {if !([_this select 0, _this select 1, _this select 2] call KPLIB_fnc_permission_checkVehiclePermission) then {[] call KPLIB_fnc_permission_ejectPlayer};}];
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initialized", diag_tickTime];};

true
