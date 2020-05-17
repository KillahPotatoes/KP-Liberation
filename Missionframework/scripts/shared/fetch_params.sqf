#include "defines.hpp"

// Check if ACE is running
if (isClass (configfile >> "CfgPatches" >> "ace_common")) then {KPLIB_ace = true; ["ACE detected. Deactivating resupply script from Liberation.", "MOD"] call KPLIB_fnc_log;} else {KPLIB_ace = false};

/* Not saveable params */
KPLIB_param_wipe_savegame_1 = ["WipeSave1", 0] call bis_fnc_getParamValue;
KPLIB_param_wipe_savegame_2 = ["WipeSave2", 0] call bis_fnc_getParamValue;
KPLIB_civinfo_debug = ["DebugCivInfo", 0] call bis_fnc_getParamValue;
KPLIB_civrep_debug = ["DebugCivRep", 0] call bis_fnc_getParamValue;
KPLIB_savegame_debug = ["DebugSave", 0] call bis_fnc_getParamValue;
KPLIB_asymmetric_debug = ["DebugAsymmetric", 0] call bis_fnc_getParamValue;
KPLIB_logistic_debug = ["DebugLogistic", 0] call bis_fnc_getParamValue;
KPLIB_sectorspawn_debug = ["DebugSectorSpawn", 0] call bis_fnc_getParamValue;
KPLIB_kill_debug = ["DebugKill", 0] call bis_fnc_getParamValue;
KPLIB_production_debug = ["DebugProduction", 0] call bis_fnc_getParamValue;
KPLIB_highcommand_debug = ["DebugHighCommand", 0] call bis_fnc_getParamValue;

KP_load_params = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;

