/*
	KP LIBERATION CONFIG FILE
	
	File: KPLIB_config.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Contains all settings which are meant to be adjustable by players but aren't implemented in the mission parameters (and won't be).
*/

/*------------------------------------------------------------
	--- PRESET SETTINGS ---
	Select here the provided premade presets you would like to use for each faction.
	If you want to edit or adjust a preset, it's recommended to set the specific presets to 0 and edit the appropriate custom.sqf file in the preset folder.
------------------------------------------------------------*/

/* BLUFOR preset:
0 = Custom (default vanilla NATO with many optional mods supported)
1 = Apex NATO (with the same optional mods supported)
2 = 3CB BAF
3 = BWMod (Bundeswehr)
4 = RHS USAF Woodland
5 = RHS USAF Desert */
KPLIB_preset_blufor = 0;

/* OPFOR preset:
0 = Custom (default vanilla CSAT)
1 = Apex CSAT
2 = RHS AFRF
3 = Project OPFOR (Takistani Armed Forces) */
KPLIB_preset_opfor = 0;

/* Resistance preset:
0 = Custom (default vanilla)
1 = Apex Tanoa
2 = RHS GREF */
KPLIB_preset_resistance = 0;

/* Civilians preset:
0 = Custom (default vanilla)
1 = Apex Tanoa
2 = Project OPFOR (Middle Eastern) */
KPLIB_preset_civilians = 0;

/* Which arsenal preset should be used?
0 = Use the default blacklist method (defined below).
1 = Custom arsenal preset (edit the custom.sqf in the arsenal_presets\ folder to change things for your own versions and tweaks).
2 = Killah Potatoes Gaming Community arsenal preset.
3 = RHS USAF arsenal preset.
4 = RHS USAF arsenal preset with ACE.
5 = RHS USAF arsenal preset with ACE and ACRE.	
6 = 3CB BAF and RHS USAF arsenal preset. */
KPLIB_preset_arsenal = 0;

/*------------------------------------------------------------
	--- BLACKLIST SETTINGS ---
	Array for the general blacklist and for items which are blocked and shouldn't be blocked (mostly generated classnames).
	Useless if you're using anything other than "KPLIB_preset_arsenal = 0;" above.
	A whitelisted arsenal is always more performance friendly then a blacklisted arsenal.
	REMEMBER: All static turret and UAV bags should be defined here, to stop players from exploiting free resources via the virtual arsenal.
------------------------------------------------------------*/

