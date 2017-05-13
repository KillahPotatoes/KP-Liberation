// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// CBA A3
// FA-18 Super Hornet
// RHS: Armed Forces of the Russian Federation
// RHS: United States Forces
// 3cb BAF suite of addons - https://3cbmod.wordpress.com

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
	["UK3CB_BAF_Rifleman_762_MTP_H",15,0,0],
	["UK3CB_BAF_LAT_ILAW_762_MTP_H",20,0,0],
	["UK3CB_BAF_Grenadier_762_MTP_H",20,0,0],
	["UK3CB_BAF_LSW_MTP_H",20,0,0],
	["UK3CB_BAF_MGLMG_MTP_H",20,0,0],
	["UK3CB_BAF_Medic_MTP_H",20,0,0],
	["UK3CB_BAF_Marksman_MTP_H",20,0,0],
	["UK3CB_BAF_Sharpshooter_MTP_H",30,0,0],
	["UK3CB_BAF_Engineer_MTP_H",10,0,0],
	["UK3CB_BAF_Repair_MTP_H",10,0,0],
	["UK3CB_BAF_Explosive_MTP_H",10,0,0],
	["UK3CB_BAF_UAV_MTP_RM",50,0,0],
	["UK3CB_BAF_FAC_MTP_H",20,0,0],
	["UK3CB_BAF_MFC_MTP_H",20,0,0],
	["UK3CB_BAF_MAT_MTP_H",50,0,0],
	["UK3CB_BAF_LAT_762_MTP_H",30,0,0],
	["UK3CB_BAF_MGGPMG_MTP_H",30,0,0],
	["UK3CB_BAF_GunnerM6_MTP_H",50,0,0],
	["UK3CB_BAF_MFC_MTP_H",20,0,0],
	["UK3CB_BAF_Crewman_MTP",5,0,0],
	["UK3CB_BAF_HeliCrew_DPMW",5,0,0],
	["UK3CB_BAF_HeliPilot_RAF_MTP",5,0,0],
	["UK3CB_BAF_Medic_MTP_REC_H",20,0,0],
	["UK3CB_BAF_Explosive_MTP_REC_H",20,0,0],
	["UK3CB_BAF_FAC_MTP_REC_H",20,0,0],
	["UK3CB_BAF_Marksman_MTP_REC_H",20,0,0],
	["UK3CB_BAF_MGLMG_MTP_REC_H",20,0,0],
	["UK3CB_BAF_Pointman_MTP_REC_H",20,0,0],
	["UK3CB_BAF_SC_MTP_REC_H",20,0,0],
	["UK3CB_BAF_Sniper_MTP_Ghillie_L115",40,0,0],
	["UK3CB_BAF_Sniper_MTP_Ghillie_L135",50,0,0],
	["UK3CB_BAF_Spotter_MTP_Ghillie_L129",30,0,0],
	["UK3CB_BAF_Spotter_MTP_Ghillie_L85",30,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",20,0,10],
	["rhsusf_mrzr4_d",30,0,20],
	["B_T_LSV_01_armed_F",40,20,20],
	["UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_Soft_FFR_Green_B_DPMW",100,0,50],
	["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW",100,100,50],
	["UK3CB_BAF_Coyote_Passenger_L134A1_W_DPMW",100,60,80],
	["UK3CB_BAF_Coyote_Passenger_L111A1_W_DPMW",100,60,80],
	["UK3CB_BAF_Jackal2_GMG_W_DPMW",100,60,60],
	["UK3CB_BAF_Jackal2_L2A1_W_DPMW",100,50,60],
	["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B_DPMW",100,50,50],
	["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW",100,40,50],
	["rhsusf_M1237_M2_usarmy_d",100,80,100],
	["rhsusf_M1237_MK19_usarmy_d",100,90,100],
	["rhsusf_M1083A1P2_d_fmtv_usarmy",160,0,80],
	["rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy",160,0,80],
	["rhsusf_M1083A1P2_B_d_open_fmtv_usarmy",160,0,80],
	["rhsusf_M977A4_BKIT_M2_usarmy_d",0,0,0],
	["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy",0,0,0],
	["B_Boat_Transport_01_F",100,0,50],
	["B_Boat_Armed_01_minigun_F",300,80,150],
	["rhsusf_mkvsoc",300,120,300],
	["B_SDV_01_F",200,0,100]
];

