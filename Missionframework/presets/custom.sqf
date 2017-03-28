// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.


// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";				// Default "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "B_Truck_01_medical_F";			// Default "B_Truck_01_medical_F";
huron_typename = "B_Heli_Transport_03_unarmed_F";					// Default "B_Heli_Transport_03_unarmed_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = "B_officer_F";				// Default "B_officer_F"
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

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = true;
infantry_units_extension = [
	["B_soldier_F",2,0,0],
	["B_soldier_GL_F",3,0,0],
	["B_soldier_AR_F",3,0,0],
	["B_medic_F",3,0,0],
	["B_soldier_M_F",3,0,0],
	["B_engineer_F",3,0,0],
	["B_soldier_LAT_F",4,0,0],
	["B_Sharpshooter_F",5,0,0],
	["B_HeavyGunner_F",5,0,0],
	["B_recon_F",4,0,0],
	["B_recon_medic_F",4,0,0],
	["B_recon_M_F",5,0,0],
	["B_Recon_Sharpshooter_F",8,0,0],
	["B_soldier_AA_F",5,10,0],
	["B_soldier_AT_F",5,10,0],
	["B_sniper_F",10,0,0],
	["B_soldier_PG_F",2,0,0],
	["B_crew_F",1,0,0],
	["B_helipilot_F",1,0,0]
];