if(isServer) then {
    private _start = diag_tickTime;
    /* Saveable params */
    ["----- Server starts parameter initialization", "PARAM"] call KPLIB_fnc_log;
    switch (KP_load_params) do {
        case 0: {
            ["Save/Load is set to SAVE", "PARAM"] call KPLIB_fnc_log;
        };
        case 1: {
            ["Save/Load is set to LOAD", "PARAM"] call KPLIB_fnc_log;
        };
        case 2: {
            ["Save/Load is set to USE SELECTED", "PARAM"] call KPLIB_fnc_log;
        };
        default {
            ["Save/Load has no valid value", "PARAM"] call KPLIB_fnc_log;
        };
    };

    // Mission Options
    ["--- Mission Options ---", "PARAM"] call KPLIB_fnc_log;
    GET_PARAM(KPLIB_unitcap, "Unitcap", 2);
    GET_PARAM(KPLIB_difficulty_modifier, "Difficulty", 2);
    GET_PARAM(KPLIB_csat_aggressivity, "Aggressivity", 2);
    GET_PARAM_BOOL(KPLIB_adaptive_opfor, "AdaptToPlayercount", 1);
    GET_PARAM(KPLIB_civilian_activity, "Civilians", 1);
    GET_PARAM_BOOL(KPLIB_build_first_fob, "FirstFob", 0);
    GET_PARAM_BOOL(KPLIB_fob_vehicle, "FirstFobVehicle", 0);
    GET_PARAM(KPLIB_maximum_fobs, "MaximumFobs", 26);
    GET_PARAM(KPLIB_max_squad_size, "MaxSquadSize", 10);
    GET_PARAM_BOOL(KPLIB_blufor_defenders, "BluforDefenders", 1);
    GET_PARAM_BOOL(KPLIB_autodanger, "Autodanger", 0);
    GET_PARAM(KPLIB_time_factor, "DayDuration", 12);
    GET_PARAM_BOOL(KPLIB_shorter_nights, "ShorterNights", 0);
    GET_PARAM(KPLIB_weather_param, "Weather", 3);
    GET_PARAM_BOOL(KPLIB_fog_param, "VanillaFog", 1);
    GET_PARAM(KPLIB_resources_multiplier, "ResourcesMultiplier", 3);
    GET_PARAM_BOOL(KPLIB_arsenal_type, "ArsenalType", 0);
    GET_PARAM_BOOL(KPLIB_playermenu, "PlayerMenu", 1);
    GET_PARAM(KPLIB_victoryCondition, "VictoryCondition", 0);

    // Deactivate BI Revive when ACE Medical is running
    if (isClass (configfile >> "CfgPatches" >> "ace_medical")) then {
        bis_reviveParam_mode = 0; publicVariable "bis_reviveParam_mode";
        ["ACE Medical detected. Deactivating BI Revive System.", "PARAM"] call KPLIB_fnc_log;
    } else {
        // Revive Options
        ["--- Revive Options ---", "PARAM"] call KPLIB_fnc_log;
        GET_PARAM(bis_reviveParam_mode, "ReviveMode", 1);
        GET_PARAM(bis_reviveParam_duration, "ReviveDuration", 6);
        GET_PARAM(bis_reviveParam_requiredTrait, "ReviveRequiredTrait", 1);
        GET_PARAM(bis_reviveParam_medicSpeedMultiplier, "ReviveMedicSpeedMultiplier", 1);
        GET_PARAM(bis_reviveParam_requiredItems, "ReviveRequiredItems", 1);
        GET_PARAM(bis_reviveParam_unconsciousStateMode, "UnconsciousStateMode", 0);
        GET_PARAM(bis_reviveParam_bleedOutDuration, "ReviveBleedOutDuration", 180);
        GET_PARAM(bis_reviveParam_forceRespawnDuration, "ReviveForceRespawnDuration", 10);
    };

    // Gameplay Options
    ["--- Gameplay Options ---", "PARAM"] call KPLIB_fnc_log;
    GET_PARAM_BOOL(KPLIB_fatigue, "Fatigue", 1);
    GET_PARAM_BOOL(KPLIB_sway, "WeaponSway", 1);
    GET_PARAM_BOOL(KPLIB_arsenalUsePreset, "ArsenalUsePreset", 1);
    GET_PARAM_BOOL(KPLIB_mapmarkers, "MapMarkers", 1);
    GET_PARAM_BOOL(KPLIB_mobilerespawn, "MobileRespawn", 1);
    GET_PARAM(KPLIB_respawn_cooldown, "RespawnCooldown", 900);
    GET_PARAM_BOOL(KPLIB_mobilearsenal, "MobileArsenal", 1);
    GET_PARAM_BOOL(KPLIB_ailogistics, "AiLogistics", 1);
    GET_PARAM_BOOL(KPLIB_cr_param_buildings, "CR_Building", 0);
    GET_PARAM(KPLIB_halo_param, "HaloJump", 1);
    GET_PARAM_BOOL(KPLIB_clear_cargo, "ClearCargo", 1);
    GET_PARAM(KPLIB_allowEnemiesInImmobile, "AllowEnemiesInImmobile", 50);
    GET_PARAM(KPLIB_delayDespawnMax, "DelayDespawnMax", 5);
    GET_PARAM_BOOL(KPLIB_limited_zeus, "LimitedZeus", 1);
    GET_PARAM_BOOL(KPLIB_enemies_zeus, "ZeusAddEnemies", 1);
    GET_PARAM_BOOL(KPLIB_high_command, "HighCommand", 1);
    GET_PARAM(KPLIB_suppMod, "SuppMod", 1);
    GET_PARAM_BOOL(KPLIB_tutorial, "Tutorial", 1);

    // Technical Options
    ["--- Technical Options ---", "PARAM"] call KPLIB_fnc_log;
    GET_PARAM_BOOL(KPLIB_permissions_param, "Permissions", 1);
    GET_PARAM(KPLIB_cleanup_vehicles, "CleanupVehicles", 2);
    GET_PARAM_BOOL(KPLIB_introduction, "Introduction", 1);
    GET_PARAM_BOOL(KPLIB_deployment_cinematic, "DeploymentCinematic", 1);
    GET_PARAM_BOOL(KPLIB_use_whitelist, "Whitelist", 0);
    GET_PARAM(KPLIB_restart, "ServerRestart", 0);

    GREUH_allow_mapmarkers = KPLIB_mapmarkers; publicVariable "GREUH_allow_mapmarkers";
    GREUH_allow_platoonview = KPLIB_mapmarkers; publicVariable "GREUH_allow_platoonview";

    KP_serverParamsFetched = true;
    publicVariable "KP_serverParamsFetched";

    [format ["----- Server finished parameter initialization - Time needed: %1 seconds", diag_ticktime - _start], "PARAM"] call KPLIB_fnc_log;
};

