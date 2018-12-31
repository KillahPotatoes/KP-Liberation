/*
    KPLIB_fnc_permission_postInit

    File: fn_permission_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-29
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

    // Add Light Vehicle Permission
    [
        "LightVehicle",
        {[player, "LightVehicle"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_LIGHTVEHICLE",
        true,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        (KPLIB_preset_vehLightUnarmedPlF + KPLIB_preset_vehLightArmedPlF)
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Heavy Vehicle Permission
    [
        "HeavyVehicle",
        {[player, "HeavyVehicle"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_HEAVYVEHICLE",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        (KPLIB_preset_vehHeavyApcPlF + KPLIB_preset_vehHeavyPlF)
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Anti Air Vehicle Permission
    [
        "AntiAirVehicle",
        {[player, "AntiAirVehicle"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_ANTIAIRVEHICLE",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_vehAntiAirPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Artillery Vehicle Permission
    [
        "ArtilleryVehicle",
        {[player, "ArtilleryVehicle"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_ARTILLERYVEHICLE",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_vehArtyPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Transport Helicopter Permission
    [
        "TransportHelicopter",
        {[player, "TransportHelicopter"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_TRANSPORTHELICOPTER",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_heliTransPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Attack Helicopter Permission
    [
        "AttackHelicopter",
        {[player, "AttackHelicopter"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_ATTACKHELICOPTER",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_heliAttackPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Transport Plane Permission
    [
        "TransportPlane",
        {[player, "TransportPlane"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_TRANSPORTPLANE",
        false,
        "Vehicle", "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_planeTransPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Jet Permission
    [
        "Jet",
        {[player, "Jet"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_JET",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_jetsPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Logistic Vehicle Permission
    [
        "Logistic",
        {[player, "Logistic"] call KPLIB_fnc_permission_getPermission},
        "STR_KPLIB_PERMISSION_LOGISTIC",
        false,
        "Vehicle",
        "STR_KPLIB_PERMISSION_GROUPVEHICLE",
        KPLIB_preset_logisticPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;
};

if (hasInterface) then {
    // Check if player is already registered to the permission system
    [] call KPLIB_fnc_permission_registerPlayer;

    // Setup of actions available to players
    [] call KPLIB_fnc_permission_setupPlayerActions;

    // Add vehicle event handlers
    player addEventHandler ["GetInMan", {if !([_this select 0, _this select 1, _this select 2] call KPLIB_fnc_permission_checkVehiclePermission) then {[] call KPLIB_fnc_permission_ejectPlayer};}];
    player addEventHandler ["SeatSwitchedMan", {if !([_this select 0, "", _this select 2] call KPLIB_fnc_permission_checkVehiclePermission) then {[] call KPLIB_fnc_permission_ejectPlayer};}];
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initialized", diag_tickTime];};

true
