/*
    KP Liberation 3CBBAF woodland blufor preset

    File: 3cbbaf_des.sqf
    Author: Dubjunk - https://github.com/Dubjunk/
    Date: 2018-06-05
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Custom preset file for BLUFOR units which contains 3CB-BAF desert assets by default.
    Vehicles from other common mods are also listed and therefore available if the corresponding mods are loaded by server and clients.

    Needed Mods:
    - 3CB BAF Equipment
    - 3CB BAF Vehicle
    - 3CB BAF Weapons
    - 3CB BAF Units
    - RHSUSAF

    Optional Mods:
    - F-15C
    - F/A-18
*/

// Side for this preset
KPLIB_preset_sidePlayers = west;
// Color for this side
KPLIB_preset_colorPlayers = "ColorWEST";

/*------------------------------------------------------------
    --- SUPPORT CLASSNAMES ---
    Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
------------------------------------------------------------*/

// This is the main FOB HQ building. Default is "Land_Cargo_HQ_V1_F".
KPLIB_preset_fobBuilding = "Land_Cargo_HQ_V1_F";
// This is the FOB as a container. Default is "B_Slingload_01_Cargo_F".
KPLIB_preset_fobBox = "B_Slingload_01_Cargo_F";
// This is the FOB as a vehicle. Default is "B_Truck_01_box_F".
KPLIB_preset_fobTruck = "B_Truck_01_box_F";
// This is the virtual arsenal as portable supply crates. Default is "B_supplyCrate_F".
KPLIB_preset_arsenalBox = "B_supplyCrate_F";
// This is the mobile respawn (and medical) truck. Default is "B_Truck_01_medical_F".
KPLIB_preset_respawnTruck = "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM";
// This is Potato 01, a multipurpose mobile respawn as a helicopter. Default is "B_Heli_Transport_03_unarmed_F".
KPLIB_preset_potato = "UK3CB_BAF_Merlin_HC3_18_DDPM";
// This defines the crew for vehicles. Default is "B_crew_F".
KPLIB_preset_crewman = "UK3CB_BAF_Crewman_DDPM";
// This defines the pilot for helicopters. Default is "B_Helipilot_F".
KPLIB_preset_hpilot = "UK3CB_BAF_HeliPilot_Army_DDPM";
// This defines the pilot for jets. Default is "B_Fighter_Pilot_F".
KPLIB_preset_jpilot = "UK3CB_BAF_Pilot_Army";
// These are the additional helicopter which spawn at the Operation Base. Default is "B_Heli_Light_01_F".
KPLIB_preset_addHeli = "UK3CB_BAF_Wildcat_AH1_TRN_8A_DDPM";
// These are the boats which spawn at the stern of the Freedom. Default is "B_Boat_Transport_01_F".
KPLIB_preset_addBoat = "B_Boat_Transport_01_F";
// These are the trucks which are used in the logistic convoy system. Default is "B_Truck_01_transport_F".
KPLIB_preset_logiTruck = "rhsusf_M977A4_BKIT_usarmy_d";
// The small storage area for resources. Default is "ContainmentArea_02_sand_F".
KPLIB_preset_smallStorage = "ContainmentArea_02_sand_F";
// The large storage area for resources. Default is "ContainmentArea_01_sand_F".
KPLIB_preset_largeStorage = "ContainmentArea_01_sand_F";
// The building defined to unlock FOB recycling functionality. Default is "Land_CarService_F".
KPLIB_preset_recycleBuilding = "Land_CarService_F";
// The building defined to unlock FOB air vehicle functionality. Default is "Land_Radar_Small_F".
KPLIB_preset_airBuilding = "Land_Radar_Small_F";
// The helipad used to increase the GLOBAL rotary-wing cap. Default is "Land_HelipadSquare_F".
KPLIB_preset_heliSlot = "Land_HelipadSquare_F";
// The hangar used to increase the GLOBAL fixed-wing cap. Default is "Land_TentHangar_V1_F".
KPLIB_preset_planeSlot = "Land_TentHangar_V1_F";
// This defines the supply crates, as in resources. Default is "CargoNet_01_box_F".
KPLIB_preset_sCrate = "CargoNet_01_box_F";
// This defines the ammunition crates. Default is "B_CargoNet_01_ammo_F".
KPLIB_preset_aCrate = "B_CargoNet_01_ammo_F";
// This defines the fuel crates. Default is "CargoNet_01_barrels_F".
KPLIB_preset_fCrate = "CargoNet_01_barrels_F";

