#include "defines.hpp"

// Check if ACE is running
if (isClass (configfile >> "CfgPatches" >> "ace_common")) then {KP_liberation_ace = true; ["ACE detected. Deactivating resupply script from Liberation.", "MOD"] call KPLIB_fnc_log;} else {KP_liberation_ace = false};

/* Not saveable params */
GRLIB_param_wipe_savegame_1 = ["WipeSave1", 0] call bis_fnc_getParamValue;
GRLIB_param_wipe_savegame_2 = ["WipeSave2", 0] call bis_fnc_getParamValue;
KP_liberation_civinfo_debug = ["DebugCivInfo", 0] call bis_fnc_getParamValue;
KP_liberation_civrep_debug = ["DebugCivRep", 0] call bis_fnc_getParamValue;
KP_liberation_savegame_debug = ["DebugSave", 0] call bis_fnc_getParamValue;
KP_liberation_asymmetric_debug = ["DebugAsymmetric", 0] call bis_fnc_getParamValue;
KP_liberation_logistic_debug = ["DebugLogistic", 0] call bis_fnc_getParamValue;
KP_liberation_sectorspawn_debug = ["DebugSectorSpawn", 0] call bis_fnc_getParamValue;
KP_liberation_kill_debug = ["DebugKill", 0] call bis_fnc_getParamValue;
KP_liberation_production_debug = ["DebugProduction", 0] call bis_fnc_getParamValue;
KP_liberation_highcommand_debug = ["DebugHighCommand", 0] call bis_fnc_getParamValue;

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
    GET_PARAM(GRLIB_unitcap, "Unitcap", 2);
    GET_PARAM(GRLIB_difficulty_modifier, "Difficulty", 2);
    GET_PARAM(GRLIB_csat_aggressivity, "Aggressivity", 2);
    GET_PARAM_BOOL(GRLIB_adaptive_opfor, "AdaptToPlayercount", 1);
    GET_PARAM(GRLIB_civilian_activity, "Civilians", 1);
    GET_PARAM_BOOL(GRLIB_build_first_fob, "FirstFob", 0);
    GET_PARAM_BOOL(KP_liberation_fob_vehicle, "FirstFobVehicle", 0);
    GET_PARAM(GRLIB_maximum_fobs, "MaximumFobs", 26);
    GET_PARAM(GRLIB_max_squad_size, "MaxSquadSize", 10);
    GET_PARAM_BOOL(GRLIB_blufor_defenders, "BluforDefenders", 1);
    GET_PARAM_BOOL(GRLIB_autodanger, "Autodanger", 0);
    GET_PARAM(GRLIB_time_factor, "DayDuration", 12);
    GET_PARAM_BOOL(GRLIB_shorter_nights, "ShorterNights", 0);
    GET_PARAM(GRLIB_weather_param, "Weather", 3);
    GET_PARAM_BOOL(KP_liberation_fog_param, "VanillaFog", 1);
    GET_PARAM(GRLIB_resources_multiplier, "ResourcesMultiplier", 3);
    GET_PARAM_BOOL(KP_liberation_arsenal_type, "ArsenalType", 0);
    GET_PARAM_BOOL(KPLIB_directArsenal, "DirectArsenal", 0);
    GET_PARAM_BOOL(KP_liberation_playermenu, "PlayerMenu", 1);
    GET_PARAM(KP_liberation_victoryCondition, "VictoryCondition", 0);

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
    GET_PARAM_BOOL(GRLIB_fatigue, "Fatigue", 1);
    GET_PARAM_BOOL(KPLIB_sway, "WeaponSway", 1);
    GET_PARAM_BOOL(KP_liberation_arsenalUsePreset, "ArsenalUsePreset", 1);
    GET_PARAM_BOOL(KP_liberation_mapmarkers, "MapMarkers", 1);
    GET_PARAM_BOOL(KP_liberation_mobilerespawn, "MobileRespawn", 1);
    GET_PARAM(KP_liberation_respawn_cooldown, "RespawnCooldown", 900);
    GET_PARAM_BOOL(KP_liberation_mobilearsenal, "MobileArsenal", 1);
    GET_PARAM_BOOL(KPLIB_respawnOnAttackedSectors, "AttackedSectorRespawn", 0);
    GET_PARAM_BOOL(KP_liberation_ailogistics, "AiLogistics", 1);
    GET_PARAM_BOOL(KP_liberation_cr_param_buildings, "CR_Building", 0);
    GET_PARAM(GRLIB_halo_param, "HaloJump", 1);
    GET_PARAM_BOOL(KP_liberation_clear_cargo, "ClearCargo", 1);
    GET_PARAM(KP_liberation_allowEnemiesInImmobile, "AllowEnemiesInImmobile", 50);
    GET_PARAM(KP_liberation_delayDespawnMax, "DelayDespawnMax", 5);
    GET_PARAM_BOOL(KP_liberation_limited_zeus, "LimitedZeus", 1);
    GET_PARAM_BOOL(KP_liberation_commander_zeus, "CommanderZeus", 1);
    GET_PARAM_BOOL(KP_liberation_enemies_zeus, "ZeusAddEnemies", 1);
    GET_PARAM_BOOL(KP_liberation_high_command, "HighCommand", 1);
    GET_PARAM(KP_liberation_suppMod, "SuppMod", 1);
    GET_PARAM_BOOL(KP_liberation_tutorial, "Tutorial", 1);

    // Technical Options
    ["--- Technical Options ---", "PARAM"] call KPLIB_fnc_log;
    GET_PARAM_BOOL(GRLIB_permissions_param, "Permissions", 1);
    GET_PARAM(GRLIB_cleanup_vehicles, "CleanupVehicles", 2);
    GET_PARAM_BOOL(GRLIB_introduction, "Introduction", 1);
    GET_PARAM_BOOL(GRLIB_deployment_cinematic, "DeploymentCinematic", 1);
    GET_PARAM_BOOL(GRLIB_use_whitelist, "Whitelist", 0);
    GET_PARAM(KP_liberation_restart, "ServerRestart", 0);

    GREUH_allow_mapmarkers = KP_liberation_mapmarkers; publicVariable "GREUH_allow_mapmarkers";
    GREUH_allow_platoonview = KP_liberation_mapmarkers; publicVariable "GREUH_allow_platoonview";

    KP_serverParamsFetched = true;
    publicVariable "KP_serverParamsFetched";

    [format ["----- Server finished parameter initialization - Time needed: %1 seconds", diag_ticktime - _start], "PARAM"] call KPLIB_fnc_log;
};