// Fix for not working float values in mission params
switch (KPLIB_unitcap) do {
    case 0: {KPLIB_unitcap = 0.5;};
    case 1: {KPLIB_unitcap = 0.75;};
    case 2: {KPLIB_unitcap = 1;};
    case 3: {KPLIB_unitcap = 1.25;};
    case 4: {KPLIB_unitcap = 1.5;};
    case 5: {KPLIB_unitcap = 2;};
    default {KPLIB_unitcap = 1;};
};

switch (KPLIB_difficulty_modifier) do {
    case 0: {KPLIB_difficulty_modifier = 0.5;};
    case 1: {KPLIB_difficulty_modifier = 0.75;};
    case 2: {KPLIB_difficulty_modifier = 1;};
    case 3: {KPLIB_difficulty_modifier = 1.25;};
    case 4: {KPLIB_difficulty_modifier = 1.5;};
    case 5: {KPLIB_difficulty_modifier = 2;};
    case 6: {KPLIB_difficulty_modifier = 4;};
    case 7: {KPLIB_difficulty_modifier = 10;};
    default {KPLIB_difficulty_modifier = 1;};
};

switch (KPLIB_csat_aggressivity) do {
    case 0: {KPLIB_csat_aggressivity = 0.25;};
    case 1: {KPLIB_csat_aggressivity = 0.5;};
    case 2: {KPLIB_csat_aggressivity = 1;};
    case 3: {KPLIB_csat_aggressivity = 2;};
    case 4: {KPLIB_csat_aggressivity = 4;};
    default {KPLIB_csat_aggressivity = 1;};
};

switch (KPLIB_civilian_activity) do {
    case 0: {KPLIB_civilian_activity = 0;};
    case 1: {KPLIB_civilian_activity = 0.5;};
    case 2: {KPLIB_civilian_activity = 1;};
    case 3: {KPLIB_civilian_activity = 2;};
    default {KPLIB_csat_aggressivity = 1;};
};

switch (KPLIB_resources_multiplier) do {
    case 0: {KPLIB_resources_multiplier = 0.25;};
    case 1: {KPLIB_resources_multiplier = 0.5;};
    case 2: {KPLIB_resources_multiplier = 0.75;};
    case 3: {KPLIB_resources_multiplier = 1;};
    case 4: {KPLIB_resources_multiplier = 1.25;};
    case 5: {KPLIB_resources_multiplier = 1.5;};
    case 6: {KPLIB_resources_multiplier = 2;};
    case 7: {KPLIB_resources_multiplier = 3;};
    default {KPLIB_resources_multiplier = 1;};
};

