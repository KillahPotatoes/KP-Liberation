// If you want more modifications to be supported by this file, let's discuss it on the forums.

// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "B_Truck_01_medical_F";			// Default "B_Truck_01_medical_F";
huron_typename = "B_Heli_Transport_03_unarmed_F";					// Default "B_Heli_Transport_03_unarmed_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config in kp_liberation_config) otherwise things will break
crewman_classname = "B_crew_F";				// Default "B_crew_F";
pilot_classname = "B_Helipilot_F";					// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = "B_Heli_Light_01_F"; // Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base
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
	["B_soldier_F",25,0,0],
	["B_soldier_GL_F",30,0,0],
	["B_soldier_AR_F",30,0,0],
	["B_medic_F",30,0,0],
	["B_soldier_M_F",30,0,0],
	["B_engineer_F",30,0,0],
	["B_soldier_LAT_F",40,0,0],
	["B_Sharpshooter_F",50,0,0],
	["B_HeavyGunner_F",50,0,0],
	["B_recon_F",40,0,0],
	["B_recon_medic_F",40,0,0],
	["B_recon_M_F",50,0,0],
	["B_Recon_Sharpshooter_F",80,0,0],
	["B_soldier_AA_F",50,10,0],
	["B_soldier_AT_F",50,10,0],
	["B_sniper_F",100,0,0],
	["B_soldier_PG_F",20,0,0],
	["B_crew_F",10,0,0],
	["B_helipilot_F",10,0,0]
];

light_vehicles = [
	["B_Quadbike_01_F",40,0,20],
	["B_MRAP_01_F",100,0,50],
	["I_MRAP_03_F",100,0,50],
	["B_T_LSV_01_unarmed_F",100,0,50],
	["BWA3_Eagle_Fleck",100,0,50],
	["rhsusf_m1025_w",100,0,50],
	["B_MRAP_01_hmg_F",100,40,50],
	["I_MRAP_03_hmg_F",100,40,50],
	["B_T_LSV_01_armed_F",100,40,50],
	["BWA3_Eagle_FLW100_Fleck",100,40,50],
	["rhsusf_m1025_w_m2",100,40,50],
	["B_MRAP_01_gmg_F",100,60,50],
	["I_MRAP_03_gmg_F",100,60,50],
	["rhsusf_m1025_w_mk19",100,60,50],
	["B_Truck_01_transport_F",160,0,80],
	["B_Truck_01_covered_F",160,0,80],
	["B_UGV_01_F",160,0,80],
	["B_UGV_01_rcws_F",160,50,80],
	["B_Boat_Transport_01_F",100,0,50],
	["B_Boat_Armed_01_minigun_F",300,80,150]
];

heavy_vehicles = [
	["rhsusf_m113_usarmy",200,70,100],
	["rhsusf_m113_usarmy_MK19",200,90,100],
	["B_APC_Wheeled_01_cannon_F",200,100,100],
	["I_APC_Wheeled_03_cannon_F",200,100,100],
	["B_APC_Tracked_01_rcws_F",300,180,150],
	["I_APC_tracked_03_cannon_F",300,180,150],
	["RHS_M2A2_wd",300,220,150],
	["RHS_M2A3_BUSKIII_wd",300,240,150],
	["BWA3_Puma_Fleck",300,280,150],
	["B_APC_Tracked_01_AA_F",300,150,150],
	["RHS_M6_wd",300,200,150],
	["B_MBT_01_cannon_F",400,350,200],
	["I_MBT_03_cannon_F",400,350,200],
	["rhsusf_m1a2sep1wd_usarmy",400,400,200],
	["B_MBT_01_TUSK_F",500,450,250],
	["rhsusf_m1a2sep1tuskiiwd_usarmy",500,500,250],
	["BWA3_Leopard2A6M_Fleck",500,550,250],
	["B_MBT_01_arty_F",600,1500,300],
	["rhsusf_m109_usarmy",600,2000,300],
	["B_MBT_01_mlrs_F",800,2500,400]
];

