// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// CBA A3
// FA-18 Super Hornet
// RHS: Armed Forces of the Russian Federation
// RHS: United States Forces

// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "rhsusf_m113_usarmy_medical";			// Default "B_Truck_01_medical_F";
huron_typename = "RHS_CH_47F";					// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_NATO_AmmoVeh_F";				// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";				// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
crewman_classname = "B_crew_F";				// Default "B_crew_F";
pilot_classname = "B_Helipilot_F";					// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = "RHS_MELB_MH6M"; // Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base




// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = true;
infantry_units_extension = [
	["rhsusf_army_ucp_rifleman",2,0,0],
	["rhsusf_army_ucp_grenadier",3,0,0],
	["rhsusf_army_ucp_autorifleman",3,0,0],
	["rhsusf_army_ucp_medic",3,0,0],
	["rhsusf_army_ucp_marksman",3,0,0],
	["rhsusf_army_ucp_engineer",3,0,0],
	["rhsusf_army_ucp_javelin",4,0,0],
	["rhsusf_army_ucp_machinegunner",5,0,0],
	["rhsusf_usmc_recon_marpat_wd_rifleman",4,0,0],
	["rhsusf_usmc_recon_marpat_wd_sniper_M107",5,0,0],
	["rhsusf_army_ucp_aa",5,10,0],
	["rhsusf_army_ucp_crewman",1,0,0],
	["rhsusf_army_ucp_helipilot",1,0,0]
];

light_vehicles_overwrite = true;
light_vehicles_extension = [
	["B_Quadbike_01_F",0,0,2],
	["rhsusf_m1025_w",0,0,5],
	["rhsusf_m1025_w_m2",0,40,5],
	["rhsusf_m1025_w_mk19",0,60,5],
	["B_Truck_01_transport_F",0,0,8],
	["B_Truck_01_covered_F",0,0,8],
	["B_Truck_01_medical_F",5,0,8],
	["B_Boat_Transport_01_F",0,0,5],
	["B_Boat_Armed_01_minigun_F",0,80,15]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [
	["rhsusf_m113_usarmy",0,70,10],
	["rhsusf_m113_usarmy_MK19",0,90,10],
	["RHS_M6_wd",0,200,15],
	["RHS_M2A2_wd",0,220,15],
	["RHS_M2A3_BUSKIII_wd",0,240,15],
	["rhsusf_m1a2sep1wd_usarmy",0,400,20],
	["rhsusf_m1a2sep1tuskiiwd_usarmy",0,500,25],
	["rhsusf_m109_usarmy",0,2000,30]
];

air_vehicles_overwrite = true;
air_vehicles_extension = [
	["RHS_MELB_MH6M",0,0,10],
	["RHS_MELB_AH6M_L",0,160,10],
	["RHS_UH60M_MEV2",15,0,15],
	["RHS_UH60M",0,120,12],
	["RHS_AH1Z",0,1000,30],
	["RHS_AH64D_wd",0,1200,40],
	["RHS_A10",0,2000,50],
	["JS_JC_FA18E",0,3000,50],
	["JS_JC_FA18F",0,3200,50],
	["B_UAV_01_F",0,0,5],
	["B_UAV_02_F",0,500,20],
	["B_UAV_02_CAS_F",0,600,20]
];

static_vehicles_overwrite = true;
static_vehicles_extension = [
	["RHS_M2StaticMG_MiniTripod_WD",0,20,0],
	["RHS_M2StaticMG_WD",0,20,0],
	["RHS_MK19_TriPod_WD",0,40,0],
	["RHS_Stinger_AA_pod_WD",0,50,0],
	["RHS_TOW_TriPod_WD",0,60,0],
	["RHS_M252_WD",0,120,0],
	["RHS_M119_WD",0,220,0]
];

buildings_overwrite = true;
buildings_extension = [
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Flag_NATO_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],
	["Flag_White_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
	["CargoNet_01_box_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["Land_Metal_rack_Tall_F",0,0,0],
	["PortableHelipadLight_01_blue_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles_overwrite = true;		// If you're going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
	[Arsenal_typename,10,0,0],
	[Respawn_truck_typename,20,0,8],
	[FOB_box_typename,30,400,0],
	[FOB_truck_typename,30,400,5],
	["ACE_medicalSupplyCrate_advanced",5,0,0],
	["ACE_Box_82mm_Mo_HE",5,40,0],
	["ACE_Box_82mm_Mo_Smoke",5,10,0],
	["ACE_Box_82mm_Mo_Illum",5,10,0],
	["B_APC_Tracked_01_CRV_F",0,30,10],
	["rhsusf_M977A4_REPAIR_usarmy_wd",10,0,5],
	["rhsusf_M978A4_usarmy_wd",10,0,25],
	["rhsusf_M977A4_AMMO_usarmy_wd",10,100,5],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,20],
	["B_Slingload_01_Ammo_F",5,80,0],
	["Box_NATO_AmmoVeh_F",0,154,0],
	["Box_East_AmmoVeh_F",0,115,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"B_UAV_01_F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_teamleader",
	"rhsusf_army_ucp_grenadier",
	"rhsusf_army_ucp_autorifleman",
	"rhsusf_army_ucp_grenadier",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_rifleman",
	"rhsusf_army_ucp_rifleman"
];

// Heavy infantry squad
blufor_squad_inf = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_teamleader",
	"rhsusf_army_ucp_autorifleman",
	"rhsusf_army_ucp_machinegunner",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ucp_grenadier",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_rifleman",
	"rhsusf_army_ucp_marksman"
];

// AT specialists squad
blufor_squad_at = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ucp_rifleman"
];

// AA specialists squad
blufor_squad_aa = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ucp_rifleman"
];