/*------------------------------------------------------------
    --- FRIENDLY CLASSNAMES ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
------------------------------------------------------------*/

// Buildable single infantry units
KPLIB_preset_infantry = [
    ["UK3CB_BAF_Pointman_DDPM",15,0,0],                                 //Rifleman (Light)
    ["UK3CB_BAF_Rifleman_DDPM",20,0,0],                                 //Rifleman
    ["UK3CB_BAF_LAT_ILAW_DDPM",30,0,0],                                 //Rifleman (AT)
    ["UK3CB_BAF_Grenadier_DDPM",25,0,0],                                //Grenadier
    ["UK3CB_BAF_LSW_DDPM",25,0,0],                                      //Autorifleman
    ["UK3CB_BAF_MGLMG_DDPM",35,0,0],                                    //Heavygunner
    ["UK3CB_BAF_Marksman_DDPM",30,0,0],                                 //Marksman
    ["UK3CB_BAF_MAT_DDPM",50,10,0],                                     //AT Specialist
    ["B_soldier_AA_F",50,10,0],                                         //AA Specialist (None in BAF mod.)
    ["UK3CB_BAF_Medic_DDPM",30,0,0],                                    //Combat Life Saver
    ["UK3CB_BAF_Engineer_DDPM",30,0,0],                                 //Engineer
    ["UK3CB_BAF_Explosive_DDPM",30,0,0],                                //Explosives Specialist
    ["UK3CB_BAF_Pointman_DDPM_REC",20,0,0],                             //Recon Rifleman
    ["UK3CB_BAF_FAC_DDPM_REC",30,0,0],                                  //Recon Rifleman (Grenadier)
    ["UK3CB_BAF_MGLMG_DDPM_REC",35,0,0],                                //Recon Machine Gunner
    ["UK3CB_BAF_Marksman_DDPM_REC",30,0,0],                             //Recon Marksman
    ["UK3CB_BAF_Medic_DDPM_REC",30,0,0],                                //Recon Combat Life Saver
    ["UK3CB_BAF_Explosive_DDPM_REC",30,0,0],                            //Recon Explosives Specialist
    ["UK3CB_BAF_Sniper_DDPM_Ghillie_L115",70,5,0],                      //Sniper (L115)
    ["UK3CB_BAF_Sniper_DDPM_Ghillie_L135",70,5,0],                      //Sniper (L135)
    ["UK3CB_BAF_Spotter_DDPM_Ghillie_L129",70,5,0],                     //Sniper (L129)
    ["UK3CB_BAF_Spotter_DDPM_Ghillie_L85",20,0,0],                      //Spotter (L85)
    ["UK3CB_BAF_Crewman_DDPM",10,0,0],                                  //Crewman
    ["UK3CB_BAF_HeliCrew_DDPM",10,0,0],                                 //Helicopter Crew
    ["UK3CB_BAF_HeliMedic_DDPM",20,0,0],                                //Helicopter Crew
    ["UK3CB_BAF_HeliPilot_Army_DDPM",10,0,0],                           //Helicopter Pilot
    ["UK3CB_BAF_Pilot_Army",10,0,0]                                     //Pilot
];