// Fix for not working float values in mission params
switch (GRLIB_unitcap) do {
    case 0: {GRLIB_unitcap = 0.5;};
    case 1: {GRLIB_unitcap = 0.75;};
    case 2: {GRLIB_unitcap = 1;};
    case 3: {GRLIB_unitcap = 1.25;};
    case 4: {GRLIB_unitcap = 1.5;};
    case 5: {GRLIB_unitcap = 2;};
    default {GRLIB_unitcap = 1;};
};

switch (GRLIB_difficulty_modifier) do {
    case 0: {GRLIB_difficulty_modifier = 0.5;};
    case 1: {GRLIB_difficulty_modifier = 0.75;};
    case 2: {GRLIB_difficulty_modifier = 1;};
    case 3: {GRLIB_difficulty_modifier = 1.25;};
    case 4: {GRLIB_difficulty_modifier = 1.5;};
    case 5: {GRLIB_difficulty_modifier = 2;};
    case 6: {GRLIB_difficulty_modifier = 4;};
    case 7: {GRLIB_difficulty_modifier = 10;};
    default {GRLIB_difficulty_modifier = 1;};
};

switch (GRLIB_csat_aggressivity) do {
    case 0: {GRLIB_csat_aggressivity = 0.25;};
    case 1: {GRLIB_csat_aggressivity = 0.5;};
    case 2: {GRLIB_csat_aggressivity = 1;};
    case 3: {GRLIB_csat_aggressivity = 2;};
    case 4: {GRLIB_csat_aggressivity = 4;};
    default {GRLIB_csat_aggressivity = 1;};
};

switch (GRLIB_civilian_activity) do {
    case 0: {GRLIB_civilian_activity = 0;};
    case 1: {GRLIB_civilian_activity = 0.5;};
    case 2: {GRLIB_civilian_activity = 1;};
    case 3: {GRLIB_civilian_activity = 2;};
    default {GRLIB_csat_aggressivity = 1;};
};

