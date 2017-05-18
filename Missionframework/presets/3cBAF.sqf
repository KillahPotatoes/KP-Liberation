// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// CBA A3
// FA-18 Super Hornet
// RHS: Armed Forces of the Russian Federation
// RHS: United States Forces
// 3cb BAF Addons
// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "UK3CB_BAF_LandRover_Amb_FFR_Green_A_DPMW";			// Default "B_Truck_01_medical_F";
huron_typename = "UK3CB_BAF_Merlin_HC3_18_DPMT";					// Default "B_Heli_Transport_03_unarmed_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config in kp_liberation_config) otherwise things will break
crewman_classname = "UK3CB_BAF_Crewman_DPMW";				// Default "B_crew_F";
pilot_classname = "UK3CB_BAF_HeliPilot_RAF_DPMW";					// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = "UK3CB_BAF_Wildcat_HMA2_TRN_8A_MTP"; // Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";	// Default "ContainmentArea_02_sand_F"
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";		// Default "ContainmentArea_01_sand_F"
KP_liberation_recycle_building = "Land_Bulldozer_01_wreck_F";			// Default "Land_CarService_F"
KP_liberation_air_vehicle_building = "rhs_prv13";		// Default "Land_Radar_Small_F"
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
	["UK3CB_BAF_Pointman_MTP_H",15,0,0],
	["UK3CB_BAF_Officer_MTP_H",20,0,0],
	["UK3CB_BAF_Rifleman_762_MTP_H",15,0,0],
	["UK3CB_BAF_LAT_ILAW_762_MTP_H",30,0,0],
	["UK3CB_BAF_Grenadier_762_MTP_H",25,0,0],
	["UK3CB_BAF_LSW_MTP_H",25,0,0],
	["UK3CB_BAF_MGLMG_MTP_H",35,0,0],
	["UK3CB_BAF_Medic_MTP_H",30,0,0],
	["UK3CB_BAF_Marksman_MTP_H",40,0,0],
	["UK3CB_BAF_Sharpshooter_MTP_H",40,0,0],
	["UK3CB_BAF_Engineer_MTP_H",30,0,0],
	["UK3CB_BAF_Repair_MTP_H",30,0,0],
	["UK3CB_BAF_Explosive_MTP_H",30,0,0],
	["UK3CB_BAF_UAV_MTP_RM",50,0,0],
	["UK3CB_BAF_FAC_MTP_H",30,0,0],
	["UK3CB_BAF_MFC_MTP_H",30,0,0],
	["UK3CB_BAF_MAT_MTP_H",50,10,0],
	["UK3CB_BAF_LAT_762_MTP_H",40,0,0],
	["UK3CB_BAF_MGGPMG_MTP_H",35,0,0],
	["UK3CB_BAF_GunnerM6_MTP_H",50,10,0],
	["UK3CB_BAF_MFC_MTP_H",20,0,0],
	["UK3CB_BAF_Crewman_MTP",10,0,0],
	["UK3CB_BAF_HeliCrew_DPMW",10,0,0],
	["UK3CB_BAF_HeliPilot_RAF_MTP",10,0,0],
	["UK3CB_BAF_Medic_MTP_REC_H",30,0,0],
	["UK3CB_BAF_Explosive_MTP_REC_H",30,0,0],
	["UK3CB_BAF_FAC_MTP_REC_H",30,0,0],
	["UK3CB_BAF_Marksman_MTP_REC_H",40,0,0],
	["UK3CB_BAF_MGLMG_MTP_REC_H",35,0,0],
	["UK3CB_BAF_Pointman_MTP_REC_H",15,0,0],
	["UK3CB_BAF_SC_MTP_REC_H",20,0,0],
	["UK3CB_BAF_Sniper_MTP_Ghillie_L115",35,0,0],
	["UK3CB_BAF_Sniper_MTP_Ghillie_L135",50,0,0],
	["UK3CB_BAF_Spotter_MTP_Ghillie_L129",30,0,0],
	["UK3CB_BAF_Spotter_MTP_Ghillie_L85",30,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",50,0,25],
	["rhsusf_mrzr4_d",60,0,30],
	["B_LSV_01_unarmed_F",75,0,50],
	["B_T_LSV_01_armed_F",75,40,50],
	["UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_Soft_FFR_Green_B_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW",100,140,50],
	["UK3CB_BAF_Coyote_Passenger_L134A1_W_DPMW",100,100,80],
	["UK3CB_BAF_Coyote_Passenger_L111A1_W_DPMW",100,100,80],
	["UK3CB_BAF_Jackal2_GMG_W_DPMW",100,100,60],
	["UK3CB_BAF_Jackal2_L2A1_W_DPMW",100,80,60],
	["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B_DPMW",100,100,50],
	["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW",100,100,50],
	["rhsusf_M1237_M2_usarmy_d",100,40,100],   //confirmed British Forces use these https://en.wikipedia.org/wiki/List_of_equipment_of_the_British_Army
	["rhsusf_M1237_MK19_usarmy_d",100,60,100],
	["rhsusf_M1083A1P2_d_fmtv_usarmy",125,0,75],
	["rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy",125,40,75],
	["rhsusf_M1083A1P2_B_d_open_fmtv_usarmy",125,0,75],
	["rhsusf_M977A4_BKIT_M2_usarmy_d",125,40,75],
	["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy",125,40,75],
	["B_UGV_01_F",150,0,50],											//UGV Stomper
	["B_UGV_01_rcws_F",150,40,50],
	["B_Boat_Transport_01_F",100,0,25],
	["B_Boat_Armed_01_minigun_F",200,80,75],
	["rhsusf_mkvsoc",250,200,100],
	["B_SDV_01_F",200,0,100]
];