// Buildable light vehicles
KPLIB_preset_lightVeh = [
    ["B_Quadbike_01_F",50,0,25],                                        //Quad Bike
    ["B_LSV_01_unarmed_F",75,0,50],                                     //Prowler
    ["B_LSV_01_armed_F",75,40,50],                                      //Prowler (HMG)
    ["B_T_LSV_01_AT_F",75,60,50],                                       //Prowler (AT)
    ["UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM",75,0,50],               //Land Rover SoftTop
    ["UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM",75,0,50],               //Land Rover HardTop
    ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM",100,40,50],         //Land Rover WMIK (HMG)
    ["UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A_DDPM",100,60,50],         //Land Rover WMIK (GMG)
    ["UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A_DDPM",100,100,50],      //Land Rover WMIK (Milan)
    ["UK3CB_BAF_Jackal2_L2A1_D_DDPM",100,80,50],                        //Jackal 2 (HMG)
    ["UK3CB_BAF_Jackal2_GMG_D_DDPM",100,100,50],                        //Jackal 2 (GMG)
    ["UK3CB_BAF_Coyote_Passenger_L111A1_D_DDPM",100,80,50],             //Coyote Passenger (HMG)
    ["UK3CB_BAF_Coyote_Passenger_L134A1_D_DDPM",100,100,50],            //Coyote Passenger (GMG)
    ["UK3CB_BAF_Coyote_Logistics_L111A1_D_DDPM",100,80,50],             //Coyote Logistics (HMG)
    ["UK3CB_BAF_Coyote_Logistics_L134A1_D_DDPM",100,100,50],            //Coyote Logistics (GMG)
    ["rhsusf_M1230a1_usarmy_d",120,0,60],                               //M1230A1 (MEDEVAC)
    ["rhsusf_M1237_M2_usarmy_d",125,40,75],                             //M1237 (HMG)
    ["rhsusf_M1237_MK19_usarmy_d",125,60,75],                           //M1237 (GMG)
    ["rhsusf_M1083A1P2_D_flatbed_fmtv_usarmy",100,0,50],                //M1083A1P2
    ["rhsusf_M977A4_BKIT_usarmy_d",125,0,75],                           //M977A4 BKIT
    ["rhsusf_M977A4_BKIT_M2_usarmy_d",125,40,75],                       //M977A4 BKIT (HMG)
    ["B_UGV_01_F",150,0,50],                                            //UGV Stomper
    ["B_UGV_01_rcws_F",150,40,50],                                      //UGV Stomper (RCWS)
    ["B_Boat_Transport_01_F",100,0,25],                                 //Assault Boat
    ["B_Boat_Armed_01_minigun_F",200,80,75],                            //Speedboat Minigun
    ["rhsusf_mkvsoc",250,200,100],                                      //Mk.V SOCOM
    ["B_SDV_01_F",150,0,50]                                             //SDV
];

// Buildable heavy vehicles
KPLIB_preset_heavyVeh = [
    ["RHS_M2A2_BUSKI",300,200,150],                                     //M2A2ODS (Busk I)
    ["RHS_M2A3_BUSKIII",300,250,175],                                   //M2A3 (Busk III)
    ["RHS_M6",300,250,175],                                             //M6A2
    ["rhsusf_m1a1aim_tuski_d",400,350,225],                             //M1A1SA (Tusk I)
    ["rhsusf_m1a2sep1tuskiid_usarmy",500,400,250],                      //M1A2SEPv1 (Tusk II)
    ["rhsusf_m109d_usarmy",600,1250,300]                                //M109A6
];

