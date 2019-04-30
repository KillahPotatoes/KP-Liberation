/*
    KPLIB_fnc_permission_postInit

    File: fn_permission_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2019-05-01
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

    // Slot permissions
    // Commander
    [
        "Commander",
        {},
        false,
        "GroupSlots"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Sub-Commander
    [
        "SubCommander",
        {},
        false,
        "GroupSlots"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Build menu permissions
    // Build
    [
        "Build",
        {},
        false,
        "GroupBuildMenu"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Logistic station permissions
    // Recycle
    [
        "Recycle",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Resupply
    [
        "Resupply",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Cratefiller
    [
        "Cratefiller",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Vehicle permissions
    // Add Light Vehicle Permission
    [
        "LightVehicle",
        {},
        true,
        "GroupVehicle",
        (KPLIB_preset_vehLightUnarmedPlF + KPLIB_preset_vehLightArmedPlF)
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Transport Vehicle Permission
    [
        "TransportVehicle",
        {},
        true,
        "GroupVehicle",
        KPLIB_preset_vehTransPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Heavy Vehicle Permission
    [
        "HeavyVehicle",
        {},
        false,
        "GroupVehicle",
        (KPLIB_preset_vehHeavyApcPlF + KPLIB_preset_vehHeavyPlF)
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Anti Air Vehicle Permission
    [
        "AntiAirVehicle",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_vehAntiAirPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Artillery Vehicle Permission
    [
        "ArtilleryVehicle",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_vehArtyPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Transport Helicopter Permission
    [
        "TransportHelicopter",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_heliTransPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Attack Helicopter Permission
    [
        "AttackHelicopter",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_heliAttackPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Transport Plane Permission
    [
        "TransportPlane",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_planeTransPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Jet Permission
    [
        "Jet",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_jetsPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Add Logistic Vehicle Permission
    [
        "Logistic",
        {},
        false,
        "GroupVehicle",
        KPLIB_preset_logisticPlF
    ] call KPLIB_fnc_permission_addPermissionHandler;
};

if (hasInterface) then {
    // Check if player is already registered to the permission system
    [] call KPLIB_fnc_permission_registerPlayer;

    // Setup of actions available to players
    [] call KPLIB_fnc_permission_setupPlayerActions;

    // Check the slot permissions
    if ((str player) isEqualTo "KPLIB_eden_commander" && !(["Commander"] call KPLIB_fnc_permission_checkPermission)) then {
        ["KPLIB_MissingPermission"] call BIS_fnc_endMission;
    };
    if ((str player) isEqualTo "KPLIB_eden_subCommander" && !(["SubCommander"] call KPLIB_fnc_permission_checkPermission)) then {
        ["KPLIB_MissingPermission"] call BIS_fnc_endMission;
    };

    // Add vehicle event handlers
    player addEventHandler ["GetInMan", {if !([_this select 0, _this select 1, _this select 2] call KPLIB_fnc_permission_checkVehiclePermission) then {[] call KPLIB_fnc_permission_ejectPlayer};}];
    player addEventHandler ["SeatSwitchedMan", {if !([_this select 0, "", _this select 2] call KPLIB_fnc_permission_checkVehiclePermission) then {[] call KPLIB_fnc_permission_ejectPlayer};}];
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initialized", diag_tickTime];};

true