air_vehicles = [
	["B_Heli_Light_01_F",200,0,100],
	["RHS_MELB_MH6M",200,0,100],
	["I_Heli_light_03_unarmed_F",240,0,120],
	["B_Heli_Light_01_armed_F",200,150,100],
	["RHS_MELB_AH6M_L",200,160,100],
	["RHS_UH60M_MEV2",300,0,150],
	["B_Heli_Transport_01_F",240,100,120],
	["B_Heli_Transport_01_camo_F",240,100,120],
	["RHS_UH60M",240,120,120],
	["B_Heli_Transport_03_F",300,80,150],
	["B_T_VTOL_01_infantry_F",600,100,300],
	["B_T_VTOL_01_vehicle_F",600,100,300],
	["I_Heli_light_03_F",400,500,200],
	["B_Heli_Attack_01_F",600,800,300],
	["RHS_AH1Z",600,1000,300],
	["RHS_AH64D_wd",800,1200,400],
	["BWA3_Tiger_RMK_Universal",800,1500,400],
	["B_T_VTOL_01_armed_F",1000,1600,500],
	["I_Plane_Fighter_03_AA_F",1000,1600,500],
	["I_Plane_Fighter_03_CAS_F",1000,1800,500],
	["B_Plane_CAS_01_F",1000,1800,500],
	["RHS_A10",1000,2000,500],
	["JS_JC_FA18E",1000,3000,500],
	["JS_JC_FA18F",1000,3200,500],
	["B_UAV_01_F",100,0,50],
	["B_UAV_02_F",400,500,200],
	["B_UAV_02_CAS_F",400,600,200],
	["B_T_UAV_03_F",400,600,200]
];

static_vehicles = [
	["B_HMG_01_F",20,20,0],
	["B_HMG_01_high_F",20,20,0],
	["B_GMG_01_F",20,40,0],
	["B_GMG_01_high_F",20,40,0],
	["B_static_AA_F",40,50,0],
	["B_static_AT_F",40,60,0],
	["B_Mortar_01_F",80,120,0]
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
	[Arsenal_typename,10,0,0],
	[Respawn_truck_typename,20,0,80],
	[FOB_box_typename,200,400,0],
	[FOB_truck_typename,200,400,100],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,200,0,0],
	[KP_liberation_air_vehicle_building,0,0,0],
	[KP_liberation_heli_slot_building,0,0,0],
	[KP_liberation_plane_slot_building,0,0,0],
	["ACE_medicalSupplyCrate_advanced",50,0,0],
	["ACE_Box_82mm_Mo_HE",50,40,0],
	["ACE_Box_82mm_Mo_Smoke",50,10,0],
	["ACE_Box_82mm_Mo_Illum",50,10,0],
	["B_APC_Tracked_01_CRV_F",200,30,100],
	["C_Offroad_01_repair_F",160,0,80],
	["B_Truck_01_Repair_F",250,0,100],
	["B_Truck_01_fuel_F",200,0,250],
	["B_Truck_01_ammo_F",200,250,100],
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
	"B_UAV_02_CAS_F",
	"B_T_UAV_03_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"B_Soldier_SL_F",
	"B_Soldier_TL_F",
	"B_Soldier_GL_F",
	"B_soldier_AR_F",
	"B_Soldier_GL_F",
	"B_medic_F",
	"B_Soldier_LAT_F",
	"B_Soldier_F",
	"B_Soldier_F"
];

// Heavy infantry squad
blufor_squad_inf = [
	"B_Soldier_SL_F",
	"B_Soldier_TL_F",
	"B_Soldier_AR_F",
	"B_HeavyGunner_F",
	"B_medic_F",
	"B_Soldier_GL_F",
	"B_Soldier_LAT_F",
	"B_Soldier_LAT_F",
	"B_soldier_M_F",
	"B_Sharpshooter_F"
];