switch (GRLIB_resources_multiplier) do {
    case 0: {GRLIB_resources_multiplier = 0.25;};
    case 1: {GRLIB_resources_multiplier = 0.5;};
    case 2: {GRLIB_resources_multiplier = 0.75;};
    case 3: {GRLIB_resources_multiplier = 1;};
    case 4: {GRLIB_resources_multiplier = 1.25;};
    case 5: {GRLIB_resources_multiplier = 1.5;};
    case 6: {GRLIB_resources_multiplier = 2;};
    case 7: {GRLIB_resources_multiplier = 3;};
    default {GRLIB_resources_multiplier = 1;};
};

switch (KP_liberation_victoryCondition) do {
    case 1: {
        KP_liberation_victoryCheck = {
            (count (blufor_sectors select {_x in sectors_bigtown})) == (count sectors_bigtown)
            &&
            {
                (count (blufor_sectors select {_x in sectors_military})) == (count sectors_military)
            }
        };
    };
    case 2: {
        KP_liberation_victoryCheck = {
            (count (blufor_sectors select {_x in sectors_bigtown})) == (count sectors_bigtown)
            &&
            {
                (count (blufor_sectors select {!(_x in sectors_bigtown)})) >= ((count (sectors_allSectors - sectors_bigtown)) * 0.6)
            }
        };
    };
    case 3: {
        KP_liberation_victoryCheck = {
            (count (blufor_sectors select {_x in sectors_bigtown})) == (count sectors_bigtown)
            &&
            {
                (count (blufor_sectors select {!(_x in sectors_bigtown)})) >= ((count (sectors_allSectors - sectors_bigtown)) * 0.8)
            }
        };
    };
    case 4: {
        KP_liberation_victoryCheck = {
            (count blufor_sectors) == (count sectors_allSectors)
        };
    };
    default {
        KP_liberation_victoryCheck = {
            (count (blufor_sectors select {_x in sectors_bigtown})) == (count sectors_bigtown)
        };
    };
};

