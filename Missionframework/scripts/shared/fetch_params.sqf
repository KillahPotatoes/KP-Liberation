#include "defines.hpp"

// Check if ACE is running
if (isClass (configfile >> "CfgPatches" >> "ace_common")) then {KP_liberation_ace = true; diag_log "[KP LIBERATION] ACE detected. Deactivating resupply and weather scripts from Liberation."} else {KP_liberation_ace = false};

/* Not saveable params */
GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
KP_liberation_civinfo_debug = ["DebugCivInfo",0] call bis_fnc_getParamValue;
KP_liberation_civrep_debug = ["DebugCivRep",0] call bis_fnc_getParamValue;
KP_liberation_savegame_debug = ["DebugSave",0] call bis_fnc_getParamValue;
KP_liberation_asymmetric_debug = ["DebugAsymmetric",0] call bis_fnc_getParamValue;
KP_liberation_logistic_debug = ["DebugLogistic",0] call bis_fnc_getParamValue;
KP_liberation_sectorspawn_debug = ["DebugSectorSpawn",0] call bis_fnc_getParamValue;
KP_liberation_kill_debug = ["DebugKill",0] call bis_fnc_getParamValue;
KP_liberation_production_debug = ["DebugProduction",0] call bis_fnc_getParamValue;

KP_load_params = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;

if(isServer) then {
	/* Saveable params */

	// Deactivate BI Revive when ACE Medical is running
	if (isClass (configfile >> "CfgPatches" >> "ace_medical")) then {
		bis_reviveParam_mode = 0; publicVariable "bis_reviveParam_mode";
		diag_log "[KP LIBERATION] ACE Medical detected. Deactivating BI Revive System."
	} else {
		GET_PARAM(bis_reviveParam_mode, "ReviveMode", 1);
	};

	GET_PARAM(bis_reviveParam_duration, "ReviveDuration", 6);
	GET_PARAM(bis_reviveParam_requiredTrait, "ReviveRequiredTrait", 1);
	GET_PARAM(bis_reviveParam_medicSpeedMultiplier, "ReviveMedicSpeedMultiplier", 1);
	GET_PARAM(bis_reviveParam_requiredItems, "ReviveRequiredItems", 1);
	GET_PARAM(bis_reviveParam_unconsciousStateMode, "UnconsciousStateMode", 0);
	GET_PARAM(bis_reviveParam_bleedOutDuration, "ReviveBleedOutDuration", 180);
	GET_PARAM(bis_reviveParam_forceRespawnDuration, "ReviveForceRespawnDuration", 10);

	GET_PARAM(GRLIB_difficulty_modifier, "Difficulty", 2);
	GET_PARAM(GRLIB_time_factor, "DayDuration", 12);
	GET_PARAM(GRLIB_resources_multiplier, "ResourcesMultiplier", 3);
	GET_PARAM(GRLIB_unitcap, "Unitcap", 2);
	GET_PARAM(GRLIB_civilian_activity, "civilians", 1);
	GET_PARAM(GRLIB_halo_param, "HaloJump", 1);
	GET_PARAM(GRLIB_cleanup_vehicles, "CleanupVehicles", 2);
	GET_PARAM(GRLIB_csat_aggressivity, "Aggressivity", 2);
	GET_PARAM(GRLIB_weather_param, "Weather", 3);
	GET_PARAM(GRLIB_maximum_fobs, "MaximumFobs", 26);
	GET_PARAM(GRLIB_max_squad_size, "MaxSquadSize", 10);
	GET_PARAM(KP_liberation_restart, "ServerRestart", 0);
	GET_PARAM(KP_liberation_respawn_cooldown, "RespawnCooldown", 900);
	
	GET_PARAM_BOOL(KP_liberation_cr_param_buildings, "CR_Building", 0);
	GET_PARAM_BOOL(KP_liberation_ailogistics, "AiLogistics", 1);
	GET_PARAM_BOOL(KP_liberation_clear_cargo, "ClearCargo", 1);
	GET_PARAM_BOOL(KP_liberation_arsenalUsePreset, "ArsenalUsePreset", 1);
	GET_PARAM_BOOL(KP_liberation_mapmarkers, "MapMarkers", 1);
	GET_PARAM_BOOL(KP_liberation_mobilerespawn, "MobileRespawn", 1);
	GET_PARAM_BOOL(KP_liberation_mobilearsenal, "MobileArsenal", 1);

	GET_PARAM_BOOL(GRLIB_adaptive_opfor, "AdaptToPlayercount", 1);
	GET_PARAM_BOOL(GRLIB_deployment_cinematic, "DeploymentCinematic", 1);
	GET_PARAM_BOOL(GRLIB_fatigue, "Fatigue", 1);
	GET_PARAM_BOOL(GRLIB_introduction, "Introduction", 1);
	GET_PARAM_BOOL(GRLIB_teamkill_penalty, "TeamkillPenalty", 0);
	GET_PARAM_BOOL(GRLIB_build_first_fob, "FirstFob", 0);
	GET_PARAM_BOOL(GRLIB_permissions_param, "Permissions", 1);
	GET_PARAM_BOOL(GRLIB_use_whitelist, "Whitelist", 0);
	GET_PARAM_BOOL(GRLIB_shorter_nights, "ShorterNights", 0);
	GET_PARAM_BOOL(GRLIB_blufor_defenders, "BluforDefenders", 1);
	GET_PARAM_BOOL(GRLIB_autodanger, "Autodanger", 0);

	GREUH_allow_mapmarkers = KP_liberation_mapmarkers; publicVariable "GREUH_allow_mapmarkers";
	GREUH_allow_platoonview = KP_liberation_mapmarkers; publicVariable "GREUH_allow_platoonview";

	GRLIB_remote_sensors = 0;
	publicVariable "GRLIB_remote_sensors";

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

	KP_serverParamsFetched = true;
	publicVariable "KP_serverParamsFetched";

	diag_log "[KP LIBERATION] [PARAM] Server finished parameters initialization.";

} else {
	waitUntil {sleep 0.5; !isNil "KP_serverParamsFetched"};
	waitUntil {sleep 0.5; KP_serverParamsFetched};

	private _text = format ["[KP LIBERATION] [PARAM] Client %1 received parameters from server.", name player]; _text remoteExec ["diag_log",2];
};