light_vehicles_overwrite = true;
light_vehicles_extension = [
	["B_Quadbike_01_F",0,0,2],
	["B_MRAP_01_F",0,0,5],
	["I_MRAP_03_F",0,0,5],
	["B_T_LSV_01_unarmed_F",0,0,5],
	["rhsusf_m1025_w",0,0,5],
	["B_MRAP_01_hmg_F",0,40,5],
	["I_MRAP_03_hmg_F",0,40,5],
	["B_T_LSV_01_armed_F",0,40,5],
	["rhsusf_m1025_w_m2",0,40,5],
	["B_MRAP_01_gmg_F",0,60,5],
	["I_MRAP_03_gmg_F",0,60,5],
	["rhsusf_m1025_w_mk19",0,60,5],
	["B_Truck_01_transport_F",0,0,8],
	["B_Truck_01_covered_F",0,0,8],
	["B_UGV_01_F",0,0,8],
	["B_UGV_01_rcws_F",0,50,8],
	["B_Boat_Transport_01_F",0,0,5],
	["B_Boat_Armed_01_minigun_F",0,80,15]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [
	["rhsusf_m113_usarmy",0,70,10],
	["rhsusf_m113_usarmy_MK19",0,90,10],
	["B_APC_Wheeled_01_cannon_F",0,100,10],
	["I_APC_Wheeled_03_cannon_F",0,100,10],
	["B_APC_Tracked_01_rcws_F",0,180,15],
	["I_APC_tracked_03_cannon_F",0,180,15],
	["RHS_M2A2_wd",0,220,15],
	["RHS_M2A3_BUSKIII_wd",0,240,15],
	["BWA3_Puma_Fleck",0,280,15],
	["B_APC_Tracked_01_AA_F",0,150,15],
	["RHS_M6_wd",0,200,15],
	["B_MBT_01_cannon_F",0,350,20],
	["I_MBT_03_cannon_F",0,350,25],
	["rhsusf_m1a2sep1wd_usarmy",0,400,20],
	["B_MBT_01_TUSK_F",0,450,25],
	["rhsusf_m1a2sep1tuskiiwd_usarmy",0,500,25],
	["BWA3_Leopard2A6M_Fleck",0,550,25],
	["B_MBT_01_arty_F",0,1500,30],
	["rhsusf_m109_usarmy",0,2000,30],
	["B_MBT_01_mlrs_F",0,2500,100]
];

air_vehicles_overwrite = true;
air_vehicles_extension = [
	["B_Heli_Light_01_F",0,0,10],
	["RHS_MELB_MH6M",0,0,10],
	["I_Heli_light_03_unarmed_F",0,0,12],
	["B_Heli_Light_01_armed_F",0,150,10],
	["RHS_MELB_AH6M_L",0,160,10],
	["RHS_UH60M_MEV2",15,0,15],
	["B_Heli_Transport_01_F",0,100,12],
	["B_Heli_Transport_01_camo_F",0,100,12],
	["RHS_UH60M",0,120,12],
	["B_Heli_Transport_03_F",0,80,15],
	["B_T_VTOL_01_infantry_F",0,100,30],
	["B_T_VTOL_01_vehicle_F",0,100,30],
	["I_Heli_light_03_F",0,500,20],
	["B_Heli_Attack_01_F",0,800,30],
	["RHS_AH1Z",0,1000,30],
	["RHS_AH64D_wd",0,1200,40],
	["BWA3_Tiger_RMK_Universal",0,1500,40],
	["B_T_VTOL_01_armed_F",0,1600,50],
	["I_Plane_Fighter_03_AA_F",0,1600,50],
	["I_Plane_Fighter_03_CAS_F",0,1800,50],
	["B_Plane_CAS_01_F",0,1800,50],
	["RHS_A10",0,2000,50],
	["JS_JC_FA18E",0,3000,50],
	["JS_JC_FA18F",0,3200,50],
	["B_UAV_01_F",0,0,5],
	["B_UAV_02_F",0,500,20],
	["B_UAV_02_CAS_F",0,600,20],
	["B_T_UAV_03_F",0,600,20]
];

static_vehicles_overwrite = true;
static_vehicles_extension = [
	["B_HMG_01_F",0,20,0],
	["B_HMG_01_high_F",0,20,0],
	["B_GMG_01_F",0,40,0],
	["B_GMG_01_high_F",0,40,0],
	["B_static_AA_F",0,50,0],
	["B_static_AT_F",0,60,0],
	["B_Mortar_01_F",0,120,0]
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
	[FOB_truck_typename,30,400,10],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,0,0,0],
	[KP_liberation_air_vehicle_building,0,0,0],
	[KP_liberation_heli_slot_building,0,0,0],
	[KP_liberation_plane_slot_building,0,0,0],
	["ACE_medicalSupplyCrate_advanced",5,0,0],
	["ACE_Box_82mm_Mo_HE",5,40,0],
	["ACE_Box_82mm_Mo_Smoke",5,10,0],
	["ACE_Box_82mm_Mo_Illum",5,10,0],
	["B_APC_Tracked_01_CRV_F",0,30,10],
	["C_Offroad_01_repair_F",5,0,2],
	["B_Truck_01_Repair_F",10,0,10],
	["B_Truck_01_fuel_F",10,0,25],
	["B_Truck_01_ammo_F",10,100,10],
	["rhsusf_M977A4_REPAIR_usarmy_wd",10,0,10],
	["rhsusf_M978A4_usarmy_wd",10,0,25],
	["rhsusf_M977A4_AMMO_usarmy_wd",10,100,10],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,20],
	["B_Slingload_01_Ammo_F",5,80,0],
	[KP_liberation_ammo_crate,0,154,0]
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
militia_squad_overwrite = true;
militia_squad_extension = [
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
militia_vehicles_overwrite = true;
militia_vehicles_extension = [
	"O_G_Offroad_01_armed_F"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [
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
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [
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
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [
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
opfor_troup_transports_overwrite = true;
opfor_troup_transports_extension = [
	"O_APC_Wheeled_02_rcws_F",
	"O_Truck_03_covered_F",
	"O_Heli_Transport_04_bench_F",
	"O_Truck_03_transport_F",
	"O_Heli_Light_02_F"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = true;
opfor_choppers_extension = [
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Transport_04_bench_F"
];

// Opfor military aircrafts
opfor_air_overwrite = true;
opfor_air_extension = [
	"O_Plane_CAS_02_F"
];







// Other stuff

// civilians
civilians_overwrite = true;
civilians_extension = [
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
civilian_vehicles_overwrite = true;
civilian_vehicles_extension = [
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


// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf
// REMEMBER: Using of the Blacklist will decrease performance while entering the arsenal. Usage of Whitelist is highly recommended.

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