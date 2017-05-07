// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// CBA A3
// FA-18 Super Hornet
// Project OPFOR
// RHS: Armed Forces of the Russian Federation
// RHS: United States Forces

// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V3_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "rhsusf_m113d_usarmy_medical";			// Default "B_Truck_01_medical_F";
huron_typename = "RHS_CH_47F_10";					// Default "B_Heli_Transport_03_unarmed_F";
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
	["rhsusf_army_ocp_rifleman",25,0,0],
	["rhsusf_army_ocp_grenadier",30,0,0],
	["rhsusf_army_ocp_autorifleman",30,0,0],
	["rhsusf_army_ocp_medic",30,0,0],
	["rhsusf_army_ocp_marksman",30,0,0],
	["rhsusf_army_ocp_engineer",30,0,0],
	["rhsusf_army_ocp_javelin",40,0,0],
	["rhsusf_army_ocp_machinegunner",50,0,0],
	["rhsusf_usmc_recon_marpat_d_rifleman",40,0,0],
	["rhsusf_usmc_recon_marpat_d_sniper_M107",50,0,0],
	["rhsusf_army_ocp_aa",50,10,0],
	["rhsusf_army_ocp_crewman",10,0,0],
	["rhsusf_army_ocp_helipilot",10,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",40,0,20],
	["rhsusf_m1025_d",100,0,50],
	["rhsusf_m1025_d_m2",100,40,50],
	["rhsusf_m1025_d_Mk19",100,60,50],
	["rhsusf_M977A4_BKIT_usarmy_d",125,0,75],							//M977A4 BKIT (Desert)
	["rhsusf_M977A4_BKIT_M2_usarmy_d",125,80,75],						//M977A4 BKIT (M2, Desert)	
	["B_Truck_01_medical_F",180,0,80]	
];

heavy_vehicles = [
	["rhsusf_m113d_usarmy",200,70,100],
	["rhsusf_m113d_usarmy_MK19",200,90,100],
	["RHS_M6",300,200,150],
	["RHS_M2A2",300,220,150],
	["RHS_M2A3_BUSKIII",300,240,150],
	["rhsusf_m1a2sep1d_usarmy",400,400,200],
	["rhsusf_m1a2sep1tuskiid_usarmy",500,500,250],
	["rhsusf_m109d_usarmy",600,2000,300]
];

air_vehicles = [
	["RHS_MELB_MH6M",200,0,100],
	["RHS_MELB_AH6M_L",200,160,100],
	["RHS_UH60M_MEV2",300,0,150],
	["RHS_UH60M",240,120,120],
	["RHS_AH1Z",600,1000,300],
	["RHS_AH64D",800,1200,400],
	["RHS_A10",1000,2000,500],
	["JS_JC_FA18E",1000,3000,500],
	["JS_JC_FA18F",1000,3200,500],
	["B_UAV_01_F",100,0,50],
	["B_UAV_02_F",400,500,200],
	["B_UAV_02_CAS_F",400,600,200]
];

static_vehicles = [
	["RHS_M2StaticMG_MiniTripod_D",20,20,0],
	["RHS_M2StaticMG_D",20,20,0],
	["RHS_MK19_TriPod_D",20,40,0],
	["RHS_Stinger_AA_pod_D",40,50,0],
	["RHS_TOW_TriPod_D",40,60,0],
	["RHS_M252_D",80,120,0],
	["RHS_M119_D",160,220,0]
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
	["Land_Cargo_House_V3_F",0,0,0],
	["Land_Cargo_Patrol_V2_F",0,0,0],
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
	["rhsusf_M977A4_REPAIR_usarmy_d",250,0,100],
	["rhsusf_M978A4_usarmy_d",200,0,250],
	["rhsusf_M977A4_AMMO_usarmy_d",200,250,100],
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
	"rhsusf_army_ocp_squadleader",
	"rhsusf_army_ocp_teamleader",
	"rhsusf_army_ocp_grenadier",
	"rhsusf_army_ocp_autorifleman",
	"rhsusf_army_ocp_grenadier",
	"rhsusf_army_ocp_medic",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_rifleman",
	"rhsusf_army_ocp_rifleman"
];

// Heavy infantry squad
blufor_squad_inf = [
	"rhsusf_army_ocp_squadleader",
	"rhsusf_army_ocp_teamleader",
	"rhsusf_army_ocp_autorifleman",
	"rhsusf_army_ocp_machinegunner",
	"rhsusf_army_ocp_medic",
	"rhsusf_army_ocp_grenadier",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_rifleman",
	"rhsusf_army_ocp_marksman"
];

// AT specialists squad
blufor_squad_at = [
	"rhsusf_army_ocp_squadleader",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_javelin",
	"rhsusf_army_ocp_medic",
	"rhsusf_army_ocp_rifleman"
];

// AA specialists squad
blufor_squad_aa = [
	"rhsusf_army_ocp_squadleader",
	"rhsusf_army_ocp_aa",
	"rhsusf_army_ocp_aa",
	"rhsusf_army_ocp_aa",
	"rhsusf_army_ocp_medic",
	"rhsusf_army_ocp_rifleman"
];