if (!isDedicated && hasInterface) then {
    // Create diary section for an overview of actual mission parameters
    player createDiarySubject ["parameters", "Mission Parameters"];

    private _param = localize "STR_PARAMS_UNITCAP";
    private _value = (format ["%1", GRLIB_unitcap * 100]) + "%";
    private _text = format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DIFFICULTY";
    switch (GRLIB_difficulty_modifier) do {
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
    switch (GRLIB_csat_aggressivity) do {
        case 0.5: {_value = localize "STR_AGGRESSIVITY_PARAM1";};
        case 1: {_value = localize "STR_AGGRESSIVITY_PARAM2";};
        case 2: {_value = localize "STR_AGGRESSIVITY_PARAM3";};
        case 4: {_value = localize "STR_AGGRESSIVITY_PARAM4";};
        default {_value = localize "STR_AGGRESSIVITY_PARAM0";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ADAPT_TO_PLAYERCOUNT";
    _value = if (GRLIB_adaptive_opfor) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_CIVILIANS";
    switch (GRLIB_civilian_activity) do {
        case 0.5: {_value = localize "STR_PARAMS_CIVILIANS2";};
        case 1: {_value = localize "STR_PARAMS_CIVILIANS3";};
        case 2: {_value = localize "STR_PARAMS_CIVILIANS4";};
        default {_value = localize "STR_PARAMS_CIVILIANS1";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_FIRSTFOB";
    _value = if (GRLIB_build_first_fob) then {localize "STR_YES";} else {localize "STR_NO";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_FIRSTFOBVEHICLE";
    _value = if (KP_liberation_fob_vehicle) then {localize "STR_PARAMS_FIRSTFOBVEHICLE_TRUCK";} else {localize "STR_PARAMS_FIRSTFOBVEHICLE_CONTAINTER";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_FOBS_COUNT";
    _value = str GRLIB_maximum_fobs;
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_SQUAD_SIZE";
    _value = str GRLIB_max_squad_size;
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_BLUFOR_DEFENDERS";
    _value = if (GRLIB_blufor_defenders) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_AUTODANGER";
    _value = if (GRLIB_autodanger) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DAYDURATION";
    _value = str (24 / GRLIB_time_factor);
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_SHORTER_NIGHTS_PARAM";
    _value = if (GRLIB_shorter_nights) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_WEATHER_PARAM";
    switch (GRLIB_weather_param) do {
        case 2: {_value = localize "STR_WEATHER_PARAM2";};
        case 3: {_value = localize "STR_WEATHER_PARAM3";};
        default {_value = localize "STR_WEATHER_PARAM1";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_FOG_PARAM";
    _value = if (KP_liberation_fog_param) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_RESOURCESMULTIPLIER";
    _value = format ["x%1", GRLIB_resources_multiplier];
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_ARSENAL";
    _value = if (KP_liberation_arsenal_type) then {localize "STR_PARAMS_ARSENAL_ACE";} else {localize "STR_PARAMS_ARSENAL_BI";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DIRECTARSENAL";
    _value = if (KPLIB_directArsenal) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_PLAYERMENU";
    _value = if (KP_liberation_playermenu) then {localize "STR_PARAMS_PLAYERMENU_KP";} else {localize "STR_PARAMS_PLAYERMENU_GREUH";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_VICTORYCONDITION";
    switch (KP_liberation_victoryCondition) do {
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
    _value = if (GRLIB_fatigue) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_WEAPSWAY";
    _value = if (KPLIB_sway) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_ARSENALUSEPRESET";
    _value = if (KP_liberation_arsenalUsePreset) then {localize "STR_PARAMS_USEPRESET";} else {localize "STR_PARAMS_NORESTRICTIONS";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MAPMARKERS";
    _value = if (KP_liberation_mapmarkers) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MOBILERESPAWN";
    _value = if (KP_liberation_mobilerespawn) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_RESPAWN_COOLDOWN";
    _value = if (KP_liberation_respawn_cooldown == 0) then {localize "STR_PARAMS_DISABLED";} else {str (KP_liberation_respawn_cooldown / 60);};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_MOBILEARSENAL";
    _value = if (KP_liberation_mobilearsenal) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_ATTACKEDSECTORRESPAWN";
    _value = if (KPLIB_respawnOnAttackedSectors) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_AILOGISTICS";
    _value = if (KP_liberation_ailogistics) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_CR_BUILDING";
    _value = if (KP_liberation_cr_param_buildings) then {localize "STR_PARAM_CR_DAMAGED";} else {localize "STR_PARAM_CR_DESTROYED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_HALO_PARAM";
    switch (GRLIB_halo_param) do {
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
    _value = if (KP_liberation_clear_cargo) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ALLOW_ENEMIES_IN_IMMOBILE";
    _value = if (KP_liberation_allowEnemiesInImmobile == 0) then {localize "STR_PARAMS_DISABLED";} else {KP_liberation_allowEnemiesInImmobile;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_DELAY_DESPAWN_MAX";
    _value = if (KP_liberation_delayDespawnMax == 0) then {localize "STR_PARAMS_DISABLED";} else {KP_liberation_delayDespawnMax;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_COMMANDERZEUS";
    _value = if (KP_liberation_commander_zeus) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_LIMITEDZEUS";
    _value = if (KP_liberation_limited_zeus) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_ZEUSADDENEMIES";
    _value = if (KP_liberation_enemies_zeus) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_HIGHCOMMAND";
    _value = if (KP_liberation_high_command) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_SUPPMOD";
    switch (KP_liberation_suppMod) do {
        case 1: {_value = localize "STR_PARAM_SUPPMOD_CMDRANDWHITELIST";};
        case 2: {_value = localize "STR_PARAM_SUPPMOD_EVERYONE";};
        default {_value = localize "STR_PARAMS_DISABLED";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAM_TUTORIAL";
    _value = if (KP_liberation_tutorial) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PERMISSIONS_PARAM";
    _value = if (GRLIB_permissions_param) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_CLEANUP_PARAM";
    switch (GRLIB_cleanup_vehicles) do {
        case 1: {_value = localize "STR_CLEANUP_PARAM1";};
        case 2: {_value = localize "STR_CLEANUP_PARAM2";};
        case 4: {_value = localize "STR_CLEANUP_PARAM3";};
        default {_value = localize "STR_PARAMS_DISABLED";};
    };
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_INTRO";
    _value = if (GRLIB_introduction) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_PARAMS_DEPLOYMENTCAMERA";
    _value = if (GRLIB_deployment_cinematic) then {localize "STR_PARAMS_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_WHITELIST_PARAM";
    _value = if (GRLIB_use_whitelist) then {localize "STR_WHITELIST_ENABLED";} else {localize "STR_PARAMS_DISABLED";};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    _param = localize "STR_RESTART_PARAM";
    _value = if (KP_liberation_restart == 0) then {localize "STR_PARAMS_DISABLED";} else {KP_liberation_restart;};
    _text = _text + format ["<font color='#ff8000'>%1</font><br />%2<br /><br />", _param, _value];

    player createDiaryRecord ["parameters", ["Active", _text]];
};