// AT specialists squad
blufor_squad_at = [
	"B_Soldier_SL_F",
	"B_soldier_AT_F",
	"B_soldier_AT_F",
	"B_soldier_AT_F",
	"B_medic_F",
	"B_soldier_F"
];

// AA specialists squad
blufor_squad_aa = [
	"B_Soldier_SL_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_medic_F",
	"B_soldier_F"
];

// Force recon squad
blufor_squad_recon = [
	"B_recon_TL_F",
	"B_recon_F",
	"B_recon_exp_F",
	"B_recon_medic_F",
	"B_recon_LAT_F",
	"B_recon_LAT_F",
	"B_recon_M_F",
	"B_Recon_Sharpshooter_F",
	"B_recon_F"
];

// Paratroopers squad
blufor_squad_para = [
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F",
	"B_soldier_PG_F"
];


// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "O_Soldier_lite_F";
opfor_rifleman = "O_Soldier_F";
opfor_grenadier = "O_Soldier_GL_F";
opfor_squad_leader = "O_Soldier_SL_F";
opfor_team_leader = "O_Soldier_TL_F";
opfor_marksman = "O_soldier_M_F";
opfor_machinegunner = "O_Soldier_AR_F";
opfor_heavygunner = "O_HeavyGunner_F";
opfor_medic = "O_medic_F";
opfor_rpg = "O_Soldier_LAT_F";
opfor_at = "O_Soldier_AT_F";
opfor_aa = "O_Soldier_AA_F";
opfor_officer = "O_officer_F";
opfor_sharpshooter = "O_Sharpshooter_F";
opfor_sniper = "O_sniper_F";
opfor_engineer = "O_engineer_F";
opfor_paratrooper = "O_soldier_PG_F";

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "O_MRAP_02_F";
opfor_mrap_armed = "O_MRAP_02_gmg_F";
opfor_transport_helo = "O_Heli_Transport_04_bench_F";
opfor_transport_truck = "O_Truck_03_covered_F";
opfor_fuel_truck = "O_Truck_03_fuel_F";
opfor_ammo_truck = "O_Truck_03_ammo_F";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "Flag_CSAT_F";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad = [
	"O_G_Soldier_SL_F",
	"O_G_Soldier_A_F",
	"O_G_Soldier_AR_F",
	"O_G_medic_F",
	"O_G_engineer_F",
	"O_G_Soldier_exp_F",
	"O_G_Soldier_GL_F",
	"O_G_Soldier_M_F",
	"O_G_Soldier_F",
	"O_G_Soldier_LAT_F",
	"O_G_Soldier_lite_F",
	"O_G_Sharpshooter_F",
	"O_G_Soldier_TL_F"
];

// Militia vehicles to choose from
militia_vehicles = [
	"O_G_Offroad_01_armed_F"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = [
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = [
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_Heli_Light_02_F"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = [
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Transport_04_bench_F"
];

// Opfor military aircrafts
opfor_air = [
	"O_Plane_CAS_02_F"
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
	"BWA3_Puma_Fleck",
	"B_MBT_01_TUSK_F",
	"rhsusf_m1a2sep1tuskiiwd_usarmy",
	"BWA3_Leopard2A6M_Fleck",
	"B_MBT_01_arty_F",
	"rhsusf_m109_usarmy",
	"B_MBT_01_mlrs_F",
	"B_Heli_Attack_01_F",
	"RHS_AH1Z",
	"RHS_AH64D_wd",
	"BWA3_Tiger_RMK_Universal",
	"B_T_VTOL_01_armed_F",
	"I_Plane_Fighter_03_CAS_F",
	"B_Plane_CAS_01_F",
	"RHS_A10",
	"JS_JC_FA18E",
	"JS_JC_FA18F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"B_T_UAV_03_F"
];
