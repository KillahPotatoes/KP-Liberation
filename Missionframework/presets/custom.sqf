// If you want more modifications to be supported by this file, let's discuss it on the forums.

/* - Support classnames.
Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not, just don't try!	*/
FOB_typename = "Land_Cargo_HQ_V1_F";									// This is the main FOB HQ building. 																									Default is "Land_Cargo_HQ_V1_F".
FOB_box_typename = "B_Slingload_01_Cargo_F";							// This is the FOB as a container. 																										Default is "B_Slingload_01_Cargo_F".
FOB_truck_typename = "B_Truck_01_box_F";								// This is the FOB as a vehicle.																										Default is "B_Truck_01_box_F".
Arsenal_typename = "B_supplyCrate_F";									// This is the virtual arsenal as portable supply crates.  																				Default is "B_supplyCrate_F".
Respawn_truck_typename = "B_Truck_01_medical_F";						// This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "B_Heli_Transport_03_unarmed_F";						// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
opfor_ammobox_transport = "O_Truck_03_transport_F";						// Make sure this thing can transport ammo boxes (see box_transport_config in kp_liberation_config.sqf) otherwise things will break!	Default is "O_Truck_03_transport_F".
crewman_classname = "B_crew_F";											// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "B_Helipilot_F";										// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
KP_liberation_little_bird_classname = "B_Heli_Light_01_F"; 				// These are the little birds that spawn on the lhd or at Chimera base. 																Default is "B_Heli_Light_01_F".
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";		// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";		// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
KP_liberation_recycle_building = "Land_CarService_F";					// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
KP_liberation_air_vehicle_building = "Land_Radar_Small_F";				// The building defined to unlock FOB air vehicle functionality.																		Default is "Land_Radar_Small_F".
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";				// The helipad used to increase the GLOBAL rotary-wing cap.																				Default is "Land_HelipadSquare_F".
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";				// The hangar used to increase the GLOBAL fixed-wing cap.																				Default is "Land_TentHangar_V1_F".
KP_liberation_supply_crate = "CargoNet_01_box_F";						// This defines the supply crates, as in resources.																						Default is "CargoNet_01_box_F".
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";						// This defines the ammunition crates.																									Default is "B_CargoNet_01_ammo_F".
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";						// This defines the fuel crates.																										Default is "CargoNet_01_barrels_F".

/* - Friendly classnames.
Each array below represents one of the 7 pages within the build menu. 
Format: ["vehicle_classname",supplies,ammunition,fuel],	Example: ["B_APC_Tracked_01_AA_F",300,150,150],
The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.	*/
infantry_units = [
	["B_Soldier_lite_F",15,0,0],										//Rifleman (Light)
	["B_Soldier_F",20,0,0],												//Rifleman
	["B_soldier_LAT_F",30,0,0],											//Rifleman (AT)
	["B_Soldier_GL_F",25,0,0],											//Grenadier
	["B_soldier_AR_F",25,0,0],											//Autorifleman
	["B_HeavyGunner_F",35,0,0],											//Heavygunner
	["B_soldier_M_F",30,0,0],											//Marksman
	["B_Sharpshooter_F",40,0,0],										//Sharpshooter
	["B_soldier_AA_F",50,10,0],											//AA Specialist
	["B_soldier_AT_F",50,10,0],											//AT Specialist
	["B_medic_F",30,0,0],												//Combat Life Saver
	["B_engineer_F",30,0,0],											//Engineer
	["B_soldier_exp_F",30,0,0],											//Explosives Specialist
	["B_recon_F",20,0,0],												//Recon Scout
	["B_recon_LAT_F",30,0,0],											//Recon Scout (AT)
	["B_recon_M_F",30,0,0],												//Recon Marksman
	["B_Recon_Sharpshooter_F",40,0,0],									//Recon Sharpshooter
	["B_recon_medic_F",30,0,0],											//Recon Paramedic
	["B_sniper_F",70,5,0],												//Sniper
	["B_ghillie_ard_F",70,5,0],											//Sniper (Arid)
	["B_ghillie_lsh_F",70,5,0],											//Sniper (Lush)
	["B_ghillie_sard_F",70,5,0],										//Sniper (Semi-Arid)
	["B_spotter_F",20,0,0],												//Spotter
	["B_crew_F",10,0,0],												//Crewman
	["B_soldier_PG_F",20,0,0],											//Para Trooper
	["B_helicrew_F",10,0,0],											//Helicopter Crew
	["B_Helipilot_F",10,0,0],											//Helicopter Pilot
	["B_Pilot_F",10,0,0]												//Pilot
];