heavy_vehicles = [

];

air_vehicles = [
	["UK3CB_BAF_Wildcat_AH1_TRN_8A_MTP",300,0,150],
	["UK3CB_BAF_Wildcat_AH1_CAS_8A_MTP",300,100,150],
	["UK3CB_BAF_Wildcat_AH1_CAS_8B_MTP",300,100,150],
	["UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",300,100,150],
	["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP",300,100,150],
	["UK3CB_BAF_Wildcat_AH1_HEL_8A_MTP",300,100,150],
	["UK3CB_BAF_Merlin_HC3_32_MTP",325,0,175],
	["UK3CB_BAF_Merlin_HC3_18_GPMG_MTP",325,120,175],
	["UK3CB_BAF_Merlin_HC3_CSAR_MTP",325,130,175],
	["UK3CB_BAF_Apache_AH1_CAS_MTP",750,750,250],
	["UK3CB_BAF_Apache_AH1_JS_MTP",750,750,250],
	["UK3CB_BAF_Apache_AH1_MTP",750,750,250],
	["UK3CB_BAF_Apache_AH1_AT_MTP",750,750,250],
	["RHS_A10",1000,1000,400],											//A-10A (CAS)
	["FIR_F15C",1250,1250,450],											//F-15C Eagle
	["FIR_F15D",1250,1250,450],											//F-15D Eagle
	["FIR_F15E",1250,1500,450],											//F-15E Strike Eagle
	["JS_JC_FA18E",1500,1750,450],										//F/A-18 E Super Hornet
	["JS_JC_FA18F",1500,1750,450],
	["B_Plane_Fighter_01_F",1500,1750,450],								//F/A-181 Black Wasp II
	["B_Plane_Fighter_01_Stealth_F",1500,1750,450],						//F/A-181 Black Wasp II (stealth)
	["B_UAV_01_F",75,0,25],
	["B_UAV_02_F",400,300,200],
	["B_UAV_02_CAS_F",400,500,200],
	["B_UAV_05_F",400,500,200]		//New Stealth Drone
];