heavy_vehicles = [

];

air_vehicles = [
	["UK3CB_BAF_Wildcat_AH1_TRN_8A_MTP",200,0,100],
	["UK3CB_BAF_Wildcat_AH1_CAS_8A_MTP",200,100,100],
	["UK3CB_BAF_Wildcat_AH1_CAS_8B_MTP",200,100,100],
	["UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",200,100,100],
	["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP",200,100,100],
	["UK3CB_BAF_Wildcat_AH1_HEL_8A_MTP",200,200,100],
	["UK3CB_BAF_Merlin_HC3_32_MTP",300,0,150],
	["UK3CB_BAF_Merlin_HC3_18_GPMG_MTP",240,120,120],
	["UK3CB_BAF_Merlin_HC3_CSAR_MTP",240,130,150],
	["UK3CB_BAF_Apache_AH1_CAS_MTP",400,600,500],
	["UK3CB_BAF_Apache_AH1_JS_MTP",500,700,500],
	["UK3CB_BAF_Apache_AH1_MTP",500,700,500],
	["UK3CB_BAF_Apache_AH1_AT_MTP",500,800,500],
	["RHS_A10",1000,2000,500],
	["JS_JC_FA18E",1000,3000,500],
	["JS_JC_FA18F",1000,3200,500],
	["B_UAV_01_F",10,0,5],
	["B_UAV_02_F",400,500,200],
	["B_UAV_02_CAS_F",400,600,200]
];

static_vehicles = [
	["UK3CB_BAF_Static_L111A1_Deployed_High_DPMW",20,20,0],
	["UK3CB_BAF_Static_L111A1_Deployed_Mid_DPMW",20,20,0],
	["UK3CB_BAF_Static_L111A1_Deployed_Low_DPMW",20,20,0],
	["UK3CB_BAF_Static_L134A1_Deployed_High_DPMW",20,40,0],
	["UK3CB_BAF_Static_L134A1_Deployed_Mid_DPMW",20,40,0],
	["UK3CB_BAF_Static_L134A1_Deployed_Low_DPMW",20,40,0],
	["UK3CB_BAF_Static_L7A2_Deployed_High_DPMW",10,10,0],
	["UK3CB_BAF_Static_L7A2_Deployed_Mid_DPMW",10,10,0],
	["UK3CB_BAF_Static_L7A2_Deployed_Low_DPMW",10,10,0],
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
	["Flag_US_F",0,0,0],
	["Flag_UK_F",0,0,0],
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
	["StorageBladder_01_fuel_sand_F",0,0,0]
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
	["UK3CB_BAF_Box_WpsStatic",0,150,0],
	["B_APC_Tracked_01_CRV_F",200,30,100],
	["UK3CB_BAF_Coyote_Logistics_L134A1_W_DPMW",250,0,100],
	["UK3CB_BAF_Coyote_Logistics_L111A1_W_DPMW",200,0,250],
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
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_teamleader",
	"rhsusf_army_ucp_grenadier",
	"rhsusf_army_ucp_autorifleman",
	"rhsusf_army_ucp_grenadier",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ocp_riflemanat",
	"rhsusf_army_ocp_riflemanat"
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
	"rhsusf_army_ocp_riflemanat",
	"rhsusf_army_ucp_marksman"
];

// AT specialists squad
blufor_squad_at = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_javelin",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ocp_riflemanat"
];

