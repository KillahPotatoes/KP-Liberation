/*
    File: cup_usa_woodland.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2019-07-17
    Last Update: 2020-10-02
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP USA Woodland player preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - USAF Fighters Pack
        - USAF Main Pack
        - USAF Utility Pack
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
KPLIB_b_fobBuilding = "Land_Cargo_HQ_V1_F";                             // This is the main FOB HQ building.
KPLIB_b_fobBox = "B_Slingload_01_Cargo_F";                              // This is the FOB as a container.
KPLIB_b_fobTruck = "B_Truck_01_box_F";                                  // This is the FOB as a vehicle.
KPLIB_b_arsenal = "B_supplyCrate_F";                                    // This is the virtual arsenal as portable supply crates.
KPLIB_b_mobileRespawn = "CUP_B_HMMWV_Ambulance_USA";                    // This is the mobile respawn (and medical) truck.
KPLIB_b_potato01 = "CUP_B_CH47F_USA";                                   // This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIB_b_crewUnit = "CUP_B_US_Crew_UCP";                                 // This defines the crew for vehicles.
KPLIB_b_heliPilotUnit = "CUP_B_US_Pilot";                               // This defines the pilot for helicopters.
KPLIB_b_addHeli = "CUP_B_MH6M_USA";                                     // These are the additional helicopters which spawn on the Freedom or at Chimera base.
KPLIB_b_addBoat = "B_Boat_Transport_01_F";                              // These are the boats which spawn at the stern of the Freedom.
KPLIB_b_logiTruck = "CUP_B_MTVR_USA";                                   // These are the trucks which are used in the logistic convoy system.
KPLIB_b_smallStorage = "ContainmentArea_02_sand_F";                     // A small storage area for resources.
KPLIB_b_largeStorage = "ContainmentArea_01_sand_F";                     // A large storage area for resources.
KPLIB_b_logiStation = "Land_RepairDepot_01_tan_F";                      // The building defined to unlock FOB recycling functionality.
KPLIB_b_airControl = "B_Radar_System_01_F";                             // The building defined to unlock FOB air vehicle functionality.
KPLIB_b_slotHeli = "Land_HelipadSquare_F";                              // The helipad used to increase the GLOBAL rotary-wing cap.
KPLIB_b_slotPlane = "Land_TentHangar_V1_F";                             // The hangar used to increase the GLOBAL fixed-wing cap.
KPLIB_b_crateSupply = "CargoNet_01_box_F";                              // This defines the supply crates, as in resources.
KPLIB_b_crateAmmo = "B_CargoNet_01_ammo_F";                             // This defines the ammunition crates.
KPLIB_b_crateFuel = "CargoNet_01_barrels_F";                            // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
KPLIB_b_infantry = [
    ["CUP_B_US_Soldier_UCP",20,0,0],                                    // Rifleman
    ["CUP_B_US_Soldier_LAT_UCP",30,0,0],                                // Rifleman (AT)
    ["CUP_B_US_Soldier_GL_UCP",25,0,0],                                 // Grenadier
    ["CUP_B_US_Soldier_AR_UCP",25,0,0],                                 // Autorifleman
    ["CUP_B_US_Soldier_MG_UCP",35,0,0],                                 // Machine Gunner
    ["CUP_B_US_Soldier_Marksman_UCP",30,0,0],                           // Marksman
    ["CUP_B_US_Soldier_Marksman_EBR_UCP",30,0,0],                       // Marksman (Mk 14 EBR)
    ["CUP_B_US_Soldier_AT_UCP",50,25,0],                                // AT Specialist
    ["CUP_B_US_Soldier_HAT_UCP",50,10,0],                               // AT Specialist (Javelin)
    ["CUP_B_US_Soldier_AA_UCP",50,10,0],                                // AA Specialist
    ["CUP_B_US_Medic_UCP",30,0,0],                                      // Medic
    ["CUP_B_US_Engineer_UCP",30,0,0],                                   // Engineer
    ["CUP_B_US_Engineer_EOD_UCP",30,0,0],                               // EOD Engineer
    ["CUP_B_US_SpecOps_MG",30,0,0],                                     // Machinegunner
    ["CUP_B_US_SpecOps",20,0,0],                                        // Operator
    ["CUP_B_US_SpecOps_Assault",20,0,0],                                // Operator (Assault)
    ["CUP_B_US_SpecOps_JTAC",20,0,0],                                   // Forward Air Controller
    ["CUP_B_US_SpecOps_M",30,0,0],                                      // Marksman
    ["CUP_B_US_SpecOps_TL",40,0,0],                                     // Team Leader
    ["CUP_B_US_SpecOps_Medic",30,0,0],                                  // Medic
    ["CUP_B_US_Sniper_UCP",70,5,0],                                     // Sniper
    ["CUP_B_US_Sniper_M107_UCP",70,5,0],                                // Sniper (M107)
    ["CUP_B_US_Spotter_UCP",20,0,0],                                    // Spotter
    ["CUP_B_US_Crew_UCP",10,0,0],                                       // Crewman
    ["CUP_B_US_Pilot",10,0,0]                                           // Pilot
];

KPLIB_b_vehLight = [
    ["CUP_B_HMMWV_Unarmed_USA",75,0,50],                                // HMMWV (Unarmed)
    ["CUP_B_HMMWV_M2_USA",75,60,50],                                    // HMMWV M2
    ["CUP_B_HMMWV_MK19_USA",75,80,50],                                  // HMMWV MK19
    ["CUP_B_HMMWV_TOW_USA",75,100,50],                                  // HMMWV TOW
    ["CUP_B_HMMWV_SOV_M2_USA",100,80,50],                               // HMMWV SOV (M2)
    ["CUP_B_HMMWV_SOV_USA",100,100,50],                                 // HMMWV SOV (Mk19)
    ["CUP_B_HMMWV_Avenger_USA",200,350,125],                            // HMMWV Avenger
    ["CUP_B_RG31_M2_OD_USA",150,75,100],                                // RG-31 Nyala M2
    ["CUP_B_RG31_M2_OD_GC_USA",225,75,100],                             // RG-31 Nyala M2 GC
    ["CUP_B_RG31E_M2_OD_USA",200,75,100],                               // RG-31 Mk5E M2
    ["CUP_B_RG31_Mk19_OD_USA",150,100,100],                             // RG-31 Mk.19
    ["CUP_B_MTVR_USA",125,0,75]                                         // MTVR
];

KPLIB_b_vehHeavy = [
    ["CUP_B_M1126_ICV_M2_Woodland_Slat",200,150,125],                   // M1126 ICV M2 CROWS (Woodland - Slat)
    ["CUP_B_M1126_ICV_MK19_Woodland_Slat",200,200,125],                 // M1126 ICV MK19 CROWS (Woodland - Slat)
    ["CUP_B_M1128_MGS_Woodland_Slat",200,500,125],                      // M1128 MGS (Woodland - Slat)
    ["CUP_B_M1135_ATGMV_Woodland_Slat",200,300,125],                    // M1135 ATGMV (Woodland - Slat)
    ["CUP_B_M163_USA",250,600,200],                                     // M163A1 VADS
    ["CUP_B_M6LineBacker_USA_W",350,450,150],                           // M6 Linebacker (Woodland)
    ["CUP_B_M7Bradley_USA_W",300,300,150],                              // M7 Bradley (Woodland)
    ["CUP_B_M2Bradley_USA_W",300,400,150],                              // M2A2 Bradley IFV (Woodland)
    ["CUP_B_M2A3Bradley_USA_W",400,400,150],                            // M2A3 ERA Bradley IFV (Woodland)
    ["CUP_B_M1A1_Woodland_US_Army",500,500,200],                        // M1A1 Abrams (Woodland)
    ["CUP_B_M1A2_TUSK_MG_US_Army",600,550,225],                         // M1A2 Abrams TUSK (Woodland)
    ["CUP_B_M1129_MC_MK19_Woodland_Slat",600,800,400],                  // M1129 MC MK19 CROWS (Woodland - Slat)
    ["CUP_B_M270_HE_USA",600,1250,300],                                 // M270 MLRS (HE)
    ["CUP_B_M270_DPICM_USA",800,1750,400]                               // M270 MLRS (DPICM)
];

KPLIB_b_vehAir = [
    ["CUP_B_UH60M_Unarmed_FFV_MEV_US",300,0,200],                       // UH-60M MEDVAC (Unarmed/FFV)
    ["CUP_B_UH60M_US",300,25,200],                                      // UH-60M
    ["CUP_B_UH60M_FFV_US",300,50,200],                                  // UH-60M (FFV)
    ["USAF_C130J",200,0,250],                                           // C-130J Super Hercules
    ["USAF_C130J_Cargo",200,0,250],                                     // C-130J Super Hercules (Cargo)
    ["USAF_C17",500,0,400],                                             // C-17 Globemaster III
    ["usaf_kc135",600,0,2500],                                          // KC-135 Stratotanker
    ["CUP_B_AH6M_USA",200,100,100],                                     // AH-6M
    ["CUP_B_MH60L_DAP_2x_US",400,250,225],                              // MH-60L DAP (2 Stores)
    ["CUP_B_MH60L_DAP_4x_US",400,500,225],                              // MH-60L DAP (4 Stores)
    ["CUP_B_AH64_DL_USA",500,600,300],                                  // AH-64
    ["CUP_B_AH64D_DL_USA",700,600,200],                                 // AH-64D
    ["CUP_B_AH6X_USA",300,0,100],                                       // AH-6X Littlebird ULB
    ["USAF_RQ4A",500,0,200],                                            // RQ-4A Global Hawk
    ["USAF_MQ9",500,750,200],                                           // MQ-9 Reaper
    ["CUP_B_AC47_Spooky_USA",600,300,400],                              // AC-47D Spooky
    ["CUP_B_A10_DYN_USA",1000,800,400],                                 // A-10A Thunderbolt II
    ["USAF_A10",1500,1000,400],                                         // A-10C Thunderbolt II
    ["USAF_F22",1800,2000,500],                                         // F-22A Raptor
    ["USAF_F22_EWP_AA",1800,2100,500],                                  // F-22A Raptor (EWP-AA)
    ["USAF_F22_EWP_AG",1800,2100,500],                                  // F-22A Raptor (EWP-AG)
    ["USAF_F22_Heavy",1800,2250,500],                                   // F-22A Raptor (Heavy)
    ["USAF_F35A_STEALTH",2250,2000,750],                                // F-35A Lightning II
    ["USAF_F35A",2250,2250,750],                                        // F-35A Lightning II (Heavy)
    ["CUP_B_AH6X_USA",300,0,100]                                        // AH-6X Littlebird ULB
];

KPLIB_b_vehStatic = [
    ["CUP_B_M2StaticMG_US",25,40,0],                                    // M2 Machine Gun
    ["CUP_B_M2StaticMG_MiniTripod_US",25,40,0],                         // M2 Minitripod
    ["CUP_B_TOW_TriPod_US",50,100,0],                                   // TOW Tripod
    ["CUP_WV_B_CRAM",500,500,0],                                        // C-RAM
    ["CUP_WV_B_SS_Launcher",750,500,0],                                 // Mk-29 GMLS
    ["CUP_WV_B_RAM_Launcher",750,750,0],                                // Mk-49 GMLS
    ["B_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["CUP_B_M252_US",80,150,0],                                         // M252 81mm Mortar
    ["CUP_B_M119_US",100,200,0]                                         // M119
];

KPLIB_b_objectsDeco = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["FlagCarrierUSArmy_EP1",0,0,0],
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
    ["Land_HelipadCircle_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["Land_HelipadRescue_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
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

KPLIB_b_vehSupport = [
    [KPLIB_b_arsenal,100,200,0],
    [KPLIB_b_mobileRespawn,200,0,100],
    [KPLIB_b_fobBox,300,500,0],
    [KPLIB_b_fobTruck,300,500,75],
    [KPLIB_b_smallStorage,0,0,0],
    [KPLIB_b_largeStorage,0,0,0],
    [KPLIB_b_logiStation,250,0,0],
    [KPLIB_b_airControl,1000,0,0],
    [KPLIB_b_slotHeli,250,0,0],
    [KPLIB_b_slotPlane,500,0,0],
    ["ACE_medicalSupplyCrate_advanced",50,0,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["USAF_missileCart_W_AGM114",50,150,0],                             // Missile Cart (AGM-114)
    ["USAF_missileCart_AGMMix",50,150,0],                               // Missile Cart (AGM-65 Mix)
    ["USAF_missileCart_AGM1",50,150,0],                                 // Missile Cart (AGM-65D)
    ["USAF_missileCart_AGM2",50,150,0],                                 // Missile Cart (AGM-65E)
    ["USAF_missileCart_AGM3",50,150,0],                                 // Missile Cart (AGM-65K)
    ["USAF_missileCart_AA1",50,150,0],                                  // Missile Cart (AIM-9M/AIM-120)
    ["USAF_missileCart_AA2",50,150,0],                                  // Missile Cart (AIM-9X/AIM-120)
    ["USAF_missileCart_GBU12_green",50,150,0],                          // Missile Cart (GBU12 Green)
    ["USAF_missileCart_GBU12_maritime",50,150,0],                       // Missile Cart (GBU12 Maritime)
    ["USAF_missileCart_GBU12",50,150,0],                                // Missile Cart (GBU12)
    ["USAF_missileCart_Gbu31",50,150,0],                                // Missile Cart (GBU31)
    ["USAF_missileCart_GBU39",50,150,0],                                // Missile Cart (GBU39)
    ["USAF_missileCart_Mk82",50,150,0],                                 // Missile Cart (Mk82)
    ["CUP_B_TowingTractor_USA",50,0,75],                                // Towing Tractor
    ["CUP_B_MTVR_Repair_USMC",425,0,75],                                // MTVR Repair
    ["CUP_B_MTVR_Refuel_USMC",125,0,375],                               // MTVR Refuel
    ["CUP_B_MTVR_Ammo_USMC",125,300,75],                                // MTVR Ammo
    ["B_Slingload_01_Repair_F",375,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,300],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,300,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
KPLIB_b_squadLight = [
    "CUP_B_US_Soldier_SL_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_LAT_UCP",
    "CUP_B_US_Soldier_GL_UCP",
    "CUP_B_US_Soldier_AR_UCP",
    "CUP_B_US_Soldier_AR_UCP",
    "CUP_B_US_Soldier_Marksman_UCP",
    "CUP_B_US_Medic_UCP",
    "CUP_B_US_Engineer_UCP"
];

// Heavy infantry squad.
KPLIB_b_squadInf = [
    "CUP_B_US_Soldier_SL_UCP",
    "CUP_B_US_Soldier_LAT_UCP",
    "CUP_B_US_Soldier_LAT_UCP",
    "CUP_B_US_Soldier_GL_UCP",
    "CUP_B_US_Soldier_AR_UCP",
    "CUP_B_US_Soldier_AR_UCP",
    "CUP_B_US_Soldier_MG_UCP",
    "CUP_B_US_Soldier_Marksman_UCP",
    "CUP_B_US_Medic_UCP",
    "CUP_B_US_Engineer_UCP"
];

// AT specialists squad.
KPLIB_b_squadAT = [
    "CUP_B_US_Soldier_SL_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_HAT_UCP",
    "CUP_B_US_Soldier_AT_UCP",
    "CUP_B_US_Soldier_AT_UCP",
    "CUP_B_US_Medic_UCP",
    "CUP_B_US_Soldier_UCP"
];

// AA specialists squad.
KPLIB_b_squadAA = [
    "CUP_B_US_Soldier_SL_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_AA_UCP",
    "CUP_B_US_Soldier_AA_UCP",
    "CUP_B_US_Soldier_AA_UCP",
    "CUP_B_US_Medic_UCP",
    "CUP_B_US_Soldier_UCP"
];

// Force recon squad.
KPLIB_b_squadRecon = [
    "CUP_B_US_SpecOps_TL",
    "CUP_B_US_SpecOps",
    "CUP_B_US_SpecOps_Assault",
    "CUP_B_US_SpecOps_MG",
    "CUP_B_US_SpecOps_JTAC",
    "CUP_B_US_SpecOps_M14",
    "CUP_B_US_SpecOps_M",
    "CUP_B_US_SpecOps_M",
    "CUP_B_US_SpecOps_Medic",
    "CUP_B_US_SpecOps_UAV"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
KPLIB_b_squadPara = [
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP",
    "CUP_B_US_Soldier_UCP"
];

/*
    --- Vehicles to unlock ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
KPLIB_b_vehToUnlock = [
    "CUP_WV_B_CRAM",                                                    // C-RAM
    "CUP_WV_B_SS_Launcher",                                             // Mk-29 GMLS
    "CUP_WV_B_RAM_Launcher",                                            // Mk-49 GMLS
    "CUP_B_A10_DYN_USA",                                                // A-10A Thunderbolt II
    "USAF_MQ9",                                                         // MQ-9 Reaper
    "USAF_A10",                                                         // A-10C Thunderbolt II
    "USAF_F22",                                                         // F-22A Raptor
    "USAF_F22_EWP_AA",                                                  // F-22A Raptor (EWP-AA)
    "USAF_F22_EWP_AG",                                                  // F-22A Raptor (EWP-AG)
    "USAF_F22_Heavy",                                                   // F-22A Raptor (Heavy)
    "USAF_F35A_STEALTH",                                                // F-35A Lightning II
    "USAF_F35A",                                                        // F-35A Lightning II (Heavy)
    "CUP_B_AH64D_DL_USA",                                               // AH-64D
    "CUP_B_MH60L_DAP_2x_US",                                            // MH-60L DAP (2 Stores)
    "CUP_B_MH60L_DAP_4x_US",                                            // MH-60L DAP (4 Stores)
    "CUP_B_M1A1_Woodland_US_Army",                                      // M1A1 Abrams (Woodland)
    "CUP_B_M1A2_TUSK_MG_US_Army",                                       // M1A2 Abrams TUSK (Woodland)
    "CUP_B_M270_HE_USA",                                                // M270 MLRS (HE)
    "CUP_B_M270_DPICM_USA",                                             // M270 MLRS (DPICM)
    "CUP_B_M6LineBacker_USA_W",                                         // M6 Linebacker (Woodland)
    "CUP_B_M163_USA",                                                   // M163A1 VADS
    "CUP_B_M1128_MGS_Woodland_Slat",                                    // M1128 MGS (Woodland - Slat)
    "CUP_B_M1135_ATGMV_Woodland_Slat",                                  // M1135 ATGMV (Woodland - Slat)
    "CUP_B_M1129_MC_MK19_Woodland_Slat",                                // M1129 MC MK19 CROWS (Woodland - Slat)
    "CUP_B_M2A3Bradley_USA_W",                                          // M2A3 ERA Bradley IFV (Woodland)
    "CUP_B_M119_US",                                                    // M119
    "CUP_B_RG31E_M2_USA",                                               // RG-31 Mk5E M2
    "CUP_B_RG31_Mk19_USA"                                               // RG-31 Mk.19
];