switch (KPLIB_victoryCondition) do {
    case 1: {
        KPLIB_victoryCheck = {
            (count (KPLIB_sectors_player select {_x in KPLIB_sectors_capital})) == (count KPLIB_sectors_capital)
            &&
            {
                (count (KPLIB_sectors_player select {_x in KPLIB_sectors_military})) == (count KPLIB_sectors_military)
            }
        };
    };
    case 2: {
        KPLIB_victoryCheck = {
            (count (KPLIB_sectors_player select {_x in KPLIB_sectors_capital})) == (count KPLIB_sectors_capital)
            &&
            {
                (count (KPLIB_sectors_player select {!(_x in KPLIB_sectors_capital)})) >= ((count (KPLIB_sectors_all - KPLIB_sectors_capital)) * 0.6)
            }
        };
    };
    case 3: {
        KPLIB_victoryCheck = {
            (count (KPLIB_sectors_player select {_x in KPLIB_sectors_capital})) == (count KPLIB_sectors_capital)
            &&
            {
                (count (KPLIB_sectors_player select {!(_x in KPLIB_sectors_capital)})) >= ((count (KPLIB_sectors_all - KPLIB_sectors_capital)) * 0.8)
            }
        };
    };
    case 4: {
        KPLIB_victoryCheck = {
            (count KPLIB_sectors_player) == (count KPLIB_sectors_all)
        };
    };
    default {
        KPLIB_victoryCheck = {
            (count (KPLIB_sectors_player select {_x in KPLIB_sectors_capital})) == (count KPLIB_sectors_capital)
        };
    };
};

