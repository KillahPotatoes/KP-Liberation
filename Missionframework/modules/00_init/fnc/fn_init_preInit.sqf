/*
    KPLIB_fnc_init_preInit

    File: fn_init_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-10-18
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

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [INIT] Module initializing...", diag_tickTime];};

// Execute config guard function
[] call KPLIB_fnc_init_configGuard;

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

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_init_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_init_saveData;}] call CBA_fnc_addEventHandler;
};

// Read the KPLIB_config.sqf file
[] call compile preprocessFileLineNumbers "KPLIB_config.sqf";

/*
    ----- Module Globals -----
*/

// Array of all whitelisted arsenal items
KPLIB_arsenal_whitelist = [];
// Variable for ending the campaign
KPLIB_campaignRunning = true;
// Respawn position shortcut
KPLIB_eden_respawnPos = getMarkerPos "respawn";
// Squad names for the buildable squads
KPLIB_preset_squadNames = [
    localize "STR_SQUAD_LIGHT",
    localize "STR_SQUAD_RIFLE",
    localize "STR_SQUAD_AT",
    localize "STR_SQUAD_AA",
    localize "STR_SQUAD_RECON",
    localize "STR_SQUAD_PARA"
];
// Indicator if the saved data is fully loaded
KPLIB_save_loaded = false;
// Spawnpoints for air vehicles
KPLIB_sectors_airspawn = [];
// All capturable sectors
KPLIB_sectors_all = [];
// All active sectors
KPLIB_sectors_active = [];
// Sectors which are captured by blufor
KPLIB_sectors_blufor = [];
// All city sectors
KPLIB_sectors_city = [];
// All factory sectors
KPLIB_sectors_factory = [];
// Positions of all FOBs
KPLIB_sectors_fobs = [];
// Locked vehicles <-> military bases connection array
KPLIB_sectors_lockedVeh = [];
// Markers for the locked vehicles
KPLIB_sectors_lockedVehMarkers = [];
// All metropolis (capital) sectors
KPLIB_sectors_metropolis = [];
// All military sectors
KPLIB_sectors_military = [];
// Spawnpoints for secondary missions and enemy forces
KPLIB_sectors_spawn = [];
// All radiotowers
KPLIB_sectors_tower = [];
// Reset position shortcut
KPLIB_resetPos = [99999,99999,0];
// Zero position shortcut
KPLIB_zeroPos = [0,0,0];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [INIT] Module initialized", diag_tickTime];};

true
