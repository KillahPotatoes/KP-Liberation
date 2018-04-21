switch (KP_liberation_preset_blufor) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\apex.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\3cbBAF_mtp.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\3cbBAF_des.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\bwmod.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\bwmod_des.sqf";};
	case 6: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\rhs_usaf_wdl.sqf";};
	case 7: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\rhs_usaf_des.sqf";};
	case 8: {[] call compileFinal preprocessFileLineNumbers "presets\blufor\rhs_afrf.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\blufor\custom.sqf";};
};

switch (KP_liberation_preset_opfor) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\opfor\apex.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\opfor\rhs_afrf.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\opfor\takistan.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\opfor\islamic_state.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "presets\opfor\SLA.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\opfor\custom.sqf";};
};

switch (KP_liberation_preset_resistance) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\resistance\apex.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\resistance\rhs_gref.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\resistance\middle_eastern.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\resistance\RACS.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\resistance\custom.sqf";};
};

switch (KP_liberation_preset_civilians) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\civilians\apex.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\civilians\middle_eastern.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\civilians\RDSCiv.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\civilians\custom.sqf";};
};

// Prices for the blufor infantry squads (supplies, ammo, fuel)
squads = [
	[blufor_squad_inf_light,200,0,0],
	[blufor_squad_inf,300,0,0],
	[blufor_squad_at,200,250,0],
	[blufor_squad_aa,200,250,0],
	[blufor_squad_recon,250,0,0],
	[blufor_squad_para,200,0,0]
];

// Classnames of objects which should be ignored when building
GRLIB_ignore_colisions_when_building = [
	"Land_HelipadSquare_F",
	"Land_TentHangar_V1_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_yellow_F",
	"TMR_Autorest_Georef",
	"Flag_NATO_F",
	"Flag_White_F",
	"Flag_RedCrystal_F",
	"CamoNet_BLUFOR_F",
	"CamoNet_BLUFOR_open_F",
	"CamoNet_BLUFOR_big_F",
	"Land_PortableLight_single_F",
	"Land_PortableLight_double_F",
	"Land_HelipadCircle_F",
	"Land_HelipadRescue_F",
	"PortableHelipadLight_01_blue_F",
	"PortableHelipadLight_01_green_F",
	"PortableHelipadLight_01_red_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_Sign_WarningMilitaryArea_F",
	"Land_Sign_WarningMilAreaSmall_F",
	"Land_Sign_WarningMilitaryVehicles_F",
	"Land_Razorwire_F",
	"Sign_Sphere100cm_F",
	"Land_ClutterCutter_large_F",
	"Land_HighVoltageColumnWire_F",
	"Land_PowerWireBig_left_F",
	"B_HMG_01_F",										//Mk30A HMG .50
	"B_HMG_01_high_F",									//Mk30 HMG .50 (Raised)
	"B_HMG_01_A_F",										//Mk30 HMG .50 (Autonomous)
	"B_GMG_01_F",										//Mk32A GMG 20mm
	"B_GMG_01_high_F",									//Mk32 GMG 20mm (Raised)
	"B_GMG_01_A_F",										//Mk32 GMG 20mm (Autonomous)
	"B_static_AT_F",									//Static Titan Launcher (AT)
	"B_static_AA_F",									//Static Titan Launcher (AA)
	"B_Mortar_01_F",									//Mk6 Mortar
	"ACE_friesAnchorBar",								//ACE FRIES
	"ACE_friesGantryReverse",							//ACE FRIES
	"ACE_friesGantry"									//ACE FRIES
];



/* !!! DO NOT EDIT BELOW !!! */

infantry_units = [infantry_units] call F_filterMods;
light_vehicles = [light_vehicles] call F_filterMods;
heavy_vehicles = [heavy_vehicles] call F_filterMods;
air_vehicles = [air_vehicles] call F_filterMods;
support_vehicles = [support_vehicles] call F_filterMods;
static_vehicles = [static_vehicles] call F_filterMods;
buildings = [buildings] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
KP_liberation_storage_buildings = [KP_liberation_small_storage_building,KP_liberation_large_storage_building];
KP_liberation_crates = [KP_liberation_supply_crate,KP_liberation_ammo_crate,KP_liberation_fuel_crate];
KP_liberation_upgrade_buildings = [KP_liberation_recycle_building,KP_liberation_air_vehicle_building,KP_liberation_heli_slot_building,KP_liberation_plane_slot_building];
KP_liberation_air_slots = [KP_liberation_heli_slot_building,KP_liberation_plane_slot_building];
militia_squad = [militia_squad, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
militia_vehicles = [militia_vehicles, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_vehicles = [opfor_vehicles, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [opfor_vehicles_low_intensity, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [opfor_battlegroup_vehicles, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [opfor_battlegroup_vehicles_low_intensity, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_troup_transports = [opfor_troup_transports, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_choppers = [opfor_choppers, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_air = [opfor_air, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
civilians = [civilians, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
civilian_vehicles = [civilian_vehicles, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa];
friendly_infantry_classnames = [];
{if (!(_x in friendly_infantry_classnames)) then {friendly_infantry_classnames pushBack _x};} forEach (blufor_squad_inf_light + blufor_squad_inf + blufor_squad_at + blufor_squad_aa + blufor_squad_recon + blufor_squad_para);
{if (!((_x select 0) in friendly_infantry_classnames)) then {friendly_infantry_classnames pushBack (_x select 0)};} forEach infantry_units;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{land_vehicles_classnames pushback (_x select 0);} foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
KP_liberation_friendly_air_classnames = [];
{air_vehicles_classnames pushback (_x select 0); KP_liberation_friendly_air_classnames pushback (_x select 0);} foreach air_vehicles;
KP_liberation_friendly_air_classnames = KP_liberation_friendly_air_classnames select {!(_x call F_isClassUAV)};
KP_liberation_static_classnames = [];
{KP_liberation_static_classnames pushback (_x select 0);} forEach static_vehicles;
ai_resupply_sources = ai_resupply_sources + [Respawn_truck_typename, huron_typename, Arsenal_typename];
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD", localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD"];
ammobox_transports_typenames = [];
{ammobox_transports_typenames pushback (_x select 0)} foreach box_transport_config;
ammobox_transports_typenames = [ammobox_transports_typenames, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
elite_vehicles = [elite_vehicles, {[_x] call F_checkClass}] call BIS_fnc_conditionalSelect;
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";