// Force recon squad
blufor_squad_recon = [
	"rhsusf_usmc_recon_marpat_d_teamleader_lite",
	"rhsusf_usmc_recon_marpat_d_rifleman_lite",
	"rhsusf_usmc_recon_marpat_d_rifleman_lite",
	"rhsusf_usmc_recon_marpat_d_autorifleman_lite",
	"rhsusf_usmc_recon_marpat_d_machinegunner_m249_lite",
	"rhsusf_usmc_recon_marpat_d_rifleman_lite",
	"rhsusf_usmc_recon_marpat_d_marksman_lite",
	"rhsusf_usmc_recon_marpat_d_marksman_lite",
	"rhsusf_usmc_recon_marpat_d_rifleman_lite"
];

// Paratroopers squad
blufor_squad_para = [
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st",
	"rhsusf_army_ocp_rifleman_101st"
];


// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "LOP_TKA_Infantry_Rifleman";
opfor_rifleman = "LOP_TKA_Infantry_Rifleman_2";
opfor_grenadier = "LOP_TKA_Infantry_GL";
opfor_squad_leader = "LOP_TKA_Infantry_SL";
opfor_team_leader = "LOP_TKA_Infantry_TL";
opfor_marksman = "LOP_TKA_Infantry_Marksman";
opfor_machinegunner = "LOP_TKA_Infantry_MG";
opfor_heavygunner = "LOP_TKA_Infantry_MG";
opfor_medic = "LOP_TKA_Infantry_Corpsman";
opfor_rpg = "LOP_TKA_Infantry_Rifleman_3";
opfor_at = "LOP_TKA_Infantry_AT";
opfor_aa = "LOP_TKA_Infantry_AA";
opfor_officer = "LOP_TKA_Infantry_Officer";
opfor_sharpshooter = "LOP_TKA_Infantry_Marksman";
opfor_sniper = "LOP_TKA_Infantry_Marksman";
opfor_engineer = "LOP_TKA_Infantry_Engineer";
opfor_paratrooper = "LOP_TKA_Infantry_Rifleman";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "LOP_TKA_UAZ";
opfor_mrap_armed = "LOP_TKA_UAZ_DshKM";
opfor_transport_helo = "LOP_TKA_Mi8MT_Cargo";
opfor_transport_truck = "LOP_TKA_Ural";
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_msv";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "FlagCarrierTakistan_EP1";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad = [
	"LOP_AM_OPF_Infantry_SL",
	"LOP_AM_OPF_Infantry_AR",
	"LOP_AM_OPF_Infantry_AR_Asst",
	"LOP_AM_OPF_Infantry_AT",
	"LOP_AM_OPF_Infantry_Marksman",
	"LOP_AM_OPF_Infantry_Engineer",
	"LOP_AM_OPF_Infantry_Corpsman",
	"LOP_AM_OPF_Infantry_Rifleman",
	"LOP_AM_OPF_Infantry_Rifleman_2",
	"LOP_AM_OPF_Infantry_Rifleman_3",
	"LOP_AM_OPF_Infantry_Rifleman_4",
	"LOP_AM_OPF_Infantry_Rifleman_5",
	"LOP_AM_OPF_Infantry_GL"
];

// Militia vehicles to choose from
militia_vehicles = [
	"LOP_AM_OPF_UAZ_DshKM",
	"LOP_AM_OPF_UAZ_DshKM",
	"LOP_AM_OPF_UAZ_AGS"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_T72BA",
	"LOP_TKA_T72BA",
	"LOP_TKA_ZSU234",
	"LOP_TKA_UAZ_AGS",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_SPG"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = [
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_AGS",
	"LOP_TKA_UAZ_SPG"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_AGS",
	"LOP_TKA_UAZ_SPG",
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_Ural",
	"LOP_TKA_T72BA",
	"LOP_TKA_T72BA",
	"LOP_TKA_ZSU234",
	"LOP_TKA_Mi24V_AT",
	"LOP_TKA_Mi8MT_Cargo",
	"LOP_TKA_Ural"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = [
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_DshKM",
	"LOP_TKA_UAZ_AGS",
	"LOP_TKA_UAZ_SPG",
	"LOP_TKA_Ural",
	"LOP_TKA_Mi8MT_Cargo",
	"LOP_TKA_Ural"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = [
	"LOP_TKA_BMP2",
	"LOP_TKA_BTR70",
	"LOP_TKA_Ural",
	"LOP_TKA_Mi8MT_Cargo"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = [
	"LOP_TKA_Mi8MT_Cargo",
	"LOP_TKA_Mi24V_AT"
];

// Opfor military aircrafts
opfor_air = [
	"RHS_Su25SM_vvsc"
];


// Other stuff

// civilians
civilians = [
	"LOP_Tak_Civ_Man_01",
	"LOP_Tak_Civ_Man_02",
	"LOP_Tak_Civ_Man_04"
];

// Civilian vehicles
civilian_vehicles = [
	"LOP_TAK_Civ_Landrover",
	"LOP_TAK_Civ_UAZ",
	"LOP_TAK_Civ_UAZ_Open",
	"LOP_TAK_Civ_Ural",
	"LOP_TAK_Civ_Ural_open"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
	"RHS_M2A3_BUSKIII",
	"rhsusf_m1a2sep1d_usarmy",
	"rhsusf_m1a2sep1tuskiid_usarmy",
	"rhsusf_m109d_usarmy",
	"RHS_AH1Z",
	"RHS_AH64D",
	"RHS_A10",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"RHS_M119_D"
];
