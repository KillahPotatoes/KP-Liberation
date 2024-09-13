/*
    File: cup_chdkz.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2020-04-21
    Last Update: 2020-09-27
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP ChDKZ player preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
KPLIB_b_fobBuilding = "Land_Cargo_HQ_V3_F";                             // This is the main FOB HQ building.
KPLIB_b_fobBox = "B_Slingload_01_Cargo_F";                              // This is the FOB as a container.
KPLIB_b_fobTruck = "CUP_O_BMP_HQ_CHDKZ";                                // This is the FOB as a vehicle.
KPLIB_b_arsenal = "B_supplyCrate_F";                                    // This is the virtual arsenal as portable supply crates.
KPLIB_b_mobileRespawn = "CUP_O_BMP2_AMB_CHDKZ";                         // This is the mobile respawn (and medical) truck.
KPLIB_b_potato01 = "CUP_O_MI6A_CHDKZ";                                  // This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIB_b_crewUnit = "CUP_O_INS_Crew";                                    // This defines the crew for vehicles.
KPLIB_b_heliPilotUnit = "CUP_O_INS_Pilot";                              // This defines the pilot for helicopters.
KPLIB_b_addHeli = "CUP_O_Mi8_medevac_CHDKZ";                            // These are the additional helicopters which spawn on the Freedom or at Chimera bas
KPLIB_b_addBoat = "O_Boat_Transport_01_F";                              // These are the boats which spawn at the stern of the Freedom.
KPLIB_b_logiTruck = "CUP_O_Ural_Open_CHDKZ";                            // These are the trucks which are used in the logistic convoy system.
KPLIB_b_smallStorage = "ContainmentArea_02_sand_F";                     // A small storage area for resources.
KPLIB_b_largeStorage = "ContainmentArea_01_sand_F";                     // A large storage area for resources.
KPLIB_b_logiStation = "Land_RepairDepot_01_tan_F";                      // The building defined to unlock FOB recycling functionality.
KPLIB_b_airControl = "O_Radar_System_02_F";                             // The building defined to unlock FOB air vehicle functionality.
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
    ["CUP_O_INS_Soldier",20,0,0],                                       // Rifleman
    ["CUP_O_INS_Soldier_LAT",30,0,0],                                   // Rifleman (RPG-18)
    ["CUP_O_INS_Soldier_GL",25,0,0],                                    // Grenadier
    ["CUP_O_INS_Soldier_AR",25,0,0],                                    // Autorifleman
    ["CUP_O_INS_Soldier_MG",35,0,0],                                    // Machine Gunner
    ["CUP_O_INS_Soldier_Ammo",35,0,0],                                  // Ammo Bearer
    ["CUP_O_INS_Soldier_AT",50,25,0],                                   // AT Specialist
    ["CUP_O_INS_Soldier_AA",50,10,0],                                   // AA Specialist
    ["CUP_O_INS_Medic",30,0,0],                                         // Medic
    ["CUP_O_INS_Soldier_Engineer",30,0,0],                              // Engineer
    ["CUP_O_INS_Villager3",10,0,0],                                     // Farmer
    ["CUP_O_INS_Woodlander3",10,0,0],                                   // Forester
    ["CUP_O_INS_Woodlander2",10,0,0],                                   // Gamekeeper
    ["CUP_O_INS_Worker2",10,0,0],                                       // Local
    ["CUP_O_INS_Villager4",10,0,0],                                     // Villager
    ["CUP_O_INS_Woodlander1",10,0,0],                                   // Woodman
    ["CUP_O_INS_Sniper",70,5,0],                                        // Sniper
    ["CUP_O_INS_Crew",10,0,0],                                          // Crewman
    ["CUP_O_INS_Pilot",10,0,0]                                          // Pilot
];

KPLIB_b_vehLight = [
    ["CUP_O_TT650_CHDKZ",25,0,10],                                      // TT650
    ["CUP_O_Datsun_4seat",50,0,25],                                     // Datsun 620 Pickup Woodland
    ["CUP_O_Datsun_PK",50,10,25],                                       // Datsun 620 Pickup (PK)
    ["CUP_O_Datsun_AA",75,150,25],                                      // Datsun 620 Pickup (AA)
    ["CUP_O_UAZ_Unarmed_CHDKZ",100,0,50],                               // UAZ-469
    ["CUP_O_UAZ_MG_CHDKZ",125,60,50],                                   // UAZ-469 (DShKM)
    ["CUP_O_UAZ_AGS30_CHDKZ",125,80,50],                                // UAZ-469 (AGS-30)
    ["CUP_O_UAZ_SPG9_CHDKZ",125,100,50],                                // UAZ-469 (SPG-9)
    ["CUP_O_UAZ_METIS_CHDKZ",150,120,50],                               // UAZ-469 (Metis-M)
    ["CUP_O_UAZ_AA_CHDKZ",200,160,50],                                  // UAZ-469 (AA)
    ["CUP_O_Ural_ZU23_CHDKZ",250,300,100],                              // Ural (ZU-23)
    ["CUP_O_BM21_CHDKZ",300,750,100],                                   // BM-21
    ["CUP_O_Ural_Open_CHDKZ",150,0,75],                                 // Ural (Open)
    ["CUP_O_Ural_CHDKZ",150,0,75]                                       // Ural
];

KPLIB_b_vehHeavy = [
    ["CUP_O_BRDM2_CHDKZ",200,200,150],                                  // BRDM-2
    ["CUP_O_BRDM2_ATGM_CHDKZ",200,400,150],                             // BRDM-2 (ATGM)
    ["CUP_O_BTR60_CHDKZ",300,200,200],                                  // BTR-60PB
    ["CUP_O_BTR80_CHDKZ",400,300,200],                                  // BTR-80
    ["CUP_O_BTR80A_CHDKZ",425,500,200],                                 // BTR-80A
    ["CUP_O_MTLB_pk_CHDKZ",175,50,100],                                 // MT-LB LV
    ["CUP_O_BMP2_CHDKZ",500,600,200],                                   // BMP-2
    ["CUP_O_ZSU23_Afghan_CHDKZ",350,500,200],                           // ZSU-23-4 Afghanski
    ["CUP_O_ZSU23_CHDKZ",500,500,200],                                  // ZSU-23-4
    ["CUP_O_T55_CHDKZ",500,350,250],                                    // T-55
    ["CUP_O_T72_CHDKZ",700,500,300]                                     // T-72
];

KPLIB_b_vehAir = [
    ["CUP_O_Mi8_CHDKZ",400,100,400]                                     // Mi-8MT
];

KPLIB_b_vehStatic = [
    ["CUP_O_SearchLight_static_ChDKZ",10,0,0],                          // Search Light
    ["CUP_O_DSHKM_ChDKZ",25,40,0],                                      // DShKM
    ["CUP_O_DSHkM_MiniTripod_ChDKZ",25,40,0],                           // DShKM Minitripod
    ["CUP_O_AGS_ChDKZ",25,60,0],                                        // AGS-30
    ["CUP_O_SPG9_ChDKZ",50,100,0],                                      // SPG-9
    ["CUP_O_Igla_AA_pod_ChDKZ",100,200,0],                              // Igla AA Pod
    ["CUP_O_ZU23_ChDKZ",100,300,0],                                     // ZU-23
    ["CUP_O_2b14_82mm_ChDKZ",80,150,0],                                 // Podnos 2B14
    ["CUP_O_D30_AT_ChDKZ",100,200,0],                                   // D-30 AT
    ["CUP_O_D30_ChDKZ",200,250,0]                                       // D-30
];

KPLIB_b_objectsDeco = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["FlagCarrierINS",0,0,0],
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
    ["CUP_O_Tractor_Old_CHDKZ",50,0,75],                                // Towing Tractor
    ["CUP_O_Ural_Repair_CHDKZ",425,0,75],                               // Ural (Repair)
    ["CUP_O_Ural_Refuel_CHDKZ",125,0,375],                              // Ural (Refuel)
    ["CUP_O_Ural_Reammo_CHDKZ",125,300,75],                             // Ural (Ammo)
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
    "CUP_O_INS_Officer",
    "CUP_O_INS_Woodlander3",
    "CUP_O_INS_Worker2",
    "CUP_O_INS_Woodlander1",
    "CUP_O_INS_Soldier_GL",
    "CUP_O_INS_Soldier_AR",
    "CUP_O_INS_Woodlander2",
    "CUP_O_INS_Villager3",
    "CUP_O_INS_Medic",
    "CUP_O_INS_Soldier_LAT"
];

// Heavy infantry squad.
KPLIB_b_squadInf = [
    "CUP_O_INS_Officer",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_GL",
    "CUP_O_INS_Soldier_AR",
    "CUP_O_INS_Soldier_AR",
    "CUP_O_INS_Soldier_MG",
    "CUP_O_INS_Sniper",
    "CUP_O_INS_Medic",
    "CUP_O_INS_Soldier_Engineer"
];

// AT specialists squad.
KPLIB_b_squadAT = [
    "CUP_O_INS_Officer",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_AT",
    "CUP_O_INS_Soldier_AT",
    "CUP_O_INS_Soldier_AT",
    "CUP_O_INS_Medic",
    "CUP_O_INS_Soldier_Engineer"
];

// AA specialists squad.
KPLIB_b_squadAA = [
    "CUP_O_INS_Officer",
    "CUP_O_INS_Soldier",
    "CUP_O_INS_Soldier",
    "CUP_O_INS_Soldier_AA",
    "CUP_O_INS_Soldier_AA",
    "CUP_O_INS_Soldier_AA",
    "CUP_O_INS_Medic",
    "CUP_O_INS_Soldier_Engineer"
];

// Force recon squad.
KPLIB_b_squadRecon = [
    "CUP_O_RUS_Soldier_TL",
    "CUP_O_RUS_SpecOps_Scout",
    "CUP_O_RUS_SpecOps_Night",
    "CUP_O_RUS_SpecOps_Night",
    "CUP_O_RUS_Soldier_GL",
    "CUP_O_RUS_Soldier_GL",
    "CUP_O_RUS_Soldier_Marksman",
    "CUP_O_RUS_SpecOps",
    "CUP_O_RUS_Saboteur"
];

// Paratroopers squad.
KPLIB_b_squadPara = [
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT",
    "CUP_O_INS_Soldier_LAT"
];

/*
    --- Vehicles to unlock ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
KPLIB_b_vehToUnlock = [
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60 PB
    "CUP_O_BM21_CHDKZ",                                                 // BM-21
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_ZSU23_Afghan_CHDKZ",                                         // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_CHDKZ",                                                // ZSU-23-4
    "CUP_O_T72_CHDKZ",                                                  // T-72
    "CUP_O_BTR80_CHDKZ",                                                // BTR-80
    "CUP_O_BTR80A_CHDKZ",                                               // BTR-80A
    "CUP_O_BRDM2_ATGM_CHDKZ",                                           // BRDM-2 (ATGM)
    "CUP_O_D30_ChDKZ"                                                   // D-30
];
