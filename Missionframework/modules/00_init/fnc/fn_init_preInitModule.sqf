/*
    KPLIB_fnc_init_preInitModule

    File: fn_init_preInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-10-06
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

diag_log format ["[KP LIBERATION] [%1] [PRE INIT] Module initializing...", diag_tickTime];

// Check for ACE
KPLIB_ace_enabled = isClass (configFile >> "CfgPatches" >> "ace_main");
KPLIB_ace_medical = isClass (configfile >> "CfgPatches" >> "ace_medical");

// Check for KP Ranks
KPLIB_kpr_enabled = isClass (configFile >> "CfgPatches" >> "KP_Ranks");

// Parameter processing and vanilla save deactivation on the server only
if (isServer) then {
    enableSaving [false, false];

    KPLIB_param_source = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;
    [] call KPLIB_fnc_init_paramFetchAll;
};

// Read the KPLIB_config.sqf file
[] call compile preprocessFileLineNumbers "KPLIB_config.sqf";

// Register load event handler
["KPLIB_doLoad", {[] call KPLIB_fnc_init_loadData;}] call CBA_fnc_addEventHandler;

diag_log format ["[KP LIBERATION] [%1] [PRE INIT] Module initialized", diag_tickTime];

true
