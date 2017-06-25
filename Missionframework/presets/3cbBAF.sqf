// If you want more modifications to be supported by this file, let's discuss it on the forums.

// 3CB BAF Units, 3CB BAF Equipment, 3CB BAF Weapons, 3CB BAF Vehicle, RHS USAF and RHS AFRF mods are required.
// F-15C, F/A-18 are optional (just load the mods on server & client).
// Apex & Jets DLC are also included but not required (required only to drive/pilot anything from each DLC inc/ the Tanoa map).

/* - Support classnames.
Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not, just don't try!	*/
FOB_typename = "Land_Cargo_HQ_V1_F";										// This is the main FOB HQ building. 																									Default is "Land_Cargo_HQ_V1_F".
FOB_box_typename = "B_Slingload_01_Cargo_F";								// This is the FOB as a container. 																										Default is "B_Slingload_01_Cargo_F".
FOB_truck_typename = "B_Truck_01_box_F";									// This is the FOB as a vehicle.																										Default is "B_Truck_01_box_F".
Arsenal_typename = "B_supplyCrate_F";										// This is the virtual arsenal as portable supply crates.  																				Default is "B_supplyCrate_F".
Respawn_truck_typename = "UK3CB_BAF_LandRover_Amb_FFR_Green_A_MTP";			// This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "UK3CB_BAF_Merlin_HC3_18_MTP";								// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
opfor_ammobox_transport = "RHS_Ural_Open_MSV_01";							// Make sure this thing can transport ammo boxes (see box_transport_config in kp_liberation_config.sqf) otherwise things will break!	Default is "O_Truck_03_transport_F".
crewman_classname = "UK3CB_BAF_Crewman_MTP";								// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "UK3CB_BAF_HeliPilot_Army_MTP";							// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
KP_liberation_little_bird_classname = "UK3CB_BAF_Wildcat_AH1_TRN_8A_MTP";	// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
KP_liberation_boat_classname = "B_Boat_Transport_01_F"; 					// These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";			// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";			// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
KP_liberation_recycle_building = "Land_CarService_F";						// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
KP_liberation_air_vehicle_building = "Land_Radar_Small_F";					// The building defined to unlock FOB air vehicle functionality.																		Default is "Land_Radar_Small_F".
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";					// The helipad used to increase the GLOBAL rotary-wing cap.																				Default is "Land_HelipadSquare_F".
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";					// The hangar used to increase the GLOBAL fixed-wing cap.																				Default is "Land_TentHangar_V1_F".
KP_liberation_supply_crate = "CargoNet_01_box_F";							// This defines the supply crates, as in resources.																						Default is "CargoNet_01_box_F".
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";							// This defines the ammunition crates.																									Default is "B_CargoNet_01_ammo_F".
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";							// This defines the fuel crates.

/* - Friendly classnames.
Each array below represents one of the 7 pages within the build menu. 
Format: ["vehicle_classname",supplies,ammunition,fuel],	Example: ["B_APC_Tracked_01_AA_F",300,150,150],
The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.	*/
infantry_units = [
	["UK3CB_BAF_Pointman_MTP",15,0,0],									//Rifleman (Light)
	["UK3CB_BAF_Rifleman_MTP",20,0,0],									//Rifleman
	["UK3CB_BAF_LAT_ILAW_MTP",30,0,0],									//Rifleman (AT)
	["UK3CB_BAF_Grenadier_MTP",25,0,0],									//Grenadier
	["UK3CB_BAF_LSW_MTP",25,0,0],										//Autorifleman
	["UK3CB_BAF_MGLMG_MTP",35,0,0],										//Heavygunner
	["UK3CB_BAF_Marksman_MTP",30,0,0],									//Marksman
	["UK3CB_BAF_MAT_MTP",50,10,0],										//AT Specialist
	["B_soldier_AA_F",50,10,0],											//AA Specialist (None in BAF mod.)
	["UK3CB_BAF_Medic_MTP",30,0,0],										//Combat Life Saver
	["UK3CB_BAF_Engineer_MTP",30,0,0],									//Engineer
	["UK3CB_BAF_Explosive_MTP",30,0,0],									//Explosives Specialist
	["UK3CB_BAF_Pointman_MTP_REC",20,0,0],								//Recon Rifleman
	["UK3CB_BAF_FAC_MTP_REC",30,0,0],									//Recon Rifleman (Grenadier)
	["UK3CB_BAF_MGLMG_MTP_REC",35,0,0],									//Recon Machine Gunner
	["UK3CB_BAF_Marksman_MTP_REC",30,0,0],								//Recon Marksman
	["UK3CB_BAF_Medic_MTP_REC",30,0,0],									//Recon Combat Life Saver
	["UK3CB_BAF_Explosive_MTP_REC",30,0,0],								//Recon Explosives Specialist
	["UK3CB_BAF_Sniper_MTP_Ghillie_L115",70,5,0],						//Sniper (L115)
	["UK3CB_BAF_Sniper_MTP_Ghillie_L135",70,5,0],						//Sniper (L135)
	["UK3CB_BAF_Spotter_MTP_Ghillie_L129",70,5,0],						//Sniper (L129)
	["UK3CB_BAF_Spotter_MTP_Ghillie_L85",20,0,0],						//Spotter (L85)
	["UK3CB_BAF_Crewman_MTP",10,0,0],									//Crewman
	["UK3CB_BAF_HeliCrew_MTP",10,0,0],									//Helicopter Crew
	["UK3CB_BAF_HeliMedic_MTP",20,0,0],									//Helicopter Crew
	["UK3CB_BAF_HeliPilot_Army_MTP",10,0,0],							//Helicopter Pilot
	["UK3CB_BAF_Pilot_Army",10,0,0]										//Pilot
];

