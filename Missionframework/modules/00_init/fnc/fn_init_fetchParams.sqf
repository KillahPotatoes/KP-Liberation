/*
    KPLIB_fnc_init_fetchParams

    File: fn_init_fetchParams.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Fetches all mission parameters to global variables and switches values to float if needed.
    Also reads the KPLIB_config.sqf

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Parameter fetching
KPLIB_param_unitcap = ["Unitcap", 2] call BIS_fnc_getParamValue;
KPLIB_param_difficulty = ["Difficulty", 2] call BIS_fnc_getParamValue;
KPLIB_param_aggressivity = ["Aggressivity", 2] call BIS_fnc_getParamValue;
KPLIB_param_adaptiveEnemy = ["AdaptiveEnemy", 1] call BIS_fnc_getParamValue;
KPLIB_param_civilians = ["Civilians", 2] call BIS_fnc_getParamValue;
KPLIB_param_firstFob = ["FirstFob", 0] call BIS_fnc_getParamValue;
KPLIB_param_maxFobs = ["MaxFobs", 10] call BIS_fnc_getParamValue;
KPLIB_param_maxSquadSize = ["MaxSquadSize", 12] call BIS_fnc_getParamValue;
KPLIB_param_aiDefenders = ["AiDefenders", 1] call BIS_fnc_getParamValue;
KPLIB_param_autodanger = ["Autodanger", 1] call BIS_fnc_getParamValue;
KPLIB_param_timeMulti = ["TimeMulti", 6] call BIS_fnc_getParamValue;
KPLIB_param_shortNight = ["ShortNight", 0] call BIS_fnc_getParamValue;
KPLIB_param_weather = ["Weather", 3] call BIS_fnc_getParamValue;
KPLIB_param_resMulti = ["ResMulti", 3] call BIS_fnc_getParamValue;
KPLIB_param_fatigue = ["Fatigue", 1] call BIS_fnc_getParamValue;
KPLIB_param_arsenalPreset = ["ArsenalPreset", 1] call BIS_fnc_getParamValue;
KPLIB_param_mapMarkers = ["MapMarkers", 1] call BIS_fnc_getParamValue;
KPLIB_param_mobileRespawn = ["MobileRespawn", 1] call BIS_fnc_getParamValue;
KPLIB_param_respawnCd = ["RespawnCd", 900] call BIS_fnc_getParamValue;
KPLIB_param_mobileArsenal = ["MobileArsenal", 1] call BIS_fnc_getParamValue;
KPLIB_param_aiLogistics = ["AiLogistics", 1] call BIS_fnc_getParamValue;
KPLIB_param_teamkillPenalty = ["TeamkillPenalty", 0] call BIS_fnc_getParamValue;
KPLIB_param_civRepBuilding = ["CivRepBuilding", 0] call BIS_fnc_getParamValue;
KPLIB_param_halo = ["Halo", 0] call BIS_fnc_getParamValue;
KPLIB_param_permissions = ["Permissions", 1] call BIS_fnc_getParamValue;
KPLIB_param_cleanupVeh = ["CleanupVeh", 2] call BIS_fnc_getParamValue;
KPLIB_param_intro = ["Intro", 1] call BIS_fnc_getParamValue;
KPLIB_param_deployCine = ["DeployCine", 1] call BIS_fnc_getParamValue;
KPLIB_param_whitelist = ["Whitelist", 0] call BIS_fnc_getParamValue;
KPLIB_param_serverRestart = ["ServerRestart", 0] call BIS_fnc_getParamValue;
KPLIB_param_wipeSave1 = ["WipeSave1", 0] call BIS_fnc_getParamValue;
KPLIB_param_wipeSave2 = ["WipeSave2", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugAsymm = ["DebugAsymm", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugCivInfo = ["DebugCivInfo", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugCivRep = ["DebugCivRep", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugKill = ["DebugKill", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugLogi = ["DebugLogi", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugProd = ["DebugProd", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugSave = ["DebugSave", 0] call BIS_fnc_getParamValue;
KPLIB_param_debugSectorSpawn = ["DebugSectorSpawn", 0] call BIS_fnc_getParamValue;

// Check for ACE
KPLIB_aceEnable = isClass (configFile >> "CfgVehicles" >> "ACE_module");

// Float value conversion
switch (KPLIB_param_unitcap) do {
    case 0: {KPLIB_param_unitcap = 0.5;};
    case 1: {KPLIB_param_unitcap = 0.75;};
    case 2: {KPLIB_param_unitcap = 1;};
    case 3: {KPLIB_param_unitcap = 1.25;};
    case 4: {KPLIB_param_unitcap = 1.5;};
    case 5: {KPLIB_param_unitcap = 2;};
    default {KPLIB_param_unitcap = 1;};
};

switch (KPLIB_param_difficulty) do {
    case 0: {KPLIB_param_difficulty = 0.5;};
    case 1: {KPLIB_param_difficulty = 0.75;};
    case 2: {KPLIB_param_difficulty = 1;};
    case 3: {KPLIB_param_difficulty = 1.25;};
    case 4: {KPLIB_param_difficulty = 1.5;};
    case 5: {KPLIB_param_difficulty = 2;};
    case 6: {KPLIB_param_difficulty = 4;};
    case 7: {KPLIB_param_difficulty = 10;};
    default {KPLIB_param_difficulty = 1;};
};

switch (KPLIB_param_aggressivity) do {
    case 0: {KPLIB_param_aggressivity = 0.25;};
    case 1: {KPLIB_param_aggressivity = 0.5;};
    case 2: {KPLIB_param_aggressivity = 1;};
    case 3: {KPLIB_param_aggressivity = 2;};
    case 4: {KPLIB_param_aggressivity = 4;};
    default {KPLIB_param_aggressivity = 1;};
};

switch (KPLIB_param_civilians) do {
    case 0: {KPLIB_param_civilians = 0;};
    case 1: {KPLIB_param_civilians = 0.5;};
    case 2: {KPLIB_param_civilians = 1;};
    case 3: {KPLIB_param_civilians = 2;};
    default {KPLIB_param_civilians = 1;};
};

switch (KPLIB_param_resMulti) do {
    case 0: {KPLIB_param_resMulti = 0.25;};
    case 1: {KPLIB_param_resMulti = 0.5;};
    case 2: {KPLIB_param_resMulti = 0.75;};
    case 3: {KPLIB_param_resMulti = 1;};
    case 4: {KPLIB_param_resMulti = 1.25;};
    case 5: {KPLIB_param_resMulti = 1.5;};
    case 6: {KPLIB_param_resMulti = 2;};
    case 7: {KPLIB_param_resMulti = 3;};
    default {KPLIB_param_resMulti = 1;};
};

// Read the KPLIB_config.sqf file
call compile preprocessFileLineNumbers "KPLIB_config.sqf";

true