static_vehicles = [
	["UK3CB_BAF_Static_L111A1_Deployed_High_DPMW",25,40,0],		//HMG
	["UK3CB_BAF_Static_L111A1_Deployed_Mid_DPMW",25,40,0],		//HMG
	["UK3CB_BAF_Static_L111A1_Deployed_Low_DPMW",25,40,0],		//HMG
	["UK3CB_BAF_Static_L134A1_Deployed_High_DPMW",20,40,0],		//GMG
	["UK3CB_BAF_Static_L134A1_Deployed_Mid_DPMW",20,40,0],		//GMG
	["UK3CB_BAF_Static_L134A1_Deployed_Low_DPMW",20,40,0],		//GMG
	["UK3CB_BAF_Static_L7A2_Deployed_High_DPMW",25,30,0],		//LMG
	["UK3CB_BAF_Static_L7A2_Deployed_Mid_DPMW",25,30,0],		//LMG
	["UK3CB_BAF_Static_L7A2_Deployed_Low_DPMW",25,30,0],		//LMG
	["RHS_Stinger_AA_pod_WD",40,50,0],
	["RHS_TOW_TriPod_WD",40,60,0],
	["UK3CB_BAF_Static_M6_Deployed_DPMW",80,120,0],
	["UK3CB_BAF_Static_L16_Deployed_DPMW",80,140,0],
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
	["Flag_UK_F",0,0,0],
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
	["Land_ClutterCutter_large_F",0,0,0],
	["StorageBladder_01_fuel_sand_F",200,0,250]				//refueling item
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
	["UK3CB_BAF_Box_WpsStatic",300,300,0],
	["UK3CB_BAF_Box_L16_Ammo",0,0,0],
	["UK3CB_BAF_Box_M6_Ammo",0,0,0],
	["B_APC_Tracked_01_CRV_F",200,30,100],
	["UK3CB_BAF_Coyote_Logistics_L134A1_W_DPMW",250,0,200],			//logistics vehicle
	["UK3CB_BAF_Coyote_Logistics_L111A1_W_DPMW",200,0,250],			//logistics vehicle
	["B_Slingload_01_Repair_F",200,0,0],
	["B_Slingload_01_Fuel_F",150,0,250],
	["B_Slingload_01_Ammo_F",150,250,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"B_UAV_01_F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"B_UGV_01_F",														//UGV Stomper
	"B_UGV_01_rcws_F",
	"B_UAV_05_F"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"UK3CB_BAF_Officer_MTP_H",
	"UK3CB_BAF_GunnerM6_MTP_H",
	"UK3CB_BAF_Grenadier_762_MTP_H",
	"UK3CB_BAF_LSW_MTP_H",
	"UK3CB_BAF_Grenadier_762_MTP_H",
	"UK3CB_BAF_Medic_MTP_H",
	"UK3CB_BAF_MAT_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H"
];

// Heavy infantry squad
blufor_squad_inf = [
"UK3CB_BAF_Officer_MTP_H",
"UK3CB_BAF_GunnerM6_MTP_H",
"UK3CB_BAF_Grenadier_762_MTP_H",
"UK3CB_BAF_LSW_MTP_H",
"UK3CB_BAF_MGLMG_MTP_H",
"UK3CB_BAF_Grenadier_762_MTP_H",
"UK3CB_BAF_Medic_MTP_H",
"UK3CB_BAF_MAT_MTP_H",
"UK3CB_BAF_LAT_ILAW_762_MTP_H",
"UK3CB_BAF_LAT_ILAW_762_MTP_H"
];

// AT specialists squad
blufor_squad_at = [
	"UK3CB_BAF_Officer_MTP_H",
	"UK3CB_BAF_MAT_MTP_H",
	"UK3CB_BAF_MAT_MTP_H",
	"UK3CB_BAF_MAT_MTP_H",
	"UK3CB_BAF_Medic_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H"
];

// AA specialists squad
blufor_squad_aa = [
	"UK3CB_BAF_Officer_MTP_H",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"UK3CB_BAF_Medic_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H"
];

// Force recon squad
blufor_squad_recon = [
	"UK3CB_BAF_Medic_MTP_REC_H",
	"UK3CB_BAF_Explosive_MTP_REC_H",
	"UK3CB_BAF_FAC_MTP_REC_H",
	"UK3CB_BAF_Marksman_MTP_REC_H",
	"UK3CB_BAF_MGLMG_MTP_REC_H",
	"UK3CB_BAF_Pointman_MTP_REC_H",
	"UK3CB_BAF_SC_MTP_REC_H",
	"UK3CB_BAF_Sniper_MTP_Ghillie_L115",
	"UK3CB_BAF_Spotter_MTP_Ghillie_L85"
];

// Paratroopers squad
blufor_squad_para = [
	"UK3CB_BAF_Officer_MTP_H",
	"UK3CB_BAF_GunnerM6_MTP_H",
	"UK3CB_BAF_Grenadier_762_MTP_H",
	"UK3CB_BAF_LSW_MTP_H",
	"UK3CB_BAF_MGLMG_MTP_H",
	"UK3CB_BAF_Grenadier_762_MTP_H",
	"UK3CB_BAF_Medic_MTP_H",
	"UK3CB_BAF_MAT_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H",
	"UK3CB_BAF_LAT_ILAW_762_MTP_H"
];


// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "rhs_vdv_des_rifleman";
opfor_rifleman = "rhs_vdv_des_rifleman";
opfor_grenadier = "rhs_vdv_des_grenadier";
opfor_squad_leader = "rhs_vdv_des_junior_sergeant";
opfor_team_leader = "rhs_vdv_des_junior_sergeant";
opfor_marksman = "rhs_vdv_des_marksman";
opfor_machinegunner = "rhs_vdv_des_arifleman";
opfor_heavygunner = "rhs_vdv_des_machinegunner";
opfor_medic = "rhs_vdv_des_medic";
opfor_rpg = "rhs_vdv_des_LAT";
opfor_at = "rhs_vdv_des_at";
opfor_aa = "rhs_vdv_des_aa";
opfor_officer = "rhs_vdv_des_officer_armored";
opfor_sharpshooter = "rhs_vdv_des_marksman_asval";
opfor_sniper = "rhs_vdv_des_marksman";
opfor_engineer = "rhs_vdv_des_engineer";
opfor_paratrooper = "rhs_vdv_recon_rifleman_scout";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "rhs_tigr_m_3camo_vdv";
opfor_mrap_armed = "rhs_tigr_sts_3camo_vdv";
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";
opfor_transport_truck = "RHS_Ural_Open_MSV_01";
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_msv";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "rhs_Flag_Russia_F";

/*	Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.	*/
militia_squad = [
	"rhs_vdv_des_officer_armored",
	"rhs_vdv_des_junior_sergeant",
	"rhs_vdv_des_machinegunner",
	"rhs_vdv_des_machinegunner",
	"rhs_vdv_des_aa",
	"rhs_vdv_des_at",
	"rhs_vdv_des_marksman_asval",
	"rhs_vdv_des_engineer",
	"rhs_vdv_des_medic",
	"rhs_vdv_des_rifleman",
	"rhs_vdv_des_rifleman",
	"rhs_vdv_des_LAT",
	"rhs_vdv_des_grenadier"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_m_3camo_vdv",
	"RHS_Ural_Open_MSV_01"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_sts_3camo_vdv",
	"rhs_btr80_vdv",
	"rhs_bmp2d_vdv",
	"rhs_bmd4ma_vdv",
	"rhs_zsu234_aa"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_sts_3camo_vdv",
	"RHS_Ural_Open_MSV_01",
	"rhs_bmp2d_msv",
	"rhs_btr80_vdv"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"rhs_tigr_sts_3camo_vdv",
	"rhs_tigr_sts_3camo_vdv",
	"rhs_bmp2d_vdv",
	"rhs_btr80_vdv",
	"RHS_Ural_Open_MSV_01",
	"rhs_bmd1r",			//Russian BMD with rockets
	"rhs_bmd4ma_vdv",   //Russian Paratroopers don't have tanks so lets add up-armored bmd instead
	"rhs_zsu234_aa",
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01",
	"RHS_Su25SM_KH29_vvsc"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"RHS_Ural_Open_MSV_01",
	"rhs_bmp2d_msv",
	"rhs_btr80_vdv",
	"rhs_bmd4m_vdv",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"rhs_bmp2d_vdv",
	"rhs_btr80_vdv",
	"RHS_Ural_Open_MSV_01",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"RHS_Su25SM_KH29_vvsc"
];

/*	- Other various mission classnames.
Civilian classnames.	*/
civilians = [
	"C_man_p_beggar_F",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_1_1_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_w_worker_F"
];

// Civilian vehicle classnames.
civilian_vehicles = [
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_Offroad_01_repair_F",
	"C_SUV_01_F",
	"C_Van_01_fuel_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Truck_02_fuel_F",
	"C_Truck_02_transport_F",
	"C_Truck_02_covered_F",
	"C_Truck_02_box_F"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
	"rhsusf_mkvsoc",
	"UK3CB_BAF_Apache_AH1_JS_MTP",
	"UK3CB_BAF_Apache_AH1_MTP",
	"UK3CB_BAF_Apache_AH1_MTP",
	"UK3CB_BAF_Apache_AH1_AT_MTP",
	"RHS_A10",
	"FIR_F15C",															//F-15C Eagle
	"FIR_F15D",															//F-15D Eagle
	"FIR_F15E",															//F-15E Strike Eagle
	"JS_JC_FA18E",														//F/A-18 E Super Hornet
	"JS_JC_FA18F",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"RHS_M119_WD"
];