// Array of blacklisted item classnames.
KPLIB_arsenal_generalBlacklist = [
	"I_HMG_01_weapon_F",
	"B_HMG_01_weapon_F",
	"O_HMG_01_weapon_F",
	"I_HMG_01_A_weapon_F",
	"B_HMG_01_A_weapon_F",
	"O_HMG_01_A_weapon_F",
	"I_HMG_01_high_weapon_F",
	"B_HMG_01_high_weapon_F",
	"O_HMG_01_high_weapon_F",
	"I_GMG_01_weapon_F",
	"B_GMG_01_weapon_F",
	"O_GMG_01_weapon_F",
	"I_GMG_01_A_weapon_F",
	"B_GMG_01_A_weapon_F",
	"O_GMG_01_A_weapon_F",
	"I_GMG_01_high_weapon_F",
	"B_GMG_01_high_weapon_F",
	"O_GMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"O_Mortar_01_support_F",
	"I_Mortar_01_weapon_F",
	"B_Mortar_01_weapon_F",
	"O_Mortar_01_weapon_F",
	"I_HMG_01_support_F",
	"B_HMG_01_support_F",
	"O_HMG_01_support_F",
	"I_HMG_01_support_high_F",
	"B_HMG_01_support_high_F",
	"O_HMG_01_support_high_F",
	"I_AA_01_weapon_F",
	"B_AA_01_weapon_F",
	"O_AA_01_weapon_F",
	"I_AT_01_weapon_F",
	"B_AT_01_weapon_F",
	"O_AT_01_weapon_F",
	"I_UAV_01_backpack_F",
	"B_UAV_01_backpack_F",
	"O_UAV_01_backpack_F",
	"I_UAV_06_backpack_F",
	"B_UAV_06_backpack_F",
	"O_UAV_06_backpack_F",
	"I_UAV_06_medical_backpack_F",
	"B_UAV_06_medical_backpack_F",
	"O_UAV_06_medical_backpack_F",
	"C_UAV_06_backpack_F",
	"C_UAV_06_medical_backpack_F",
	"C_IDAP_UAV_01_backpack_F",
	"C_IDAP_UAV_06_backpack_F",
	"C_IDAP_UAV_06_medical_backpack_F",
	"C_IDAP_UAV_06_antimine_backpack_F",
	"B_Respawn_Sleeping_bag_blue_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Respawn_TentA_F",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"rhs_M252_Gun_Bag",
	"rhs_M252_Bipod_Bag",
	"RHS_M2_MiniTripod_Bag",
	"RHS_Mk19_Gun_Bag",
	"RHS_Mk19_Tripod_Bag",
	"rhs_Tow_Gun_Bag",
	"rhs_TOW_Tripod_Bag",
	"RHS_Podnos_Bipod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Metis_Gun_Bag",
	"RHS_Metis_Tripod_Bag",
	"RHS_Kornet_Gun_Bag",
	"RHS_Kornet_Tripod_Bag",
	"RHS_AGS30_Tripod_Bag",
	"RHS_AGS30_Gun_Bag",
	"RHS_DShkM_Gun_Bag",
	"RHS_DShkM_TripodHigh_Bag",
	"RHS_DShkM_TripodLow_Bag",
	"RHS_Kord_Tripod_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_NSV_Tripod_Bag",
	"RHS_NSV_Gun_Bag",
	"RHS_SPG9_Gun_Bag",
	"RHS_SPG9_Tripod_Bag",
	"UK3CB_BAF_L16",
	"UK3CB_BAF_L16_Tripod",
	"UK3CB_BAF_M6",
	"UK3CB_BAF_L111A1",
	"UK3CB_BAF_L134A1",
	"UK3CB_BAF_Tripod",
	"optic_Nightstalker",
	"optic_tws",
	"optic_tws_mg"
];

// Items which should be added as allowed Items. For items which get blacklisted, even if they are not in the KPLIB_arsenal_generalBlacklist array.
KPLIB_arsenal_addToWhitelist = [
	"ItemRadioAcreFlagged",
	"rhs_acc_ekp8_18b",
	"rhs_acc_ekp8_18c",
	"rhs_acc_ekp8_18d",
	"rhsusf_acc_g33_T1_flip",
	"rhsusf_acc_g33_xps3_flip",
	"rhsusf_acc_g33_xps3_tan_flip",
	"rhsusf_acc_anpeq15_bk_light_h",
	"rhs_m136_mag",
	"rhs_m136_hedp_mag",
	"rhs_m136_hp_mag",
	"rhs_weap_M136_used",
	"rhs_m72a7_mag",
	"BWA3_optic_ZO4x30_NSV",
	"BWA3_optic_ZO4x30_IRV",
	"BWA3_optic_ZO4x30_Single_NSV",
	"BWA3_optic_ZO4x30_Single_IRV",
	"BWA3_optic_EOTech_Mag_On",
	"BWA3_optic_EOTech_Mag_Off",
	"BWA3_optic_EOTech_tan_Mag_On",
	"BWA3_optic_EOTech_tan_Mag_Off",
	"BWA3_optic_20x50_NSV",
	"BWA3_optic_24x72_NSV",
	"BWA3_acc_VarioRay_flash",
	"BWA3_acc_VarioRay_laser",
	"BWA3_acc_LLM01_flash",
	"BWA3_acc_LLM01_laser",
	"BWA3_acc_LLM01_flash_underbarrel",
	"BWA3_acc_LLM01_laser_underberrel",
	"BWA3_acc_LLM01_laser_underbarrel",
	"UK3CB_BAF_AT4_CS_AP_Mag",
	"UK3CB_BAF_Javelin_Launcher",
	"sma_spitfire_03_rds_low_ard_red",
	"ACE_Chemlight_Shield_Orange",
	"ACE_Chemlight_Shield_White",
	"ACE_Chemlight_Shield_Blue",
	"ACE_Chemlight_Shield_Yellow",
	"ACE_Chemlight_Shield_Green",
	"ACE_Chemlight_Shield_Red",
	"ACE_ReserveParachute"
];

