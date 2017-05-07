// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// BW Mod
// CBA A3
// FA-18 Super Hornet
// RHS: Armed Forces of the Russian Federation
// RHS: United States Forces

// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "rhsusf_m113_usarmy_medical";			// Default "B_Truck_01_medical_F";
huron_typename = "RHS_CH_47F";					// Default "B_Heli_Transport_03_unarmed_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config in kp_liberation_config) otherwise things will break
crewman_classname = "B_crew_F";				// Default "B_crew_F";
pilot_classname = "B_Helipilot_F";					// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = "RHS_MELB_MH6M"; // Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";	// Default "ContainmentArea_02_sand_F"
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";		// Default "ContainmentArea_01_sand_F"
KP_liberation_recycle_building = "Land_CarService_F";			// Default "Land_CarService_F"
KP_liberation_air_vehicle_building = "Land_Radar_Small_F";		// Default "Land_Radar_Small_F"
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";			// Default "Land_HelipadSquare_F"
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";		// Default "Land_TentHangar_V1_F"
KP_liberation_supply_crate = "CargoNet_01_box_F";				// Default "CargoNet_01_box_F"
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";					// Default "B_CargoNet_01_ammo_F"
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";					// Default "CargoNet_01_barrels_F"


// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

infantry_units = [
	["BWA3_Rifleman_Fleck",25,0,0],
	["BWA3_Grenadier_Fleck",30,0,0],
	["BWA3_Autorifleman_Fleck",30,0,0],
	["BWA3_CombatLifeSaver_Fleck",30,0,0],
	["BWA3_Marksman_Fleck",30,0,0],
	["BWA3_Engineer_Fleck",30,0,0],
	["BWA3_RiflemanAT_RGW90_Fleck",40,0,0],
	["BWA3_AutoriflemanMG5_Fleck",50,0,0],
	["BWA3_recon_Fleck",40,0,0],
	["BWA3_recon_Medic_Fleck",40,0,0],
	["BWA3_recon_Marksman_Fleck",50,0,0],
	["BWA3_RiflemanAA_Fliegerfaust_Fleck",50,10,0],
	["BWA3_RiflemanAT_Pzf3_Fleck",50,10,0],
	["BWA3_SniperG82_Fleck",100,0,0],
	["BWA3_Crew_Fleck",10,0,0],
	["BWA3_Helipilot",10,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",40,0,20],
	["BWA3_Eagle_Fleck",100,0,50],
	["rhsusf_m1025_w",100,0,50],
	["BWA3_Eagle_FLW100_Fleck",100,40,50],
	["rhsusf_m1025_w_m2",100,40,50],
	["rhsusf_m1025_w_mk19",100,60,50],
	["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],							//M977A4 BKIT (Woodland)
	["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,80,75],						//M977A4 BKIT (M2, Woodland)
	["B_Truck_01_medical_F",180,0,80],
	["B_Boat_Transport_01_F",100,0,50],
	["B_Boat_Armed_01_minigun_F",300,80,150]
];

heavy_vehicles = [
	["rhsusf_m113_usarmy",200,70,100],
	["rhsusf_m113_usarmy_MK19",200,90,100],
	["RHS_M6_wd",300,200,150],
	["RHS_M2A2_wd",300,220,150],
	["RHS_M2A3_BUSKIII_wd",300,240,150],
	["BWA3_Puma_Fleck",300,280,150],
	["rhsusf_m1a2sep1wd_usarmy",400,400,200],
	["rhsusf_m1a2sep1tuskiiwd_usarmy",500,500,250],
	["BWA3_Leopard2A6M_Fleck",500,550,250],
	["rhsusf_m109_usarmy",600,2000,300]
];

air_vehicles = [
	["RHS_MELB_MH6M",200,0,100],
	["RHS_MELB_AH6M_L",200,160,100],
	["RHS_UH60M_MEV2",300,0,150],
	["RHS_UH60M",240,120,120],
	["RHS_AH1Z",600,1000,300],
	["RHS_AH64D_wd",800,1200,400],
	["BWA3_Tiger_RMK_Universal",800,1500,400],
	["RHS_A10",1000,2000,500],
	["JS_JC_FA18E",1000,3000,500],
	["JS_JC_FA18F",1000,3200,500],
	["B_UAV_01_F",100,0,50],
	["B_UAV_02_F",400,500,200],
	["B_UAV_02_CAS_F",400,600,200]
];

static_vehicles = [
	["RHS_M2StaticMG_MiniTripod_WD",20,20,0],
	["RHS_M2StaticMG_WD",20,20,0],
	["RHS_MK19_TriPod_WD",20,40,0],
	["RHS_Stinger_AA_pod_WD",40,50,0],
	["RHS_TOW_TriPod_WD",40,60,0],
	["RHS_M252_WD",80,120,0],
	["RHS_M119_WD",160,220,0]
];

buildings = [
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
	["Land_Razorwire_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
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

support_vehicles = [
	[Arsenal_typename,100,0,0],
	[Respawn_truck_typename,200,0,80],
	[FOB_box_typename,200,400,0],
	[FOB_truck_typename,200,400,100],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,200,0,0],
	[KP_liberation_air_vehicle_building,1000,0,0],
	[KP_liberation_heli_slot_building,250,0,0],
	[KP_liberation_plane_slot_building,500,0,0],
	["ACE_medicalSupplyCrate_advanced",50,0,0],
	["ACE_Box_82mm_Mo_HE",50,40,0],
	["ACE_Box_82mm_Mo_Smoke",50,10,0],
	["ACE_Box_82mm_Mo_Illum",50,10,0],
	["B_APC_Tracked_01_CRV_F",200,30,100],
	["rhsusf_M977A4_REPAIR_usarmy_wd",250,0,100],
	["rhsusf_M978A4_usarmy_wd",200,0,250],
	["rhsusf_M977A4_AMMO_usarmy_wd",200,250,100],
	["B_Slingload_01_Repair_F",200,0,0],
	["B_Slingload_01_Fuel_F",150,0,250],
	["B_Slingload_01_Ammo_F",150,250,0]
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
	"BWA3_SL_Fleck",
	"BWA3_TL_Fleck",
	"BWA3_Grenadier_Fleck",
	"BWA3_Autorifleman_Fleck",
	"BWA3_Grenadier_Fleck",
	"BWA3_CombatLifeSaver_Fleck",
	"BWA3_RiflemanAT_RGW90_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck"
];

// Heavy infantry squad
blufor_squad_inf = [
	"BWA3_SL_Fleck",
	"BWA3_TL_Fleck",
	"BWA3_Autorifleman_Fleck",
	"BWA3_AutoriflemanMG5_Fleck",
	"BWA3_CombatLifeSaver_Fleck",
	"BWA3_Grenadier_Fleck",
	"BWA3_RiflemanAT_RGW90_Fleck",
	"BWA3_RiflemanAT_RGW90_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_SniperG82_Fleck"
];

// AT specialists squad
blufor_squad_at = [
	"BWA3_SL_Fleck",
	"BWA3_RiflemanAT_Pzf3_Fleck",
	"BWA3_RiflemanAT_Pzf3_Fleck",
	"BWA3_RiflemanAT_Pzf3_Fleck",
	"BWA3_CombatLifeSaver_Fleck",
	"BWA3_Rifleman_Fleck"
];

// AA specialists squad
blufor_squad_aa = [
	"BWA3_SL_Fleck",
	"BWA3_RiflemanAA_Fliegerfaust_Fleck",
	"BWA3_RiflemanAA_Fliegerfaust_Fleck",
	"BWA3_RiflemanAA_Fliegerfaust_Fleck",
	"BWA3_CombatLifeSaver_Fleck",
	"BWA3_Rifleman_Fleck"
];

// Force recon squad
blufor_squad_recon = [
	"BWA3_recon_TL_Fleck",
	"BWA3_recon_Fleck",
	"BWA3_recon_Pioneer_Fleck",
	"BWA3_recon_Medic_Fleck",
	"BWA3_recon_LAT_Fleck",
	"BWA3_recon_LAT_Fleck",
	"BWA3_recon_Marksman_Fleck",
	"BWA3_SniperG82_Fleck",
	"BWA3_recon_Fleck"
];

// Paratroopers squad
blufor_squad_para = [
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck",
	"BWA3_Rifleman_Fleck"
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
militia_squad = [
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
militia_vehicles = [
	"rhs_tigr_sts_msv"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [
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
opfor_vehicles_low_intensity = [
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"rhs_btr80_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [
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
opfor_battlegroup_vehicles_low_intensity = [
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
opfor_troup_transports = [
	"rhs_bmp2d_msv",
	"rhs_btr80_msv",
	"RHS_Ural_Open_MSV_01",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = [
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Opfor military aircrafts
opfor_air = [
	"RHS_Su25SM_KH29_vvsc"
];


// Other stuff

// civilians
civilians = [
	"C_man_1",
	"C_man_polo_6_F",
	"C_man_polo_3_F",
	"C_man_polo_2_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_1_F",
	"C_man_p_beggar_F",
	"C_man_1_2_F",
	"C_man_p_fugitive_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_shorts_2_F",
	"C_man_w_worker_F"
];

// Civilian vehicles
civilian_vehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",
	"C_Quadbike_01_F",
	"C_Offroad_02_unarmed_F",
	"C_Truck_02_covered_F"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
	"RHS_M2A3_BUSKIII_wd",
	"rhsusf_m1a2sep1wd_usarmy",
	"BWA3_Puma_Fleck",
	"rhsusf_m1a2sep1tuskiiwd_usarmy",
	"BWA3_Leopard2A6M_Fleck",
	"rhsusf_m109_usarmy",
	"RHS_AH1Z",
	"RHS_AH64D_wd",
	"BWA3_Tiger_RMK_Universal",
	"RHS_A10",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"RHS_M119_WD"
];