// Buildable air vehicles
KPLIB_preset_airVeh = [
    ["B_UAV_01_F",75,0,25],                                             //AR-2 Darter
    ["B_UAV_06_F",80,0,30],                                             //AL-6 Pelican (Cargo)
    ["UK3CB_BAF_Wildcat_AH1_TRN_8A_DDPM",225,0,125],                    //Wildcat AH1 8 Transport (Unarmed)
    ["UK3CB_BAF_Wildcat_HMA2_TRN_8A_DDPM",250,0,125],                   //Wildcat HMA2 8 Transport (Unarmed)
    ["UK3CB_BAF_Wildcat_AH1_CAS_6C_DDPM",275,200,150],                  //Wildcat AH1 6 (CAS/AT)
    ["UK3CB_BAF_Wildcat_AH1_CAS_8C_DDPM",275,200,150],                  //Wildcat AH1 8 (CAS/AT)
    ["UK3CB_BAF_Apache_AH1_DDPM",500,500,200],                          //Apache AH 1 (Multi-Role)
    ["RHS_AH64D",750,750,250],                                          //AH-64D (Multi-Role)
    ["RHS_UH60M2_d",250,0,150],                                         //UH-60M (Unarmed)
    ["RHS_UH60M_d",250,80,150],                                         //UH-60M
    ["RHS_UH60M_MEV2_d",300,0,150],                                     //UH-60M MEV2
    ["RHS_CH_47F_10",275,80,175],                                       //CH-47 Chinook (Armed)
    ["UK3CB_BAF_Merlin_HC3_32_DDPM",300,0,175],                         //Merlin HC3 32
    ["UK3CB_BAF_Merlin_HC3_CSAR_DDPM",300,80,175],                      //Merlin HC3 CSAR (Armed)
    ["B_UAV_02_dynamicLoadout_F",400,300,200],                          //MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",450,500,250],                        //MQ-12 Falcon
    ["B_UAV_05_F",500,500,200],                                         //UCAV Sentinel
    ["RHS_A10",1000,1000,400],                                          //A-10A (CAS)
    ["FIR_F15C",1250,1250,450],                                         //F-15C Eagle
    ["FIR_F15D",1250,1250,450],                                         //F-15D Eagle
    ["FIR_F15E",1250,1500,450],                                         //F-15E Strike Eagle
    ["JS_JC_FA18E",1500,1750,450],                                      //F/A-18 E Super Hornet
    ["JS_JC_FA18F",1500,1750,450],                                      //F/A-18 F Super Hornet
    ["B_Plane_Fighter_01_F",1500,1750,450],                             //F/A-181 Black Wasp II
    ["B_Plane_Fighter_01_Stealth_F",1500,1750,450],                     //F/A-181 Black Wasp II (Stealth)
    ["B_T_VTOL_01_armed_F",750,1500,500],                               //V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",750,0,500],                               //V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",750,0,500]                                 //V-44 X Blackfish (Vehicle)
];

// Buildable static defense
KPLIB_preset_staticVeh = [
    ["UK3CB_BAF_Static_L7A2_Deployed_Low_DDPM",25,25,0],                //L7A2 LMG (Low)
    ["UK3CB_BAF_Static_L7A2_Deployed_Mid_DDPM",25,25,0],                //L7A2 LMG (Mid)
    ["UK3CB_BAF_Static_L7A2_Deployed_High_DDPM",25,25,0],               //L7A2 LMG (High)
    ["UK3CB_BAF_Static_L111A1_Deployed_Low_DDPM",25,40,0],              //L111A1 HMG (Low)
    ["UK3CB_BAF_Static_L111A1_Deployed_Mid_DDPM",25,40,0],              //L111A1 HMG (Mid)
    ["UK3CB_BAF_Static_L111A1_Deployed_High_DDPM",25,40,0],             //L111A1 HMG (High)
    ["UK3CB_BAF_Static_L134A1_Deployed_Low_DDPM",25,60,0],              //L134A1 GMG (Low)
    ["UK3CB_BAF_Static_L134A1_Deployed_Mid_DDPM",25,60,0],              //L134A1 GMG (Med)
    ["UK3CB_BAF_Static_L134A1_Deployed_High_DDPM",25,60,0],             //L134A1 GMG (High)
    ["RHS_TOW_TriPod_D",50,100,0],                                      //TOW (AT)
    ["RHS_Stinger_AA_pod_D",50,100,0],                                  //Stinger (AA)
    ["UK3CB_BAF_Static_L16_Deployed_DDPM",80,150,0],                    //Mk6 Mortar
    ["RHS_M119_D",100,200,0]                                            //M119A2
];