/*------------------------------------------------------------
	--- SAVE SETTINGS ---
	Settings concerning the internal save system.
------------------------------------------------------------*/

// Name of the save key inside of the [ServerProfileName].vars.Arma3Profile file.
KPLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME_REWRITE";
// Save interval in seconds.
KPLIB_save_interval = 60;

/*------------------------------------------------------------
	--- RANGES AND HEIGHTS ---
	All values in meters.
------------------------------------------------------------*/

// Build range around the main FOB building.
KPLIB_range_fob = 125;
// Range to activate a sector.
KPLIB_range_sector = 1000;
// Range to capture a sector.
KPLIB_range_capture = 175;
// Radio Tower scanning range.
KPLIB_range_radiotower = 2500;
// Altitude in metres for the HALO jump.
KPLIB_halo_altitude = 2500;

/*------------------------------------------------------------
	--- SECONDARY MISSION SETTINGS ---
	Settings which are connected to the available secondary missions which can be started by players via the secondary mission dialog.
------------------------------------------------------------*/

// Intel price for the secondary missions [FOB hunting, Convoy ambush, SAR].
KPLIB_secondary_costs = [15,10,8];
// The percentage impact against enemy combat readiness for a successful FOB hunt (1.0 = 100%).
KPLIB_secondary_impact = 0.6;

/*------------------------------------------------------------ 
	--- FUEL CONSUMPTION SETTINGS ---
	Values for the KP Fuel Consumption Script.
------------------------------------------------------------*/

//Time in minutes till a full tank depletes whilst the vehicle is standing still with a running engine.
KPLIB_fuel_neutral = 180;
// Time in minutes till a full tank depletes whilst the vehicle is driving below max speed.
KPLIB_fuel_normal = 90;
// Time in minutes till a full tank depletes whilst the vehicle is driving at max speed.
KPLIB_fuel_max = 45;

/*------------------------------------------------------------ 
	--- UNIT CAP SETTINGS ---
	Caps for different groups/mechanics.
	Values are total and not only for one sector or one battlegroup for example.
------------------------------------------------------------*/

// Unit cap for friendly side.
KPLIB_cap_blufor = 100;
// Unit cap for sector defenders.
KPLIB_cap_sector = 180;
// Unit cap for enemy battlegroup units.
KPLIB_cap_battlegroup = 150;
// Unit cap for enemy patrol units.
KPLIB_cap_patrol = 150;

/*------------------------------------------------------------ 
	--- CIVIL REPUTATION SETTINGS ---
	Values connected to the civil reputation system.
------------------------------------------------------------*/

// Civil Reputation penalty for killing a civilian.
KPLIB_civrep_killPenalty = 5;
// Civil Reputation penalty for destroying/damaging a building.
KPLIB_civrep_buildingPenalty = 3;
// Civil Reputation penalty for stealing a civilian vehicle.
KPLIB_civrep_vehiclePenalty = 2;
// Civil Reputation penalty for killing a friendly resistance soldier.
KPLIB_civrep_resistancePenalty = 3;
// Civil Reputation gain for liberating a sector.
KPLIB_civrep_sectorGain = 5;
// Chance (0-100) that there are wounded civilians right after capturing a sector.
KPLIB_civrep_woundedChance = 35;
// Civil Reputation gain for providing medical assistance for wounded civilians.
KPLIB_civrep_woundedGain = 2;

// Civil Informant minimum spawn time (seconds).
KPLIB_civinfo_min = 5400;
// Civil Informant maximum spawn time (seconds).
KPLIB_civinfo_max = 10800;
// Civil Informant spawn chance (0-100).
KPLIB_civinfo_chance = 75;
// Civil Informant intel gain amount.
KPLIB_civinfo_intel = 5;
// Civil Informant staytime until despawning (seconds).
KPLIB_civinfo_duration = 1200;
// Chance (0-100) that the delivered informant will spawn a time critical task.
KPLIB_civinfo_taskChance = 40;
// Duration until the task will despawn if no player is near (seconds).
KPLIB_civinfo_taskDuration = 900;