if (!isDedicated && hasInterface) then {
    // Create diary section for an overview of actual mission parameters
    player createDiarySubject ["parameters", "Mission Parameters"];

    private _param = localize "STR_PARAMS_UNITCAP";
    private _value = (format ["%1", KPLIB_unitcap * 100]) + "%";
    private _text = format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DIFFICULTY";
    switch (KPLIB_difficulty_modifier) do {
        case 0.75: {_value = localize "STR_PARAMS_DIFFICULTY2";};
        case 1: {_value = localize "STR_PARAMS_DIFFICULTY3";};
        case 1.25: {_value = localize "STR_PARAMS_DIFFICULTY4";};
        case 1.5: {_value = localize "STR_PARAMS_DIFFICULTY5";};
        case 2: {_value = localize "STR_PARAMS_DIFFICULTY6";};
        case 4: {_value = localize "STR_PARAMS_DIFFICULTY7";};
        case 10: {_value = localize "STR_PARAMS_DIFFICULTY8";};
        default {_value = localize "STR_PARAMS_DIFFICULTY1";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_AGGRESSIVITY_PARAM";
    switch (KPLIB_csat_aggressivity) do {
        case 0.5: {_value = localize "STR_AGGRESSIVITY_PARAM1";};
        case 1: {_value = localize "STR_AGGRESSIVITY_PARAM2";};
        case 2: {_value = localize "STR_AGGRESSIVITY_PARAM3";};
        case 4: {_value = localize "STR_AGGRESSIVITY_PARAM4";};
        default {_value = localize "STR_AGGRESSIVITY_PARAM0";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ADAPT_TO_PLAYERCOUNT";
    _value = if (KPLIB_adaptive_opfor) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_CIVILIANS";
    switch (KPLIB_civilian_activity) do {
        case 0.5: {_value = localize "STR_PARAMS_CIVILIANS2";};
        case 1: {_value = localize "STR_PARAMS_CIVILIANS3";};
        case 2: {_value = localize "STR_PARAMS_CIVILIANS4";};
        default {_value = localize "STR_PARAMS_CIVILIANS1";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_FIRSTFOB";
    _value = if (KPLIB_build_first_fob) then {localize "STR_YES";} else {localize "STR_NO";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_FIRSTFOBVEHICLE";
    _value = if (KPLIB_fob_vehicle) then {localize "STR_PARAMS_FIRSTFOBVEHICLE_TRUCK";} else {localize "STR_PARAMS_FIRSTFOBVEHICLE_CONTAINTER";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_FOBS_COUNT";
    _value = str KPLIB_maximum_fobs;
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_SQUAD_SIZE";
    _value = str KPLIB_max_squad_size;
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_BLUFOR_DEFENDERS";
    _value = if (KPLIB_blufor_defenders) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_AUTODANGER";
    _value = if (KPLIB_autodanger) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DAYDURATION";
    _value = str (24 / KPLIB_time_factor);
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_SHORTER_NIGHTS_PARAM";
    _value = if (KPLIB_shorter_nights) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_WEATHER_PARAM";
    switch (KPLIB_weather_param) do {
        case 2: {_value = localize "STR_WEATHER_PARAM2";};
        case 3: {_value = localize "STR_WEATHER_PARAM3";};
        default {_value = localize "STR_WEATHER_PARAM1";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_FOG_PARAM";
    _value = if (KPLIB_fog_param) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_RESOURCESMULTIPLIER";
    _value = format ["x%1", KPLIB_resources_multiplier];
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_ARSENAL";
    _value = if (KPLIB_arsenal_type) then {localize "STR_PARAMS_ARSENAL_ACE";} else {localize "STR_PARAMS_ARSENAL_BI";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_PLAYERMENU";
    _value = if (KPLIB_playermenu) then {localize "STR_PARAMS_PLAYERMENU_KP";} else {localize "STR_PARAMS_PLAYERMENU_GREUH";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_VICTORYCONDITION";
    switch (KPLIB_victoryCondition) do {
        case 1: {_value = localize "STR_PARAMS_VICTORYCONDITION_1";};
        case 2: {_value = localize "STR_PARAMS_VICTORYCONDITION_2";};
        case 3: {_value = localize "STR_PARAMS_VICTORYCONDITION_3";};
        case 4: {_value = localize "STR_PARAMS_VICTORYCONDITION_4";};
        default {_value = localize "STR_PARAMS_VICTORYCONDITION_0";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_A3_ReviveMode";
    _value = if (bis_reviveParam_mode == 1) then {localize "STR_A3_EnabledForAllPlayers";} else {localize "STR_A3_Disabled";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    if (bis_reviveParam_mode == 1) then {
        _param = localize "STR_A3_ReviveDuration";
        _value = str bis_reviveParam_duration;
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_RequiredTrait";
        _value = if (bis_reviveParam_requiredTrait == 1) then {localize "STR_A3_Medic";} else {localize "STR_A3_None";};
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_RequiredTrait_MedicSpeedMultiplier";
        _value = format ["x%1", bis_reviveParam_medicSpeedMultiplier];
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_RequiredItems";
        switch (bis_reviveParam_requiredItems) do {
            case 1: {_value = localize "STR_A3_Medikit";};
            case 2: {_value = localize "STR_A3_FirstAidKitOrMedikit";};
            default {_value = localize "STR_A3_None";};
        };
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_IncapacitationMode";
        switch (bis_reviveParam_unconsciousStateMode) do {
            case 1: {_value = localize "STR_A3_Advanced";};
            case 2: {_value = localize "STR_A3_Realistic";};
            default {_value = localize "STR_A3_Basic";};
        };
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_BleedOutDuration";
        _value = str bis_reviveParam_bleedOutDuration;
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

        _param = localize "STR_A3_ForceRespawnDuration";
        _value = str bis_reviveParam_forceRespawnDuration;
        _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];
    };

    _param = localize "STR_PARAMS_FATIGUE";
    _value = if (KPLIB_fatigue) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_WEAPSWAY";
    _value = if (KPLIB_sway) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_ARSENALUSEPRESET";
    _value = if (KPLIB_arsenalUsePreset) then {localize "STR_PARAMS_USEPRESET";} else {localize "STR_PARAMS_NORESTRICTIONS";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MAPMARKERS";
    _value = if (KPLIB_mapmarkers) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MOBILERESPAWN";
    _value = if (KPLIB_mobilerespawn) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_RESPAWN_COOLDOWN";
    _value = if (KPLIB_respawn_cooldown == 0) then {localize "STR_PARAMS_DISABLED";} else {str (KPLIB_respawn_cooldown / 60);};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MOBILEARSENAL";
    _value = if (KPLIB_mobilearsenal) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_AILOGISTICS";
    _value = if (KPLIB_ailogistics) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_CR_BUILDING";
    _value = if (KPLIB_cr_param_buildings) then {localize "STR_PARAM_CR_DAMAGED";} else {localize "STR_PARAM_CR_DESTROYED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_HALO_PARAM";
    switch (KPLIB_halo_param) do {
        case 1: {_value = localize "STR_HALO_PARAM1";};
        case 5: {_value = localize "STR_HALO_PARAM2";};
        case 10: {_value = localize "STR_HALO_PARAM3";};
        case 15: {_value = localize "STR_HALO_PARAM4";};
        case 20: {_value = localize "STR_HALO_PARAM5";};
        case 30: {_value = localize "STR_HALO_PARAM6";};
        default {_value = localize "STR_PARAMS_DISABLED";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_CLEAR_CARGO";
    _value = if (KPLIB_clear_cargo) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ALLOW_ENEMIES_IN_IMMOBILE";
    _value = if (KPLIB_allowEnemiesInImmobile == 0) then {localize "STR_PARAMS_DISABLED";} else {KPLIB_allowEnemiesInImmobile;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_DELAY_DESPAWN_MAX";
    _value = if (KPLIB_delayDespawnMax == 0) then {localize "STR_PARAMS_DISABLED";} else {KPLIB_delayDespawnMax;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_LIMITEDZEUS";
    _value = if (KPLIB_limited_zeus) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ZEUSADDENEMIES";
    _value = if (KPLIB_enemies_zeus) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_HIGHCOMMAND";
    _value = if (KPLIB_high_command) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_SUPPMOD";
    switch (KPLIB_suppMod) do {
        case 1: {_value = localize "STR_PARAM_SUPPMOD_CMDRANDWHITELIST";};
        case 2: {_value = localize "STR_PARAM_SUPPMOD_EVERYONE";};
        default {_value = localize "STR_PARAMS_DISABLED";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_TUTORIAL";
    _value = if (KPLIB_tutorial) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PERMISSIONS_PARAM";
    _value = if (KPLIB_permissions_param) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_CLEANUP_PARAM";
    switch (KPLIB_cleanup_vehicles) do {
        case 1: {_value = localize "STR_CLEANUP_PARAM1";};
        case 2: {_value = localize "STR_CLEANUP_PARAM2";};
        case 4: {_value = localize "STR_CLEANUP_PARAM3";};
        default {_value = localize "STR_PARAMS_DISABLED";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_INTRO";
    _value = if (KPLIB_introduction) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DEPLOYMENTCAMERA";
    _value = if (KPLIB_deployment_cinematic) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_WHITELIST_PARAM";
    _value = if (KPLIB_use_whitelist) then {localize "STR_WHITELIST_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_RESTART_PARAM";
    _value = if (KPLIB_restart == 0) then {localize "STR_PARAMS_DISABLED";} else {KPLIB_restart;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    player createDiaryRecord ["parameters", ["Active", _text]];
};

// Adjustments calculation depending on selected mission parameters (shouldn't be edited)
KPLIB_production_interval           = ceil (KPLIB_production_interval / KPLIB_resources_multiplier);
KPLIB_battlegroup_size              = KPLIB_battlegroup_size * (sqrt KPLIB_unitcap) * (sqrt KPLIB_csat_aggressivity);
KPLIB_civilians_amount              = KPLIB_civilians_amount * KPLIB_civilian_activity;
KPLIB_blufor_cap                    = (KPLIB_blufor_cap * KPLIB_unitcap) min 100;
KPLIB_sector_cap                    = KPLIB_sector_cap * KPLIB_unitcap;
KPLIB_battlegroup_cap               = KPLIB_battlegroup_cap * KPLIB_unitcap;
KPLIB_patrol_cap                    = KPLIB_patrol_cap * KPLIB_unitcap;
