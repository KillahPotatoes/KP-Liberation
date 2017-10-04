if ( isMultiplayer ) then {
	GRLIB_difficulty_modifier = ["Difficulty",2] call bis_fnc_getParamValue;
	GRLIB_time_factor = ["DayDuration",12] call bis_fnc_getParamValue;
	GRLIB_resources_multiplier = ["ResourcesMultiplier",3] call bis_fnc_getParamValue;
	GRLIB_fatigue = ["Fatigue",1] call bis_fnc_getParamValue;
	GRLIB_introduction = ["Introduction",1] call bis_fnc_getParamValue;
	GRLIB_deployment_cinematic = ["DeploymentCinematic",1] call bis_fnc_getParamValue;
	GRLIB_unitcap = ["Unitcap",2] call bis_fnc_getParamValue;
	GRLIB_adaptive_opfor = ["AdaptToPlayercount",1] call bis_fnc_getParamValue;
	GRLIB_civilian_activity = ["civilians",1] call bis_fnc_getParamValue;
	GRLIB_teamkill_penalty = ["TeamkillPenalty",0] call bis_fnc_getParamValue;
	GRLIB_build_first_fob = ["FirstFob",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_1 = ["WipeSave1",0] call bis_fnc_getParamValue;
	GRLIB_param_wipe_savegame_2 = ["WipeSave2",0] call bis_fnc_getParamValue;
	GRLIB_permissions_param = ["Permissions",1] call bis_fnc_getParamValue;
	GRLIB_halo_param = ["HaloJump",1] call bis_fnc_getParamValue;
	GRLIB_use_whitelist = ["Whitelist",0] call bis_fnc_getParamValue;
	GRLIB_cleanup_vehicles = ["CleanupVehicles",2] call bis_fnc_getParamValue;
	GRLIB_csat_aggressivity = ["Aggressivity",2] call bis_fnc_getParamValue;
	GRLIB_weather_param = ["Weather",3] call bis_fnc_getParamValue;
	GRLIB_shorter_nights = ["ShorterNights",0] call bis_fnc_getParamValue;
	GRLIB_remote_sensors = 0;//[ "DisableRemoteSensors",0] call bis_fnc_getParamValue;
	GRLIB_blufor_defenders = [ "BluforDefenders",1] call bis_fnc_getParamValue;
	GRLIB_autodanger = [ "Autodanger",0] call bis_fnc_getParamValue;
	GRLIB_maximum_fobs = [ "MaximumFobs",26] call bis_fnc_getParamValue;
	GRLIB_max_squad_size = ["MaxSquadSize",10] call bis_fnc_getParamValue;
	KP_liberation_arsenalUsePreset = ["ArsenalUsePreset",1] call BIS_fnc_getParamValue;
	KP_liberation_mapmarkers = ["MapMarkers",1] call bis_fnc_getParamValue;
	KP_liberation_mobilerespawn = ["MobileRespawn",1] call bis_fnc_getParamValue;
	KP_liberation_mobilearsenal = ["MobileArsenal",1] call bis_fnc_getParamValue;
	KP_liberation_ailogistics = ["AiLogistics",1] call bis_fnc_getParamValue;
	KP_liberation_ace = ["AceEnable",0] call bis_fnc_getParamValue;
	KP_liberation_debug = ["DebugEnable",0] call bis_fnc_getParamValue;
} else {
	GRLIB_difficulty_modifier = 2;
	GRLIB_time_factor = 12;
	GRLIB_resources_multiplier = 3;
	GRLIB_fatigue = 1;
	GRLIB_introduction = 1;
	GRLIB_deployment_cinematic = 1;
	GRLIB_adaptive_opfor = 1;
	GRLIB_unitcap = 2;
	GRLIB_civilian_activity = 1;
	GRLIB_teamkill_penalty = 0;
	GRLIB_build_first_fob = 0;
	GRLIB_param_wipe_savegame_1 = 0;
	GRLIB_param_wipe_savegame_2 = 0;
	GRLIB_permissions_param = 0;
	GRLIB_halo_param = 1;
	GRLIB_use_whitelist = 0;
	GRLIB_cleanup_vehicles = 2;
	GRLIB_csat_aggressivity = 2;
	GRLIB_weather_param = 3;
	GRLIB_shorter_nights = 0;
	GRLIB_remote_sensors = 0;
	GRLIB_blufor_defenders = 1;
	GRLIB_autodanger = 0;
	GRLIB_maximum_fobs = 26;
	GRLIB_max_squad_size = 10;
	KP_liberation_arsenalUsePreset = 1;
	KP_liberation_mapmarkers = 1;
	KP_liberation_mobilerespawn = 1;
	KP_liberation_mobilearsenal = 1;
	KP_liberation_ailogistics = 1;
	KP_liberation_ace = 0;
	KP_liberation_debug = 0;
};

if ( GRLIB_fatigue < 0.1 ) then { GRLIB_fatigue = false } else { GRLIB_fatigue = true };
if ( GRLIB_introduction == 1 ) then { GRLIB_introduction = true } else { GRLIB_introduction = false };
if ( GRLIB_deployment_cinematic == 1 ) then { GRLIB_deployment_cinematic = true } else { GRLIB_deployment_cinematic = false };
if ( GRLIB_build_first_fob == 1 ) then { GRLIB_build_first_fob = true } else { GRLIB_build_first_fob = false };
if ( GRLIB_teamkill_penalty == 1 ) then { GRLIB_teamkill_penalty = true } else { GRLIB_teamkill_penalty = false };
if ( GRLIB_adaptive_opfor == 1 ) then { GRLIB_adaptive_opfor = true } else { GRLIB_adaptive_opfor = false };
if ( GRLIB_permissions_param == 1 ) then { GRLIB_permissions_param = true } else { GRLIB_permissions_param = false };
if ( GRLIB_use_whitelist == 1 ) then { GRLIB_use_whitelist = true } else { GRLIB_use_whitelist = false };
if ( GRLIB_shorter_nights == 1 ) then { GRLIB_shorter_nights = true } else { GRLIB_shorter_nights = false };
if ( GRLIB_blufor_defenders == 1 ) then { GRLIB_blufor_defenders = true } else { GRLIB_blufor_defenders = false };
if ( GRLIB_autodanger == 1 ) then { GRLIB_autodanger = true } else { GRLIB_autodanger = false };
if (KP_liberation_arsenalUsePreset == 1) then {KP_liberation_arsenalUsePreset = true} else {KP_liberation_arsenalUsePreset = false};
if (KP_liberation_mapmarkers == 1) then {KP_liberation_mapmarkers = true; GREUH_allow_mapmarkers = true; GREUH_allow_platoonview = true} else {KP_liberation_mapmarkers = false; GREUH_allow_mapmarkers = false; GREUH_allow_platoonview = false; show_platoon = false; show_teammates = false; show_nametags = false};
if (KP_liberation_mobilerespawn == 1) then {KP_liberation_mobilerespawn = true} else {KP_liberation_mobilerespawn = false};
if (KP_liberation_mobilearsenal == 1) then {KP_liberation_mobilearsenal = true} else {KP_liberation_mobilearsenal = false};
if (KP_liberation_ailogistics == 1) then {KP_liberation_ailogistics = true} else {KP_liberation_ailogistics = false};
if (KP_liberation_ace == 1) then {KP_liberation_ace = true} else {KP_liberation_ace = false};
if (KP_liberation_debug == 1) then {KP_liberation_debug = true} else {KP_liberation_debug = false};

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