// Force recon squad
blufor_squad_recon = [
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_autorifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_machinegunner_m249_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite",
	"rhsusf_usmc_recon_marpat_wd_marksman_lite",
	"rhsusf_usmc_recon_marpat_wd_marksman_lite",
	"rhsusf_usmc_recon_marpat_wd_rifleman_lite"
];

// Paratroopers squad
blufor_squad_para = [
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st",
	"rhsusf_army_ucp_rifleman_101st"
];







// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "rhs_msv_emr_rifleman";
opfor_rifleman = "rhs_msv_emr_rifleman";
opfor_grenadier = "rhs_msv_emr_grenadier";
opfor_squad_leader = "rhs_msv_emr_efreitor";
opfor_team_leader = "rhs_msv_emr_efreitor";
opfor_marksman = "rhs_msv_emr_marksman";
opfor_machinegunner = "rhs_msv_emr_machinegunner";
opfor_heavygunner = "rhs_msv_emr_arifleman";
opfor_medic = "rhs_msv_emr_medic";
opfor_rpg = "rhs_msv_emr_LAT";
opfor_at = "rhs_msv_emr_at";
opfor_aa = "rhs_msv_emr_aa";
opfor_officer = "rhs_msv_emr_officer";
opfor_sharpshooter = "rhs_msv_emr_marksman";
opfor_sniper = "rhs_msv_emr_marksman";
opfor_engineer = "rhs_msv_emr_engineer";
opfor_paratrooper = "rhs_vdv_recon_rifleman_scout";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "rhs_tigr_msv";
opfor_mrap_armed = "rhs_tigr_sts_msv";
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";
opfor_transport_truck = "RHS_Ural_Open_MSV_01";
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_msv";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "rhs_Flag_Russia_F";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = true;
militia_squad_extension = [
	"rhs_msv_emr_efreitor",
	"rhs_msv_emr_machinegunner",
	"rhs_msv_emr_aa",
	"rhs_msv_emr_at",
	"rhs_msv_emr_marksman",
	"rhs_msv_emr_engineer",
	"rhs_msv_emr_medic",
	"rhs_msv_emr_rifleman",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_grenadier"
];

// Militia vehicles to choose from
militia_vehicles_overwrite = true;
militia_vehicles_extension = [
	"rhs_tigr_sts_msv"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [
	"rhs_btr80_msv",
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"rhs_bmp2d_msv",
	"rhs_t90a_tv",
	"rhs_t90a_tv",
	"rhs_zsu234_aa",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"rhs_btr80_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"RHS_Ural_Open_MSV_01",
	"rhs_t90a_tv",
	"rhs_t90a_tv",
	"rhs_zsu234_aa",
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"RHS_Ural_Open_MSV_01",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = true;
opfor_troup_transports_extension = [
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"RHS_Ural_Open_MSV_01",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = true;
opfor_choppers_extension = [
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Opfor military aircrafts
opfor_air_overwrite = true;
opfor_air_extension = [
	"RHS_Su25SM_KH29_vvsc"
];







// Other stuff

// civilians
civilians_overwrite = false;
civilians_extension = [

];

// Civilian vehicles
civilian_vehicles_overwrite = false;
civilian_vehicles_extension = [

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [
	"rhsusf_M977A4_AMMO_usarmy_wd"
];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [
	"rhsusf_M977A4_REPAIR_usarmy_wd"
];
vehicle_rearm_sources_extension = [
	"rhsusf_M977A4_AMMO_usarmy_wd"
];
vehicle_refuel_sources_extension = [
	"rhsusf_M978A4_usarmy_wd"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
	"RHS_M2A3_BUSKIII_wd",
	"rhsusf_m1a2sep1wd_usarmy",
	"rhsusf_m1a2sep1tuskiiwd_usarmy",
	"rhsusf_m109_usarmy",
	"RHS_AH1Z",
	"RHS_AH64D_wd",
	"RHS_A10",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"RHS_M119_WD"
];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf

// Classnames of weapons which should not be available in the arsenal
blacklisted_from_arsenal_weapons = [

];

// Classnames of items (optics, uniforms, vests, etc.) which should not be available in the arsenal
blacklisted_from_arsenal_items = [
	"optic_Nightstalker",
	"optic_tws",
	"optic_tws_mg"
];

// Classnames of magazines or explosives which should not be available in the arsenal
blacklisted_from_arsenal_magazines = [

];

// Classnames of backpacks which should not be available in the arsenal
blacklisted_from_arsenal_extension = [

];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];