light_vehicles = [
	["B_Quadbike_01_F",50,0,25],										//Quad Bike
	["B_LSV_01_unarmed_F",75,0,50],										//Prowler
	["B_LSV_01_armed_F",75,40,50],										//Prowler (HMG)
	["UK3CB_BAF_LandRover_Soft_FFR_Green_A_MTP",75,0,50],				//Land Rover SoftTop
	["UK3CB_BAF_LandRover_Hard_FFR_Green_A_MTP",75,0,50],				//Land Rover HardTop
	["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A_MTP",100,40,50],			//Land Rover WMIK (HMG)
	["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_A_MTP",100,60,50],			//Land Rover WMIK (GMG)
	["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_A_MTP",100,100,50],		//Land Rover WMIK (Milan)
	["UK3CB_BAF_Jackal2_L2A1_W_MTP",100,80,50],							//Jackal 2 (HMG)
	["UK3CB_BAF_Jackal2_GMG_W_MTP",100,100,50],							//Jackal 2 (GMG)
	["UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP",100,80,50],				//Coyote Passenger (HMG)
	["UK3CB_BAF_Coyote_Passenger_L134A1_W_MTP",100,100,50],				//Coyote Passenger (GMG)
	["UK3CB_BAF_Coyote_Logistics_L111A1_W_MTP",100,80,50],				//Coyote Logistics (HMG)
	["UK3CB_BAF_Coyote_Logistics_L134A1_W_MTP",100,100,50],				//Coyote Logistics (GMG)
	["rhsusf_M1237_M2_usarmy_wd",125,40,75],							//M1237 (HMG)
	["rhsusf_M1237_MK19_usarmy_wd",125,60,75],							//M1237 (GMG)
	["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],							//M977A4 BKIT 
	["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,40,75],						//M977A4 BKIT (HMG)
	["B_UGV_01_F",150,0,50],											//UGV Stomper
	["B_UGV_01_rcws_F",150,40,50],										//UGV Stomper (RCWS)
	["B_Boat_Transport_01_F",100,0,25],									//Assault Boat
	["B_Boat_Armed_01_minigun_F",200,80,75],							//Speedboat Minigun
	["rhsusf_mkvsoc",250,200,100],										//Mk.V SOCOM
	["B_SDV_01_F",150,0,50]												//SDV
];

heavy_vehicles = [

];

air_vehicles = [
	["B_UAV_01_F",75,0,25],												//AR-2 Darter
	["UK3CB_BAF_Wildcat_AH1_TRN_8A_MTP",225,0,125],						//Wildcat AH1 8 Transport (Unarmed)
	["UK3CB_BAF_Wildcat_HMA2_TRN_8A_MTP",250,0,125],					//Wildcat HMA2 8 Transport (Unarmed)
	["UK3CB_BAF_Wildcat_AH1_CAS_6C_MTP",275,200,150],					//Wildcat AH1 6 (CAS/AT)
	["UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",275,200,150],					//Wildcat AH1 8 (CAS/AT)
	["UK3CB_BAF_Apache_AH1_MTP",500,500,200],							//Apache AH 1 (Multi-Role)
	["RHS_AH64D_wd",750,750,250],										//AH-64D (Multi-Role)
	["RHS_UH60M",250,80,150],											//UH-60M
	["RHS_UH60M_MEV2",300,0,150],										//UH-60M MEV2
	["RHS_CH_47F_10",275,80,175],										//CH-47 Chinook (Armed)
	["UK3CB_BAF_Merlin_HC3_32_MTP",300,0,175],							//Merlin HC3 32
	["UK3CB_BAF_Merlin_HC3_CSAR_MTP",300,80,175],						//Merlin HC3 CSAR (Armed)
	["B_UAV_02_dynamicLoadout_F",400,300,200],							//MQ-4A Greyhawk
	["B_T_UAV_03_dynamicLoadout_F",450,500,250],						//MQ-12 Falcon
	["B_UAV_05_F",500,500,200],											//UCAV Sentinel
	["RHS_A10",1000,1000,400],											//A-10A (CAS)
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
	["UK3CB_BAF_Static_L7A2_Deployed_Low_MTP",25,25,0],					//L7A2 LMG (Low)
	["UK3CB_BAF_Static_L7A2_Deployed_Mid_MTP",25,25,0],					//L7A2 LMG (Mid)
	["UK3CB_BAF_Static_L7A2_Deployed_High_MTP",25,25,0],				//L7A2 LMG (High)
	["UK3CB_BAF_Static_L111A1_Deployed_Low_MTP",25,40,0],				//L111A1 HMG (Low)
	["UK3CB_BAF_Static_L111A1_Deployed_Mid_MTP",25,40,0],				//L111A1 HMG (Mid)
	["UK3CB_BAF_Static_L111A1_Deployed_High_MTP",25,40,0],				//L111A1 HMG (High)
	["UK3CB_BAF_Static_L134A1_Deployed_Low_MTP",25,60,0],				//L134A1 GMG (Low)
	["UK3CB_BAF_Static_L134A1_Deployed_Mid_MTP",25,60,0],				//L134A1 GMG (Med)
	["UK3CB_BAF_Static_L134A1_Deployed_High_MTP",25,60,0],				//L134A1 GMG (High)
	["RHS_TOW_TriPod_WD",50,100,0],										//TOW (AT)
	["RHS_Stinger_AA_pod_WD",50,100,0],									//Stinger (AA)
	["UK3CB_BAF_Static_L16_Deployed_MTP",80,150,0],						//Mk6 Mortar
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
	[Respawn_truck_typename,200,0,75],
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
	["UK3CB_BAF_Box_WpsStatic",300,300,0],
	["UK3CB_BAF_Box_L16_Ammo",0,0,0],
	["UK3CB_BAF_Box_M6_Ammo",0,0,0],
	["B_APC_Tracked_01_CRV_F",500,250,350],								//CRV-6e Bobcat
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
	"UK3CB_BAF_FT_MTP",
	"UK3CB_BAF_Pointman_MTP",
	"UK3CB_BAF_Pointman_MTP",
	"UK3CB_BAF_LAT_ILAW_MTP",
	"UK3CB_BAF_Grenadier_MTP",
	"UK3CB_BAF_LSW_MTP",
	"UK3CB_BAF_LSW_MTP",
	"UK3CB_BAF_Marksman_MTP",
	"UK3CB_BAF_Medic_MTP",
	"UK3CB_BAF_Engineer_MTP"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"UK3CB_BAF_FT_MTP",
	"UK3CB_BAF_LAT_ILAW_MTP",
	"UK3CB_BAF_LAT_ILAW_MTP",
	"UK3CB_BAF_Grenadier_MTP",
	"UK3CB_BAF_LSW_MTP",
	"UK3CB_BAF_LSW_MTP",
	"UK3CB_BAF_MGLMG_MTP",
	"UK3CB_BAF_Marksman_MTP",
	"UK3CB_BAF_Medic_MTP",
	"UK3CB_BAF_Engineer_MTP"
];

// AT specialists squad.
blufor_squad_at = [
	"UK3CB_BAF_FT_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_MAT_MTP",
	"UK3CB_BAF_MAT_MTP",
	"UK3CB_BAF_MAT_MTP",
	"UK3CB_BAF_Medic_MTP",
	"UK3CB_BAF_Rifleman_MTP"
];

// AA specialists squad.
blufor_squad_aa = [
	"UK3CB_BAF_FT_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"B_soldier_AA_F",
	"UK3CB_BAF_Medic_MTP",
	"UK3CB_BAF_Rifleman_MTP"
];

// Force recon squad.
blufor_squad_recon = [
	"UK3CB_BAF_SC_MTP_REC",
	"UK3CB_BAF_Pointman_MTP_REC",
	"UK3CB_BAF_Pointman_MTP_REC",
	"UK3CB_BAF_FAC_MTP_REC",
	"UK3CB_BAF_MGLMG_MTP_REC",
	"UK3CB_BAF_Marksman_MTP_REC",
	"UK3CB_BAF_Sniper_MTP_Ghillie_L115",
	"UK3CB_BAF_Spotter_MTP_Ghillie_L85",
	"UK3CB_BAF_Medic_MTP",
	"UK3CB_BAF_Engineer_MTP"
];

// Paratroopers squad.
blufor_squad_para = [
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP",
	"UK3CB_BAF_Rifleman_MTP"
];

/* - Badguy classnames.
All enemy infantry are defined here.	*/
opfor_officer = "rhs_vdv_officer_armored";								//Officer
opfor_team_leader = "rhs_vdv_sergeant";									//Team Leader
opfor_squad_leader = "rhs_vdv_efreitor";								//Squad Leader
opfor_sentry = "rhs_vdv_rifleman_lite";									//Rifleman (Lite)
opfor_rifleman = "rhs_vdv_rifleman";									//Rifleman
opfor_rpg = "rhs_vdv_LAT";												//Rifleman (LAT)
opfor_grenadier = "rhs_vdv_grenadier_rpg";								//Grenadier
opfor_machinegunner = "rhs_vdv_arifleman";								//Autorifleman
opfor_heavygunner = "rhs_vdv_machinegunner";							//Heavy Gunner
opfor_marksman = "rhs_vdv_marksman";									//Marksman
opfor_sharpshooter = "rhs_vdv_marksman_asval";							//Sharpshooter
opfor_sniper = "rhs_vdv_marksman_asval";								//Sniper
opfor_at = "rhs_vdv_at";												//AT Specialist
opfor_aa = "rhs_vdv_aa";												//AA Specialist
opfor_medic = "rhs_vdv_medic";											//Combat Life Saver
opfor_engineer = "rhs_vdv_engineer";									//Engineer
opfor_paratrooper = "rhs_vdv_RShG2";									//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "rhs_tigr_msv";											//GAZ-233011
opfor_mrap_armed = "rhs_tigr_sts_msv";									//GAZ-233014 (Armed)
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";							//Mi-8MT (Cargo)
opfor_transport_truck = "RHS_Ural_MSV_01";								//Ural-4320 Transport (Covered)
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";								//Ural-4320 Fuel
opfor_ammo_truck = "rhs_gaz66_ammo_msv";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "rhs_Flag_Russia_F";										//Russian Flag

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
	"rhs_tigr_sts_vdv"													//GAZ-233014 (Armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_bmp2d_vdv",													//BMP-2D
	"rhs_bmp2k_vdv",													//BMP-2K
	"rhs_brm1k_vdv",													//BRM-1K
	"rhs_zsu234_aa",													//ZSU-23-4V
	"rhs_zsu234_aa",													//ZSU-23-4V
	"rhs_bmd4ma_vdv",													//BMD-4M (A)
	"rhs_bmd4ma_vdv"													//BMD-4M (A)
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_btr80_vdv",													//BTR-80
	"rhs_btr80a_vdv"													//BTR-80A
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"RHS_Ural_MSV_01",													//Ural-4320 Transport (Covered)
	"rhs_bmp2d_vdv",													//BMP-2D
	"rhs_bmp2k_vdv",													//BMP-2K
	"rhs_brm1k_vdv",													//BRM-1K
	"rhs_zsu234_aa",													//ZSU-23-4V
	"rhs_zsu234_aa",													//ZSU-23-4V
	"rhs_bmd4ma_vdv",													//BMD-4M (A)
	"rhs_bmd4ma_vdv",													//BMD-4M (A)
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Ka52_vvsc"														//Ka-52
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"rhs_tigr_vdv",														//GAZ-233011
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_vdv",													//GAZ-233014 (Armed)
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"rhs_btr80_vdv",													//BTR-80
	"rhs_btr80a_vdv",													//BTR-80A
	"rhs_zsu234_aa",													//ZSU-23-4V
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Mi8mt_Cargo_vvsc"												//Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"RHS_Ural_MSV_01",													//Ural-4320 Transport (Covered)
	"rhs_btr80_vdv",													//BTR-80
	"rhs_btr80a_vdv",													//BTR-80A
	"rhs_bmp2d_vdv",													//BMP-2D
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc"													//Mi-24V (AT)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Ka52_vvsc"														//Ka-52
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"RHS_Su25SM_vvsc",													//Su-25
	"RHS_Su25SM_KH29_vvsc"												//Su-25 (KH29)
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
	"B_UAV_02_dynamicLoadout_F",										//MQ-4A Greyhawk
	"B_T_UAV_03_dynamicLoadout_F",										//MQ-12 Falcon
	"B_UAV_05_F",														//UCAV Sentinel
	"UK3CB_BAF_Wildcat_AH1_CAS_6C_MTP",									//Wildcat AH1 6 (CAS/AT)
	"UK3CB_BAF_Wildcat_AH1_CAS_8C_MTP",									//Wildcat AH1 8 (CAS/AT)
	"UK3CB_BAF_Apache_AH1_MTP",											//Apache AH 1 (Multi-Role)
	"RHS_AH64D_wd",														//AH-64D (Multi-Role)
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
