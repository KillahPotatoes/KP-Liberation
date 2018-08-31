/*
    KPLIB_fnc_init_preInitModule

    File: fn_init_preInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-08-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Tasks of this module are:
        * Fetch parameters
        * Fetch config values
        * Define basic ui values
        * Fetch, check and distribute preset data

    Dependencies:
    NONE

    Returns:
    BOOL
*/

if (!isServer) exitWith {};

diag_log format ["[KP LIBERATION] [%1] [PRE INIT] Module initializing...", diag_tickTime];

// Deactivate vanilla saving
enableSaving [false, false];

// Initialize Debug Events
DEBUG_EVENTS = [
        "KPLIB_vehicle_spawned",
        "KPLIB_fob_built",
        "KPLIB_sector_activated",
        "KPLIB_sector_captured",
        "KPLIB_sector_deactivated",
        "KPLIB_player_fob"
    ];

{
    [_x, compile ("diag_log 'eventCalled " + _x + "'; diag_log _this;")] call CBA_fnc_addEventHandler;
    [_x, compile ("systemChat 'eventCalled " + _x + "'; systemChat format['%1', _this];")] call CBA_fnc_addEventHandler;
} forEach DEBUG_EVENTS;

// Check for ACE
KPLIB_ace_enabled = isClass (configFile >> "CfgPatches" >> "ace_main");
KPLIB_ace_medical = isClass (configfile >> "CfgPatches" >> "ace_medical");

// Check for KP Ranks
KPLIB_kpr_enabled = isClass (configFile >> "CfgPatches" >> "KP_Ranks");

// Parameter processing
KPLIB_param_source = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;
call KPLIB_fnc_init_paramFetchAll;

// Read the KPLIB_config.sqf file
call compile preprocessFileLineNumbers "KPLIB_config.sqf";

diag_log format ["[KP LIBERATION] [%1] [PRE INIT] Module initialized", diag_tickTime];

true
