// If you want more modifications to be supported by this file, let's discuss it on the forums.

// No required mods. 
// RHS USAF, BWMod, F-15C, F/A-18 are optional (just load the mods on server & client).
// Apex & Jets DLC are also included but not required (required only to drive/pilot anything from each DLC inc/ the Tanoa map).

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
KP_liberation_little_bird_classname = "B_Heli_Light_01_F"; 				// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
KP_liberation_boat_classname = "B_Boat_Transport_01_F"; 				// These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
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
	["B_soldier_AT_F",50,10,0],											//AT Specialist
	["B_soldier_AA_F",50,10,0],											//AA Specialist
	["B_medic_F",30,0,0],												//Combat Life Saver
	["B_engineer_F",30,0,0],											//Engineer
	["B_soldier_exp_F",30,0,0],											//Explosives Specialist
	["B_recon_F",20,0,0],												//Recon Scout
	["B_recon_LAT_F",30,0,0],											//Recon Scout (AT)
	["B_recon_M_F",30,0,0],												//Recon Marksman
	["B_Recon_Sharpshooter_F",40,0,0],									//Recon Sharpshooter
	["B_recon_medic_F",30,0,0],											//Recon Paramedic
	["B_recon_exp_F",30,0,0],											//Recon Demolition Expert
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
	["B_LSV_01_armed_F",75,40,50],										//Prowler (HMG)
	["B_MRAP_01_F",100,0,50],											//Hunter
	["B_MRAP_01_hmg_F",100,40,50],										//Hunter (HMG)
	["B_MRAP_01_gmg_F",100,60,50],										//Hunter (GMG)
	["I_MRAP_03_F",100,0,50],											//Strider
	["I_MRAP_03_hmg_F",100,40,50],										//Strider (HMG) 
	["I_MRAP_03_gmg_F",100,60,50],										//Strider (GMG)
	["rhsusf_m1025_w",100,0,50],										//M1025A2
	["rhsusf_m1025_w_m2",100,40,50],									//M1025A2 (M2)
	["rhsusf_m1025_w_mk19",100,60,50],									//M1025A2 (Mk19)
	["rhsusf_m998_w_2dr_fulltop",100,0,50],								//M1097A2 (2D)
	["rhsusf_m998_w_2dr_halftop",100,0,50],								//M1097A2 (2D / open back)
	["BWA3_Eagle_Fleck",100,0,50],										//Eagle IV
	["BWA3_Eagle_FLW100_Fleck",100,100,50],								//Eagle IV (FLW 100)
	["B_Truck_01_transport_F",125,0,75],								//HEMTT Transport
	["B_Truck_01_covered_F",125,0,75],									//HEMTT Transport (Covered)
	["rhsusf_M1083A1P2_wd_fmtv_usarmy",125,0,75],						//M1083A1P2 (covered infantry truck)
	["rhsusf_M1083A1P2_wd_open_fmtv_usarmy",125,0,75],					//M1083A1P2 (open infantry truck)
	["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],							//M977A4 BKIT (cargo truck)
	["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,40,75],						//M977A4 BKIT (cargo truck with HMG)
	["B_UGV_01_F",150,0,50],											//UGV Stomper
	["B_UGV_01_rcws_F",150,40,50],										//UGV Stomper (RCWS)
	["B_Boat_Transport_01_F",100,0,25],									//Assault Boat
	["B_Boat_Armed_01_minigun_F",200,80,75],							//Speedboat Minigun
	["rhsusf_mkvsoc",250,200,100],										//Mk.V SOCOM
	["B_SDV_01_F",150,0,50]												//SDV
];

heavy_vehicles = [
	["rhsusf_m113_usarmy",200,40,100],									//M113A3 (M2)
	["rhsusf_m113_usarmy_MK19",200,60,100],								//M113A3 (Mk19)
	["rhsusf_m113_usarmy_medical",200,0,100],							//M113A3 (Medical)
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
	["B_Heli_Light_01_dynamicLoadout_F",200,100,100],					//AH-9 Pawnee
	["RHS_MELB_MH6M",200,0,100],										//AH-6M Little Bird
	["RHS_MELB_AH6M_L",200,100,100],									//AH-6M-L Little Bird
	["RHS_MELB_AH6M_M",200,200,100],									//AH-6M-M Little Bird
	["RHS_MELB_AH6M_H",200,350,100],									//AH-6M-H Little Bird
	["I_Heli_light_03_unarmed_F",225,0,125],							//WY-55 Hellcat
	["I_Heli_light_03_dynamicLoadout_F",225,200,125],					//WY-55 Hellcat (Armed)
	["RHS_UH1Y_UNARMED",225,0,125],										//UH-1Y (Unarmed)
	["RHS_UH1Y_GS",225,200,125],										//UH-1Y (Ground Suppression)
	["B_Heli_Attack_01_dynamicLoadout_F",500,400,200],					//AH-99 Blackfoot
	["RHS_AH1Z",500,500,200],											//AH-1Z (Multi-Role)
	["RHS_AH64D_wd",750,750,250],										//AH-64D (Multi-Role)
	["BWA3_Tiger_RMK_Universal",750,750,250],							//UH Tiger RMK (Universal)
	["B_Heli_Transport_01_F",250,80,150],								//UH-80 Ghost Hawk
	["B_Heli_Transport_01_camo_F",250,80,150],							//UH-80 Ghost Hawk (Camo)
	["RHS_UH60M",250,80,150],											//UH-60M
	["RHS_UH60M_MEV2",300,0,150],										//UH-60M MEV2
	["RHS_CH_47F",275,80,175],											//CH-47 Chinook (Armed)
	["I_Heli_Transport_02_F",275,0,175],								//CH-49 Mohawk
	["rhsusf_CH53E_USMC",300,0,175],									//CH-53E Super Stallion
	["B_Heli_Transport_03_F",300,80,175],								//CH-67 Huron (Armed)
	["B_UAV_02_dynamicLoadout_F",400,400,200],							//MQ-4A Greyhawk
	["B_T_UAV_03_dynamicLoadout_F",450,500,250],						//MQ-12 Falcon
	["B_UAV_05_F",500,500,200],											//UCAV Sentinel
	["I_Plane_Fighter_03_dynamicLoadout_F",500,400,350],				//A-143 Buzzard
	["B_Plane_CAS_01_dynamicLoadout_F",1000,800,400],					//A-164 Wipeout (CAS)
	["RHS_A10",1000,1000,400],											//A-10A (CAS)
	["I_Plane_Fighter_04_F",1000,1200,400],								//A-149 Gryphon
	["FIR_F15C",1250,1250,450],											//F-15C Eagle
	["FIR_F15D",1250,1250,450],											//F-15D Eagle
	["FIR_F15E",1250,1500,450],											//F-15E Strike Eagle
	["JS_JC_FA18E",1500,1750,450],										//F/A-18 E Super Hornet
	["JS_JC_FA18F",1500,1750,450],										//F/A-18 F Super Hornet
	["B_Plane_Fighter_01_F",1500,1750,450],								//F/A-181 Black Wasp II
	["B_Plane_Fighter_01_Stealth_F",1500,1750,450],						//F/A-181 Black Wasp II (Stealth)
	["B_T_VTOL_01_armed_F",750,1500,500],								//V-44 X Blackfish (Armed)
	["B_T_VTOL_01_infantry_F",750,0,500],								//V-44 X Blackfish (Infantry)
	["B_T_VTOL_01_vehicle_F",750,0,500]									//V-44 X Blackfish (Vehicle)
];

static_vehicles = [
	["B_HMG_01_A_F",25,40,0],											//Mk30A HMG .50
	["B_HMG_01_high_F",25,40,0],										//Mk30 HMG .50 (Raised)
	["B_GMG_01_A_F	",25,60,0],											//Mk32A GMG 20mm
	["B_GMG_01_high_F",25,60,0],										//Mk32 GMG 20mm (Raised)
	["B_static_AT_F",50,100,0],											//Static TTitan Launcher (AT)
	["B_static_AA_F",50,100,0],											//Static Titan Launcher (AA)
	["B_Mortar_01_F",80,150,0],											//Mk6 Mortar
	["RHS_M119_WD",100,200,0]											//M119A2
];

buildings = [
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Land_Cargo_Tower_V1_F",0,0,0],
	["Flag_NATO_F",0,0,0],
	["Flag_US_F",0,0,0],
	["BWA3_Flag_Ger_F",0,0,0],
	["Flag_UK_F",0,0,0],
	["Flag_White_F",0,0,0],
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],	
	["CamoNet_BLUFOR_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_LampSolar_F",0,0,0],
	["Land_LampHalogen_F",0,0,0],
	["Land_LampStreet_small_F",0,0,0],
	["Land_LampAirport_F",0,0,0],
	["Land_HelipadCircle_F",0,0,0],										//Strictly aesthetic - as in it does not increase helicopter cap!
	["Land_HelipadRescue_F",0,0,0],										//Strictly aesthetic - as in it does not increase helicopter cap!
	["PortableHelipadLight_01_blue_F",0,0,0],
	["PortableHelipadLight_01_green_F",0,0,0],
	["PortableHelipadLight_01_red_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["MapBoard_stratis_F",0,0,0],
	["MapBoard_seismic_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_empty_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_PaperBox_closed_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_GasTank_01_blue_F",0,0,0],
	["Land_GasTank_01_khaki_F",0,0,0],
	["Land_GasTank_01_yellow_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_BarrelWater_F",0,0,0],
	["Land_BarrelWater_grey_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Corner_F",0,0,0],
	["Land_BagFence_End_F",0,0,0],	
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_HBarrier_1_F",0,0,0],
	["Land_HBarrier_3_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrier_Big_F",0,0,0],
	["Land_HBarrierWall4_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierWall_corridor_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_CncBarrierMedium_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_Concrete_SmallWall_4m_F",0,0,0],	
	["Land_Concrete_SmallWall_8m_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_CncWall1_F",0,0,0],	
	["Land_CncWall4_F",0,0,0],
	["Land_Sign_WarningMilitaryArea_F",0,0,0],
	["Land_Sign_WarningMilAreaSmall_F",0,0,0],
	["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles = [
	[Arsenal_typename,100,200,0],
	[Respawn_truck_typename,200,0,100],
	[FOB_box_typename,300,500,0],
	[FOB_truck_typename,300,500,75],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,250,0,0],
	[KP_liberation_air_vehicle_building,1000,0,0],
	[KP_liberation_heli_slot_building,250,0,0],
	[KP_liberation_plane_slot_building,500,0,0],
	["ACE_medicalSupplyCrate_advanced",50,0,0],
	["ACE_Box_82mm_Mo_HE",50,40,0],
	["ACE_Box_82mm_Mo_Smoke",50,10,0],
	["ACE_Box_82mm_Mo_Illum",50,10,0],
	["B_APC_Tracked_01_CRV_F",500,250,350],								//CRV-6e Bobcat
	["B_Truck_01_Repair_F",325,0,75],									//HEMTT Repair
	["B_Truck_01_fuel_F",125,0,275],									//HEMTT Fuel
	["B_Truck_01_ammo_F",125,200,75],									//HEMTT Ammo
	["rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",325,0,75],					//M977A4 Repair
	["rhsusf_M978A4_BKIT_usarmy_wd",125,0,275],							//M978A4 Fuel
	["rhsusf_M977A4_AMMO_BKIT_usarmy_wd",125,200,75],					//M977A4 Ammo
	["B_Slingload_01_Repair_F",275,0,0],								//Huron Repair
	["B_Slingload_01_Fuel_F",75,0,200],									//Huron Fuel
	["B_Slingload_01_Ammo_F",75,200,0]									//Huron Ammo
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"B_UAV_01_F",														//AR-2 Darter
	"B_UGV_01_F",														//UGV Stomper
	"B_UGV_01_rcws_F",													//UGV Stomper (RCWS)
	"B_UAV_02_dynamicLoadout_F",										//MQ-4A Greyhawk
	"B_T_UAV_03_dynamicLoadout_F",										//MQ-12 Falcon
	"B_UAV_05_F"														//UCAV Sentinel
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
	"B_Soldier_TL_F",
	"B_Soldier_F",
	"B_Soldier_F",
	"B_Soldier_LAT_F",
	"B_Soldier_GL_F",
	"B_soldier_AR_F",
	"B_soldier_AR_F",
	"B_soldier_M_F",
	"B_medic_F",
	"B_engineer_F"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"B_Soldier_TL_F",
	"B_Soldier_LAT_F",
	"B_Soldier_LAT_F",
	"B_Soldier_GL_F",
	"B_soldier_AR_F",
	"B_soldier_AR_F",
	"B_HeavyGunner_F",
	"B_Sharpshooter_F",
	"B_medic_F",
	"B_engineer_F"
];

// AT specialists squad.
blufor_squad_at = [
	"B_Soldier_TL_F",
	"B_Soldier_F",
	"B_Soldier_F",
	"B_soldier_AT_F",
	"B_soldier_AT_F",
	"B_soldier_AT_F",
	"B_medic_F",
	"B_soldier_F"
];

// AA specialists squad.
blufor_squad_aa = [
	"B_Soldier_TL_F",
	"B_Soldier_F",
	"B_Soldier_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_medic_F",
	"B_soldier_F"
];

// Force recon squad.
blufor_squad_recon = [
	"B_recon_TL_F",
	"B_recon_F",
	"B_recon_F",
	"B_recon_LAT_F",
	"B_recon_M_F",
	"B_recon_M_F",
	"B_Recon_Sharpshooter_F",
	"B_Recon_Sharpshooter_F",
	"B_recon_medic_F",
	"B_recon_exp_F"
];

// Paratroopers squad.
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

/* - Badguy classnames.
All enemy infantry are defined here.	*/
opfor_officer = "O_officer_F";											//Officer
opfor_team_leader = "O_Soldier_TL_F";									//Team Leader
opfor_squad_leader = "O_Soldier_SL_F";									//Squad Leader
opfor_sentry = "O_Soldier_lite_F";										//Rifleman (Lite)
opfor_rifleman = "O_Soldier_F";											//Rifleman
opfor_rpg = "O_Soldier_LAT_F";											//Rifleman (LAT)
opfor_grenadier = "O_Soldier_GL_F";										//Grenadier
opfor_machinegunner = "O_Soldier_AR_F";									//Autorifleman
opfor_heavygunner = "O_HeavyGunner_F";									//Heavy Gunner
opfor_marksman = "O_soldier_M_F";										//Marksman
opfor_sharpshooter = "O_Sharpshooter_F";								//Sharpshooter
opfor_sniper = "O_sniper_F";											//Sniper
opfor_at = "O_Soldier_AT_F";											//AT Specialist
opfor_aa = "O_Soldier_AA_F";											//AA Specialist
opfor_medic = "O_medic_F";												//Combat Life Saver
opfor_engineer = "O_engineer_F";										//Engineer
opfor_paratrooper = "O_soldier_PG_F";									//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_MRAP_02_F";												//Ifrit
opfor_mrap_armed = "O_MRAP_02_hmg_F";									//Ifrit (HMG)
opfor_transport_helo = "O_Heli_Transport_04_bench_F";					//Mi-290 Taru (Bench)
opfor_transport_truck = "O_Truck_03_covered_F";							//Tempest Transport (Covered)
opfor_fuel_truck = "O_Truck_03_fuel_F";									//Tempest Fuel
opfor_ammo_truck = "O_Truck_03_ammo_F";									//Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "Flag_CSAT_F";												//CSAT Flag

/*	Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.	*/
militia_squad = [
	"O_G_Soldier_TL_F",													//Team Leader
	"O_G_Soldier_SL_F",													//Squad Leader
	"O_G_Soldier_lite_F",												//Rifleman (Lite)
	"O_G_Soldier_F",													//Rifleman
	"O_G_Soldier_F",													//Rifleman
	"O_G_Soldier_LAT_F",												//Rifleman (AT)
	"O_G_Soldier_GL_F",													//Grenadier
	"O_G_Soldier_AR_F",													//Autorifleman
	"O_G_Soldier_AR_F",													//Autorifleman
	"O_G_Soldier_M_F",													//Marksman
	"O_G_medic_F",														//Medic
	"O_G_engineer_F",													//Engineer
	"O_G_Soldier_exp_F"													//Explosives Specialist
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"O_G_Offroad_01_armed_F"											//Offroad (HMG)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_MRAP_02_hmg_F",													//Ifrit (GMG)
	"O_MRAP_02_gmg_F",													//Ifrit (GMG)
	"O_APC_Tracked_02_cannon_F",										//BTR-K Kamysh
	"O_APC_Tracked_02_AA_F",											//ZSU-39 Tigris
	"O_APC_Tracked_02_AA_F",											//ZSU-39 Tigris
	"O_MBT_02_cannon_F",												//T-100 Varsuk
	"O_MBT_02_cannon_F"													//T-100 Varsuk
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_APC_Wheeled_02_rcws_F",											//MSE-3 Marid 
	"O_APC_Tracked_02_cannon_F"											//BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_MRAP_02_gmg_F",													//Ifrit (GMG)
	"O_MRAP_02_gmg_F",													//Ifrit (GMG)
	"O_Truck_03_transport_F",											//Tempest Transport
	"O_Truck_03_covered_F",												//Tempest Transport (Covered)
	"O_APC_Tracked_02_cannon_F",										//BTR-K Kamysh
	"O_APC_Tracked_02_AA_F",											//ZSU-39 Tigris
	"O_APC_Tracked_02_AA_F",											//ZSU-39 Tigris
	"O_MBT_02_cannon_F",												//T-100 Varsuk
	"O_MBT_02_cannon_F",												//T-100 Varsuk
	"O_Heli_Light_02_dynamicLoadout_F",									//Po-30 Orca (Armed)
	"O_Heli_Light_02_dynamicLoadout_F",									//Po-30 Orca (Armed)
	"O_Heli_Transport_04_bench_F",										//Mi-290 Taru (Bench)
	"O_Heli_Attack_02_dynamicLoadout_F"									//Mi-48 Kajman
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_MRAP_02_hmg_F",													//Ifrit (HMG)
	"O_Truck_03_transport_F",											//Tempest Transport
	"O_APC_Wheeled_02_rcws_F",											//MSE-3 Marid 
	"O_APC_Tracked_02_cannon_F",										//BTR-K Kamysh
	"O_APC_Tracked_02_AA_F",											//ZSU-39 Tigris
	"O_Heli_Light_02_dynamicLoadout_F",									//Po-30 Orca (Armed)
	"O_Heli_Transport_04_bench_F"										//Mi-290 Taru (Bench)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"O_Truck_03_transport_F",											//Tempest Transport
	"O_Truck_03_covered_F",												//Tempest Transport (Covered)
	"O_APC_Wheeled_02_rcws_F",											//MSE-3 Marid 
	"O_Heli_Transport_04_bench_F",										//Mi-290 Taru (Bench)
	"O_Heli_Light_02_dynamicLoadout_F"									//Po-30 Orca (Armed)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"O_Heli_Transport_04_bench_F",										//Mi-290 Taru (Bench)
	"O_Heli_Light_02_dynamicLoadout_F",									//Po-30 Orca (Armed)
	"O_Heli_Attack_02_dynamicLoadout_F"									//Mi-48 Kajman
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"O_Plane_CAS_02_dynamicLoadout_F",									//To-199 Neophron (CAS)
	"O_Plane_Fighter_02_F"												//To-201 Shikra
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
	"rhsusf_mkvsoc",													//Mk.V SOCOM
	"rhsusf_m1a1aim_tuski_wd",											//M1A1SA (Tusk I)
	"B_MBT_01_TUSK_F",													//M2A4 Slammer UP
	"rhsusf_m1a2sep1tuskiiwd_usarmy",									//M1A2SEPv1 (Tusk II)
	"BWA3_Leopard2A6M_Fleck",											//MBT Leopard 2A6M
	"B_MBT_01_arty_F",													//M4 Scorcher
	"rhsusf_m109_usarmy",												//M109A6
	"B_MBT_01_mlrs_F",													//M5 Sandstorm MLRS
	"B_Heli_Attack_01_dynamicLoadout_F",								//AH-99 Blackfoot
	"RHS_AH64D_wd",														//AH-64D (Multi-Role)
	"BWA3_Tiger_RMK_Universal",											//UH Tiger RMK (Universal)
	"B_UAV_02_dynamicLoadout_F",										//MQ-4A Greyhawk
	"B_T_UAV_03_dynamicLoadout_F",										//MQ-12 Falcon
	"B_UAV_05_F",														//UCAV Sentinel
	"B_Plane_CAS_01_dynamicLoadout_F",									//A-164 Wipeout (CAS)
	"I_Plane_Fighter_04_F",												//A-149 Gryphon
	"RHS_A10",															//A-10A (CAS)
	"FIR_F15C",															//F-15C Eagle
	"FIR_F15D",															//F-15D Eagle
	"FIR_F15E",															//F-15E Strike Eagle
	"JS_JC_FA18E",														//F/A-18 E Super Hornet
	"JS_JC_FA18F",														//F/A-18 F Super Hornet
	"B_Plane_Fighter_01_F",												//F/A-181 Black Wasp II
	"B_Plane_Fighter_01_Stealth_F",										//F/A-181 Black Wasp II (Stealth)
	"B_T_VTOL_01_armed_F"												//V-44 X Blackfish (Armed)
];

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Unit preset %1 intitialized for: %2", KP_liberation_preset, debug_source];_text remoteExec ["diag_log",2];};