// Building classnames which should be ignored for the destroyed/damaged buildings check for the civil reputation.
KPLIB_civrep_ignoredBuildings = [
	"Land_LampStreet_small_F",
	"Land_PowerPoleWooden_L_F",
	"Land_LampShabby_F",
	"Land_SlideCastle_F",
	"Land_Carousel_01_F",
	"Land_LampDecor_F",
	"Land_LampStreet_F",
	"Land_LampHalogen_F",
	"Land_LampSolar_F",
	"Land_LampHarbour_F",
	"Land_HighVoltageColumnWire_F",
	"Land_HighVoltageColumn_F",
	"Land_fs_feed_F",
	"Land_PowerWireBig_left_F",
	"Land_runway_edgelight_blue_F",
	"Land_LampAirport_off_F",
	"Land_Flush_Light_green_F",
	"Land_LampAirport_F",
	"Land_PierLadder_F"
];

/*------------------------------------------------------------ 
	--- ASYMMETRIC WARFARE SETTINGS ---
	Values connected to the asymmetric warfare / resistance system.
------------------------------------------------------------*/

// At which strength (0-100) the resistance forces will be at tier 2.
KPLIB_resistance_tier2 = 30;
// At which strength (0-100) the resistance forces will be at tier 3.
KPLIB_resistance_tier3 = 70;
// Chance that a resistance unit has a RPG (tier 2 and 3).
KPLIB_resistance_atChance = 20;
// Chance that a logistic convoy will be ambushed, when civil reputation is low.
KPLIB_resistance_convoyAmbushChance = 2;
// Duration of the convoy ambush event (seconds).
KPLIB_resistance_convoyAmbushDuration = 1200;
// Chance that a resistance squad will join an ongoing sector attack.
KPLIB_resistance_sectorChance = 35;
// Chance that some resistance units will spawn in Blufor sectors for an ambush, if reputation is low.
KPLIB_resistance_ambushChance = 30;

/*------------------------------------------------------------ 
	--- ACE RELATED SETTINGS ---
	Special settings which are only affect the game if you run ACE.
------------------------------------------------------------*/

// Vehicle classnames which also function as ACE medical vehicles.
KPLIB_ace_medVehicles = [
	"B_Truck_01_medical_F",
	"B_T_Truck_01_medical_F",
	"rhsusf_m113_usarmy_medical",
	"rhsusf_m113d_usarmy_medical",
	"RHS_UH60M_MEV2",
	"RHS_UH60M_MEV2_d",
	"rhsusf_M1230a1_usarmy_d",
	"rhsusf_M1230a1_usarmy_wd"
];

// Classnames of ACE3 crates (which have to be in the unit preset as well).
KPLIB_ace_crates = [
	"ACE_Box_82mm_Mo_HE",
	"ACE_Box_82mm_Mo_Smoke",
	"ACE_Box_82mm_Mo_Illum",
	"ACE_medicalSupplyCrate_advanced"
];

/*------------------------------------------------------------ 
	--- TRANSPORT AND STORAGE SETTINGS ---
	Transport vehicle and storage area offset configurations.
------------------------------------------------------------*/