// AA specialists squad
blufor_squad_aa = [
	"rhsusf_army_ucp_squadleader",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_aa",
	"rhsusf_army_ucp_medic",
	"rhsusf_army_ocp_riflemanat"
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
opfor_sentry = "LOP_AM_OPF_Infantry_Rifleman_5";
opfor_rifleman = "LOP_AM_OPF_Infantry_GL";
opfor_grenadier = "LOP_TKA_Infantry_GL";
opfor_squad_leader = "LOP_AM_OPF_Infantry_SL";
opfor_team_leader = "LOP_AM_OPF_Infantry_SL";
opfor_marksman = "LOP_TKA_Infantry_Marksman";
opfor_machinegunner = "LOP_US_Infantry_MG_2";
opfor_heavygunner = "LOP_AM_OPF_Infantry_AR";
opfor_medic = "LOP_US_Infantry_Corpsman";
opfor_rpg = "LOP_AM_OPF_Infantry_AT";
opfor_at = "LOP_TKA_Infantry_Rifleman_3";
opfor_aa = "LOP_TKA_Infantry_AA";
opfor_officer = "LOP_US_Infantry_Officer";
opfor_sharpshooter = "LOP_US_Infantry_Marksman";
opfor_sniper = "LOP_TKA_Infantry_Marksman";
opfor_engineer = "LOP_US_Infantry_Engineer";
opfor_paratrooper = "LOP_US_Infantry_Rifleman_4";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "LOP_ISTS_OPF_M1025_D";
opfor_mrap_armed = "LOP_ISTS_OPF_Landrover_M2";
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";
opfor_transport_truck = "RHS_Ural_Open_MSV_01";
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";
opfor_ammo_truck = "rhs_gaz66_ammo_msv";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "rhs_Flag_Insurgents";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad = [
	"LOP_ISTS_OPF_Infantry_Engineer",
	"LOP_ISTS_OPF_Infantry_Corpsman",
	"LOP_ISTS_OPF_Infantry_GL",
	"LOP_ISTS_OPF_Infantry_Rifleman",
	"LOP_US_Infantry_AA",
	"LOP_ISTS_OPF_Infantry_AT",
	"LOP_ISTS_OPF_Infantry_AT",
	"LOP_ISTS_OPF_Infantry_Marksman",
	"LOP_ISTS_OPF_Infantry_AR",
	"LOP_ISTS_OPF_Infantry_SL"
];

// Militia vehicles to choose from
militia_vehicles = [
	"LOP_ChDKZ_UAZ_DshKM",
	"I_G_Offroad_01_armed_F",
	"LOP_ChDKZ_UAZ_SPG",
	"LOP_ChDKZ_UAZ_AGS",
	"LOP_ISTS_OPF_Landrover_M2",
	"LOP_ISTS_OPF_Offroad_M2",
	"RHS_Ural_Zu23_MSV_01"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [
	"LOP_ISTS_OPF_ZSU234",
	"LOP_ISTS_OPF_M113_W",
	"LOP_ISTS_OPF_BMP1",
	"LOP_ISTS_OPF_BMP2",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ISTS_OPF_T34",
	"I_G_Offroad_01_armed_F",
	"LOP_ISTS_OPF_ZSU234",
	"LOP_ChDKZ_UAZ_SPG",
	"LOP_ChDKZ_UAZ_AGS",
	"LOP_ChDKZ_UAZ_DshKM"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = [
	"I_G_Offroad_01_armed_F",
	"LOP_ISTS_OPF_BMP1",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ChDKZ_UAZ_SPG",
	"LOP_ChDKZ_UAZ_AGS",
	"LOP_ChDKZ_UAZ_DshKM"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [
	"LOP_ChDKZ_UAZ_SPG",
	"LOP_ChDKZ_UAZ_AGS",
	"LOP_ISTS_OPF_BMP2",
	"LOP_ISTS_OPF_BTR60",
	"RHS_Ural_Open_MSV_01",
	"LOP_ISTS_OPF_T72BA",
	"LOP_ISTS_OPF_T55",
	"LOP_ISTS_OPF_ZSU234",
	"RHS_Ka52_vvsc",
	"RHS_Mi24V_vvsc",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = [
	"LOP_ISTS_OPF_T34",
	"LOP_ISTS_OPF_BTR60",
	"LOP_ChDKZ_UAZ_SPG",
	"LOP_ChDKZ_UAZ_AGS",
	"LOP_ChDKZ_UAZ_DshKM",
	"RHS_Ural_Open_MSV_01",
	"RHS_Mi8mt_Cargo_vvsc",
	"RHS_Ural_Open_MSV_01"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = [
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
	"RHS_TU95MS_vvs_old",
	"RHS_Su25SM_vvs"
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
"UK3CB_BAF_Apache_AH1_JS_MTP",
"UK3CB_BAF_Apache_AH1_MTP",
"UK3CB_BAF_Apache_AH1_MTP",
"UK3CB_BAF_Apache_AH1_AT_MTP",
"RHS_A10",
"JS_JC_FA18E",
"JS_JC_FA18F",
"B_UAV_02_F",
"B_UAV_02_CAS_F",
"RHS_M119_WD"
];