light_vehicles = [
	["B_Quadbike_01_F",50,0,25],										//Quad Bike
	["B_LSV_01_unarmed_F",75,0,50],										//Prowler
	["B_LSV_01_armed_F",75,0,50],										//Prowler (HMG)
	["B_MRAP_01_F",100,0,50],											//Hunter
	["B_MRAP_01_hmg_F",100,40,50],										//Hunter (HMG)
	["B_MRAP_01_gmg_F",100,60,50],										//Hunter (GMG)
	["I_MRAP_03_F",100,0,50],											//Strider
	["I_MRAP_03_hmg_F",100,40,50],										//Strider (HMG) 
	["I_MRAP_03_gmg_F",100,60,50],										//Strider (GMG)
	["rhsusf_m1025_w",100,0,50],										//M1025A2
	["rhsusf_m1025_w_m2",100,40,50],									//M1025A2 (M2)
	["rhsusf_m1025_w_mk19",100,60,50],									//M1025A2 (Mk19)
	["BWA3_Eagle_Fleck",100,0,50],										//Eagle IV
	["BWA3_Eagle_FLW100_Fleck",100,80,50],								//Eagle IV (FLW 100)
	["B_Truck_01_transport_F",125,0,75],								//HEMTT Transport
	["B_Truck_01_covered_F",125,0,75],									//HEMTT Transport (Covered)
	["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],							//M977A4 BKIT (Woodland)
	["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,80,75],						//M977A4 BKIT (M2, Woodland)
	["B_UGV_01_F",150,0,50],											//UGV Stomper
	["B_UGV_01_rcws_F",150,40,50],										//UGV Stomper (RCWS)
	["B_Boat_Transport_01_F",100,0,25],									//Assault Boat
	["B_Boat_Armed_01_minigun_F",200,80,75],							//Speedboat Minigun
	["rhsusf_mkvsoc",250,200,100]										//Mk.V SOCOM
];

heavy_vehicles = [
	["rhsusf_m113_usarmy",200,40,100],									//M113A3 (M2)
	["rhsusf_m113_usarmy_MK19",200,60,100],								//M113A3 (Mk19)
	["B_APC_Wheeled_01_cannon_F",200,75,125],							//AMV-7 Marshall
	["I_APC_Wheeled_03_cannon_F",200,75,125],							//AFV-4 Gorgon
	["B_APC_Tracked_01_rcws_F",300,100,150],							//IFV-6c Panther
	["I_APC_tracked_03_cannon_F",300,150,150],							//FV-720 Mora
	["RHS_M2A2_BUSKI_WD",300,200,150],									//M2A2ODS (Busk I)
	["BWA3_Puma_Fleck",300,225,150],									//IFV Puma
	["RHS_M2A3_BUSKIII_wd",300,250,175],								//M2A3 (Busk III)
	["B_APC_Tracked_01_AA_F",300,250,175],								//IFV-6a Cheetah
	["RHS_M6_wd",300,250,175],											//M6A2
	["B_MBT_01_cannon_F",400,300,200],									//M2A1 Slammer
	["I_MBT_03_cannon_F",400,300,200],									//MBT-52 Kuma
	["rhsusf_m1a1aim_tuski_wd",400,350,225],							//M1A1SA (Tusk I)
	["B_MBT_01_TUSK_F",500,350,225],									//M2A4 Slammer UP
	["rhsusf_m1a2sep1tuskiiwd_usarmy",500,400,250],						//M1A2SEPv1 (Tusk II)
	["BWA3_Leopard2A6M_Fleck",500,400,250],								//MBT Leopard 2A6M
	["B_MBT_01_arty_F",600,1250,300],									//M4 Scorcher
	["rhsusf_m109_usarmy",600,1250,300],								//M109A6
	["B_MBT_01_mlrs_F",800,1750,400]									//M5 Sandstorm MLRS
];

air_vehicles = [
	["B_UAV_01_F",75,0,25],												//AR-2 Darter
	["B_Heli_Light_01_F",200,0,100],									//MH-9 Hummingbird
	["B_Heli_Light_01_armed_F",200,100,100],							//AH-9 Pawnee
	["RHS_MELB_MH6M",200,0,100],										//AH-6M Little Bird
	["RHS_MELB_AH6M_L",200,100,100],									//AH-6M-L Little Bird
	["RHS_MELB_AH6M_M",200,200,100],									//AH-6M-M Little Bird
	["RHS_MELB_AH6M_H",200,350,100],									//AH-6M-H Little Bird
	["I_Heli_light_03_unarmed_F",225,0,125],							//WY-55 Hellcat
	["I_Heli_light_03_F",225,200,125],									//WY-55 Hellcat (Armed)
	["RHS_UH1Y_UNARMED",225,0,125],										//UH-1Y (Unarmed)
	["RHS_UH1Y_GS",225,200,125],										//UH-1Y (Ground Suppression)
	["B_Heli_Attack_01_F",500,400,200],									//AH-99 Blackfoot
	["RHS_AH1Z",500,500,200],											//AH-1Z (Multi-Role)
	["RHS_AH64D_wd",750,750,250],										//AH-64D (Multi-Role)
	["BWA3_Tiger_RMK_Universal",750,500,250],							//UH Tiger RMK (Universal)
	["BWA3_Tiger_Gunpod_Heavy",750,500,250],							//UH Tiger Gunpod (Heavy)
	["B_Heli_Transport_01_F",250,80,150],								//UH-80 Ghost Hawk
	["B_Heli_Transport_01_camo_F",250,80,150],							//UH-80 Ghost Hawk (Camo)
	["RHS_UH60M",250,80,150],											//UH-60M
	["RHS_UH60M_MEV2",300,0,150],										//UH-60M MEV2
	["RHS_CH_47F",275,80,175],											//CH-47 Chinook (Armed)
	["I_Heli_Transport_02_F",275,0,175],								//CH-49 Mohawk
	["rhsusf_CH53E_USMC",300,0,175],									//CH-53E
	["B_Heli_Transport_03_F",300,80,175],								//CH-67 Huron (Armed)
	["B_UAV_02_F",400,300,200],											//MQ-4A Greyhawk
	["B_UAV_02_CAS_F",400,500,200],										//MQ-4A Greyhawk (CAS)
	["B_T_UAV_03_F",450,500,250],										//MQ-12 Falcon
	["I_Plane_Fighter_03_AA_F",500,400,350],							//A-143 Buzzard (AA)
	["I_Plane_Fighter_03_CAS_F",500,400,350],							//A-143 Buzzard (CAS)
	["B_Plane_CAS_01_F",1000,800,400],									//A-164 Wipeout (CAS)
	["RHS_A10",1000,1000,400],											//A-10A (CAS)
	["FIR_F15C",1250,1250,450],											//F-15C Eagle
	["FIR_F15D",1250,1250,450],											//F-15D Eagle
	["FIR_F15E",1250,1500,450],											//F-15E Strike Eagle
	["JS_JC_FA18E",1500,1750,450],										//F/A-18 E Super Hornet
	["JS_JC_FA18F",1500,1750,450],										//F/A-18 F Super Hornet
	["B_T_VTOL_01_armed_F",750,1500,500],								//V-44 X Blackfish (Armed)
	["B_T_VTOL_01_infantry_F",750,0,500],								//V-44 X Blackfish (Infantry)
	["B_T_VTOL_01_vehicle_F",750,0,500]									//V-44 X Blackfish (Vehicle)
];

static_vehicles = [
	["B_HMG_01_A_F",25,40,0],											//Mk30A HMG .50
	["B_HMG_01_high_F",25,40,0],										//Mk30 HMG .50 (Raised)
	["B_GMG_01_A_F	",25,60,0],											//Mk32A GMG 20mm
	["B_GMG_01_high_F",25,60,0],										//Mk32 GMG 20mm (Raised)
	["B_static_AA_F",50,70,0],											//Static Titan Launcher (AA)
	["B_static_AT_F",50,70,0],											//Static TTitan Launcher (AT)
	["B_Mortar_01_F",80,120,0],											//Mk6 Mortar
	["RHS_M119_WD",100,200,0]											//M119A2
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