// Configuration settings for crates transported by vehicles ["classname", distance behind vehicle to unload crate, attachTo positions for each box].
KPLIB_transport_config = [
	["C_Offroad_01_F", -6.5, [0,-1.7,0.4]],
	["I_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
	["O_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
	["C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
	["I_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
	["I_C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
	["O_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
	["C_Truck_02_transport_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
	["C_Truck_02_covered_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
	["RHS_Ural_Open_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["RHS_Ural_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["RHS_Ural_Open_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["RHS_Ural_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["LOP_TAK_Civ_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["LOP_TAK_Civ_Ural", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
	["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_T_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_T_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["rhsusf_M977A4_BKIT_usarmy_d", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
	["rhsusf_M977A4_BKIT_M2_usarmy_d", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
	["rhsusf_M977A4_BKIT_usarmy_wd", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
	["rhsusf_M977A4_BKIT_M2_usarmy_wd", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
	["I_Heli_Transport_02_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
	["BW_AW101_Trans_Heer_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
	["B_Heli_Transport_03_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
	["B_Heli_Transport_03_unarmed_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
	["B_T_VTOL_01_infantry_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
	["B_T_VTOL_01_vehicle_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
	["RHS_CH_47F_10", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
	["RHS_CH_47F_light", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
	["RHS_CH_47F", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
	["UK3CB_BAF_Merlin_HC3_18_DPMT", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
	["UK3CB_BAF_Merlin_HC3_32_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
	["UK3CB_BAF_Merlin_HC3_CSAR_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
	["O_Truck_03_transport_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["BW_LKW7T_Trans_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_Truck_03_covered_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_T_Truck_03_transport_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_T_Truck_03_covered_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["greuh_eh101_gr", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
	["CUP_B_Wolfhound_GMG_GB_W", -6.5, [0,-3.5,2.3]],
	["CUP_B_Wolfhound_HMG_GB_W", -6.5, [0,-3.5,2.3]],
	["CUP_B_Wolfhound_LMG_GB_W", -6.5, [0,-3.5,2.3]],
	["rhsusf_m998_w_2dr_halftop", -4.5, [0,-0.9,-0.2]],
	["rhsusf_m998_d_2dr_halftop", -4.5, [0,-0.9,-0.2]],
	["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_wd_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_wd_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_d_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_d_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
	["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]]
];

// Large storage area placement position offsets.
KPLIB_storage_largeOffsets = [
	[-5.59961,3.60938,0.6],
	[-3.99902,3.60938,0.6],
	[-2.39941,3.60938,0.6],
	[-0.799805,3.60938,0.6],
	[0.800781,3.60938,0.6],
	[2.40039,3.60938,0.6],
	[4.00098,3.60938,0.6],
	[5.60059,3.60938,0.6],
	[-5.59961,1.80859,0.6],
	[-3.99902,1.80859,0.6],
	[-2.39941,1.80859,0.6],
	[-0.799805,1.80859,0.6],
	[0.800781,1.80859,0.6],
	[2.40039,1.80859,0.6],
	[4.00098,1.80859,0.6],
	[5.60059,1.80859,0.6],
	[-5.59961,0.00976563,0.6],
	[-3.99902,0.00976563,0.6],
	[-2.39941,0.00976563,0.6],
	[-0.799805,0.00976563,0.6],
	[0.800781,0.00976563,0.6],
	[2.40039,0.00976563,0.6],
	[4.00098,0.00976563,0.6],
	[5.60059,0.00976563,0.6],
	[-5.59961,-1.79102,0.6],
	[-3.99902,-1.79102,0.6],
	[-2.39941,-1.79102,0.6],
	[-0.799805,-1.79102,0.6],
	[0.800781,-1.79102,0.6],
	[2.40039,-1.79102,0.6],
	[4.00098,-1.79102,0.6],
	[5.60059,-1.79102,0.6],
	[-5.59961,-3.58984,0.6],
	[-3.99902,-3.58984,0.6],
	[-2.39941,-3.58984,0.6],
	[-0.799805,-3.58984,0.6],
	[0.800781,-3.58984,0.6],
	[2.40039,-3.58984,0.6],
	[4.00098,-3.58984,0.6],
	[5.60059,-3.58984,0.6]
];

// Small storage area placement position offsets.
KPLIB_storage_smallOffsets = [
	[-2.34961,1.80078,0.6],
	[-0.75,1.80078,0.6],
	[0.850586,1.80078,0.6],
	[2.4502,1.80078,0.6],
	[-2.34961,0,0.6],
	[-0.75,0,0.6],
	[0.850586,0,0.6],
	[2.4502,0,0.6],
	[-2.34961,-1.79883,0.6],
	[-0.75,-1.79883,0.6],
	[0.850586,-1.79883,0.6],
	[2.4502,-1.79883,0.6]
];

/*------------------------------------------------------------ 
	--- RESUPPLY SETTINGS ---
	Arrays with classnames for the Liberation resupply script.
------------------------------------------------------------*/

// Everything the AI troops should be able to resupply from.
KPLIB_resupply_aiSource = [
	"B_Truck_01_ammo_F",
	"B_T_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_AMMO_usarmy_d",
	"rhsusf_M977A4_AMMO_usarmy_wd",
	"rhsusf_M977A4_AMMO_BKIT_usarmy_d",
	"rhsusf_M977A4_AMMO_BKIT_usarmy_wd",
	"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
	"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
	"BW_LKW15T_Ammo_F",
	"rhs_gaz66_ammo_msv"
];

// Vehicles which should be able to repair other vehicles.
KPLIB_resupply_repairSource = [
	"C_Offroad_01_repair_F",
	"B_Truck_01_Repair_F",
	"B_T_Truck_01_Repair_F",
	"B_Slingload_01_Repair_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_REPAIR_usarmy_d",
	"rhsusf_M977A4_REPAIR_usarmy_wd",
	"rhsusf_M977A4_REPAIR_BKIT_usarmy_d",
	"rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",
	"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d",
	"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",
	"BW_LKW15T_Repair_F"
];

// Vehicles which should be able to rearm other vehicles.
KPLIB_resupply_rearmSource = [
	"B_Truck_01_ammo_F",
	"B_T_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_AMMO_usarmy_d",
	"rhsusf_M977A4_AMMO_usarmy_wd",
	"rhsusf_M977A4_AMMO_BKIT_usarmy_d",
	"rhsusf_M977A4_AMMO_BKIT_usarmy_wd",
	"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
	"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
	"BW_LKW15T_Ammo_F"
];

// Vehicles which should be able to refuel other vehicles.
KPLIB_resupply_refuelSource = [
	"C_Van_01_fuel_F",
	"C_Truck_02_fuel_F",
	"B_Truck_01_fuel_F",
	"B_T_Truck_01_fuel_F",
	"B_Slingload_01_Fuel_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M978A4_usarmy_d",
	"rhsusf_M978A4_usarmy_wd",
	"rhsusf_M978A4_BKIT_usarmy_d",
	"rhsusf_M978A4_BKIT_usarmy_wd",
	"BW_LKW15T_Fuel_F"
];

/*------------------------------------------------------------ 
	--- MISC SETTINGS ---
	Single values, so they aren't grouped in a category.
------------------------------------------------------------*/

// Percentage of resources you get back from recycling.
KPLIB_recycle_percentage = 0.5;
// Time in minutes until a production process is finished, when resources multiplier is set to 1. Value is affected by resource multiplier afterwards.
KPLIB_prod_interval = 30;
// Multiplier for defenders in buildings.
KPLIB_defended_buildingpos_part = 0.4;
// Size of enemy battlegroups.
KPLIB_battlegroup_size = 6;
// Time in seconds how long a captured sector is vulnerable to enemy troops.
KPLIB_vulnerability_timer = 1200;
// Chance that enemy infantry will surrender after heavy losses are encountered.
KPLIB_surrender_chance = 80;
// Civilian count multiplier.
KPLIB_civilians_amount = 10;

// Classnames of objects which should be ignored when building.
KPLIB_build_ignored_classnames = [
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
	"ACE_friesAnchorBar",									//ACE FRIES
	"ACE_friesGantryReverse",								//ACE FRIES
	"ACE_friesGantry"									//ACE FRIES
];

// Classnames of boats, so they can be built on water.
KPLIB_build_boats = [
	"B_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"B_T_Boat_Transport_01_F",
	"B_T_Boat_Armed_01_minigun_F",
	"B_SDV_01_F",
	"O_Boat_Transport_01_F",
	"O_Boat_Armed_01_hmg_F",
	"O_T_Boat_Transport_01_F",
	"O_T_Boat_Armed_01_hmg_F",
	"rhsusf_mkvsoc"
];

/*------------------------------- 
	!!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Value adjustments
if (KPLIB_cap_blufor > 100) then {KPLIB_cap_blufor = 100};
KPLIB_prod_interval = ceil (KPLIB_prod_interval / KPLIB_param_resMulti);
KPLIB_battlegroup_size = KPLIB_battlegroup_size * (sqrt KPLIB_param_unitcap) * (sqrt KPLIB_param_aggressivity);
KPLIB_civilians_amount = KPLIB_civilians_amount	* KPLIB_param_civilians;
KPLIB_cap_blufor = KPLIB_cap_blufor * KPLIB_param_unitcap;
KPLIB_cap_sector = KPLIB_cap_sector * KPLIB_param_unitcap;
KPLIB_cap_battlegroup = KPLIB_cap_battlegroup * KPLIB_param_unitcap;
KPLIB_cap_patrol = KPLIB_cap_patrol * KPLIB_param_unitcap;