// Buildable decorative assets
KPLIB_preset_buildings = [
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
    ["Land_HelipadCircle_F",0,0,0],
    ["Land_HelipadRescue_F",0,0,0],
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
    ["Land_ClutterCutter_large_F",0,0,0],
    ["Land_ConcreteKerb_01_2m_F",0,0,0],
    ["Land_ConcreteKerb_01_4m_F",0,0,0],
    ["Land_ConcreteKerb_01_8m_F",0,0,0],
    ["Land_ConcreteHedgehog_01_F",0,0,0],
    ["Land_ConcreteHedgehog_01_palette_F",0,0,0],
    ["Land_Dragons_Teeth_01_4x2_new_F",0,0,0],
    ["Land_Dragons_Teeth_01_1x1_new_F",0,0,0],
    ["Land_RepairDepot_01_tan_F",0,0,0],
    ["Land_TankTracks_01_short_F",0,0,0],
    ["Land_TankTracks_01_long_F",0,0,0],
    ["Land_TankEngine_01_F",0,0,0],
    ["Land_CzechHedgehog_01_new_F",0,0,0]
];

// Buildable vehicles with special functionality
KPLIB_preset_supportVeh = [
    [KPLIB_preset_arsenalBox,100,200,0],
    [KPLIB_preset_respawnTruck,200,0,100],
    [KPLIB_preset_fobBox,300,500,0],
    [KPLIB_preset_fobTruck,300,500,75],
    [KPLIB_preset_smallStorage,0,0,0],
    [KPLIB_preset_largeStorage,0,0,0],
    [KPLIB_preset_recycleBuilding,250,0,0],
    [KPLIB_preset_airBuilding,1000,0,0],
    [KPLIB_preset_heliSlot,250,0,0],
    [KPLIB_preset_planeSlot,500,0,0],
    ["ACE_medicalSupplyCrate_advanced",50,0,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["UK3CB_BAF_Box_WpsStatic",300,300,0],
    ["UK3CB_BAF_Box_L16_Ammo",0,0,0],
    ["UK3CB_BAF_Box_M6_Ammo",0,0,0],
    ["B_APC_Tracked_01_CRV_F",500,250,350],                             //CRV-6e Bobcat
    ["B_Truck_01_Repair_F",325,0,75],                                   //HEMTT Repair
    ["B_Truck_01_fuel_F",125,0,275],                                    //HEMTT Fuel
    ["B_Truck_01_ammo_F",125,200,75],                                   //HEMTT Ammo
    ["rhsusf_M977A4_REPAIR_BKIT_usarmy_d",325,0,75],                    //M977A4 Repair
    ["rhsusf_M978A4_BKIT_usarmy_d",125,0,275],                          //M978A4 Fuel
    ["rhsusf_M977A4_AMMO_BKIT_usarmy_d",125,200,75],                    //M977A4 Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                //Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 //Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  //Huron Ammo
];

/*------------------------------------------------------------
    --- SQUAD COMPOSITIONS ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
------------------------------------------------------------*/

// Light infantry squad.
KPLIB_preset_lightSquad = [
    "UK3CB_BAF_FT_DDPM",
    "UK3CB_BAF_Pointman_DDPM",
    "UK3CB_BAF_Pointman_DDPM",
    "UK3CB_BAF_LAT_ILAW_DDPM",
    "UK3CB_BAF_Grenadier_DDPM",
    "UK3CB_BAF_LSW_DDPM",
    "UK3CB_BAF_LSW_DDPM",
    "UK3CB_BAF_Marksman_DDPM",
    "UK3CB_BAF_Medic_DDPM",
    "UK3CB_BAF_Engineer_DDPM"
];

// Heavy infantry squad.
KPLIB_preset_heavySquad = [
    "UK3CB_BAF_FT_DDPM",
    "UK3CB_BAF_LAT_ILAW_DDPM",
    "UK3CB_BAF_LAT_ILAW_DDPM",
    "UK3CB_BAF_Grenadier_DDPM",
    "UK3CB_BAF_LSW_DDPM",
    "UK3CB_BAF_LSW_DDPM",
    "UK3CB_BAF_MGLMG_DDPM",
    "UK3CB_BAF_Marksman_DDPM",
    "UK3CB_BAF_Medic_DDPM",
    "UK3CB_BAF_Engineer_DDPM"
];

// AT specialists squad.
KPLIB_preset_atSquad = [
    "UK3CB_BAF_FT_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_MAT_DDPM",
    "UK3CB_BAF_MAT_DDPM",
    "UK3CB_BAF_MAT_DDPM",
    "UK3CB_BAF_Medic_DDPM",
    "UK3CB_BAF_Rifleman_DDPM"
];

// AA specialists squad.
KPLIB_preset_aaSquad = [
    "UK3CB_BAF_FT_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "UK3CB_BAF_Medic_DDPM",
    "UK3CB_BAF_Rifleman_DDPM"
];

// Force recon squad.
KPLIB_preset_reconSquad = [
    "UK3CB_BAF_SC_DDPM_REC",
    "UK3CB_BAF_Pointman_DDPM_REC",
    "UK3CB_BAF_Pointman_DDPM_REC",
    "UK3CB_BAF_FAC_DDPM_REC",
    "UK3CB_BAF_MGLMG_DDPM_REC",
    "UK3CB_BAF_Marksman_DDPM_REC",
    "UK3CB_BAF_Sniper_DDPM_Ghillie_L115",
    "UK3CB_BAF_Spotter_DDPM_Ghillie_L85",
    "UK3CB_BAF_Medic_DDPM_REC",
    "UK3CB_BAF_Engineer_DDPM"
];

// Paratroopers squad.
KPLIB_preset_paraSquad = [
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM",
    "UK3CB_BAF_Rifleman_DDPM"
];

/*------------------------------------------------------------
    --- Locked Vehicles ---
    Vehicles from this list will be locked at campaign start.
    You need to capture enemy military bases to unlock vehicles.
------------------------------------------------------------*/

// List for locked vehicles
KPLIB_preset_lockedVeh = [
    "rhsusf_mkvsoc",                                                    //Mk.V SOCOM
    "RHS_M2A3_BUSKIII",                                                 //M2A3 (Busk III)
    "RHS_M6",                                                           //M6A2
    "rhsusf_m1a1aim_tuski_d",                                           //M1A1SA (Tusk I)
    "rhsusf_m1a2sep1tuskiid_usarmy",                                    //M1A2SEPv1 (Tusk II)
    "rhsusf_m109d_usarmy",                                              //M109A6
    "B_UAV_02_dynamicLoadout_F",                                        //MQ-4A Greyhawk
    "B_T_UAV_03_dynamicLoadout_F",                                      //MQ-12 Falcon
    "B_UAV_05_F",                                                       //UCAV Sentinel
    "UK3CB_BAF_Wildcat_AH1_CAS_6C_DDPM",                                //Wildcat AH1 6 (CAS/AT)
    "UK3CB_BAF_Wildcat_AH1_CAS_8C_DDPM",                                //Wildcat AH1 8 (CAS/AT)
    "UK3CB_BAF_Apache_AH1_DDPM",                                        //Apache AH 1 (Multi-Role)
    "RHS_AH64D",                                                        //AH-64D (Multi-Role)
    "RHS_A10",                                                          //A-10A (CAS)
    "FIR_F15C",                                                         //F-15C Eagle
    "FIR_F15D",                                                         //F-15D Eagle
    "FIR_F15E",                                                         //F-15E Strike Eagle
    "JS_JC_FA18E",                                                      //F/A-18 E Super Hornet
    "JS_JC_FA18F",                                                      //F/A-18 F Super Hornet
    "B_Plane_Fighter_01_F",                                             //F/A-181 Black Wasp II
    "B_Plane_Fighter_01_Stealth_F",                                     //F/A-181 Black Wasp II (Stealth)
    "B_T_VTOL_01_armed_F",                                              //V-44 X Blackfish (Armed)
    "RHS_M119_D"                                                        //M119A2
    ];

// Military alphabet for this faction
KPLIB_preset_alphabet = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot",
    "Golf",
    "Hotel",
    "India",
    "Juliet",
    "Kilo",
    "Lima",
    "Mike",
    "November",
    "Oscar",
    "Papa",
    "Quebec",
    "Romeo",
    "Sierra",
    "Tango",
    "Uniform",
    "Victor",
    "Whiskey",
    "X-Ray",
    "Yankee",
    "Zulu"
];
