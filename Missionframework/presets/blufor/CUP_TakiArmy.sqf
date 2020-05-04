/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V3_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "CUP_O_BMP_HQ_TKA";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_O_M113_Med_TKA";                          // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_O_MI6A_TKA";                                      // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_O_TK_Crew";                                    // This defines the crew for vehicles.
pilot_classname = "CUP_O_TK_Pilot";                                     // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "CUP_O_UH1H_slick_TKA";           // These are the little birds which spawn on the Freedom or at Chimera bas
KP_liberation_boat_classname = "O_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_O_Ural_Open_TKA";                  // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "O_Radar_System_02_F";             // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";             // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                       // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";                      // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                     // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
    ["CUP_O_TK_Soldier",15,0,0],                                        // Rifleman
    ["CUP_O_TK_Soldier_Backpack",20,0,0],                               // Rifleman (backpack)
    ["CUP_O_TK_Soldier_AT",30,0,0],                                     // Rifleman (RPG-7)
    ["CUP_O_TK_Soldier_GL",25,0,0],                                     // Grenadier
    ["CUP_O_TK_Soldier_AR",25,0,0],                                     // Automatic Rifleman
    ["CUP_O_TK_Soldier_MG",35,0,0],                                     // Machinegunner
    ["CUP_O_TK_Soldier_M",30,0,0],                                      // Marksman
    ["CUP_O_TK_Soldier_HAT",50,10,0],                                   // AT Specialist
    ["CUP_O_TK_Soldier_AA",50,10,0],                                    // AA Specialist
    ["CUP_O_TK_Medic",30,0,0],                                          // Medic
    ["CUP_O_TK_Engineer",30,0,0],                                       // Engineer
    ["CUP_O_TK_SpecOps_TL",30,0,0],                                     // Special Team Leader
    ["CUP_O_TK_SpecOps",30,0,0],                                        // Special Soldier
    ["CUP_O_TK_SpecOps_MG",40,0,0],                                     // Special Machinegunner
    ["CUP_O_TK_Sniper",70,5,0],                                         // Sniper
    ["CUP_O_TK_Sniper_KSVK",70,5,0],                                    // Sniper (KSVK)
    ["CUP_O_TK_Sniper_SVD_Night",70,5,0],                               // Sniper (night)
    ["CUP_O_TK_Spotter",20,0,0],                                        // Spotter
    ["CUP_O_TK_Crew",10,0,0],                                           // Crewman
    ["CUP_O_TK_Pilot",10,0,0]                                           // Pilot
];

light_vehicles = [
    ["CUP_O_Hilux_unarmed_TK_INS",50,0,50],                             // Hilux
    ["CUP_O_Hilux_M2_TK_INS",50,60,50],                                 // Hilux (M2)
    ["CUP_O_Hilux_DSHKM_TK_INS",50,60,50],                              // Hilux (DShKM)
    ["CUP_O_Hilux_AGS30_TK_INS",50,80,50],                              // Hilux (AGS-30)
    ["CUP_O_Hilux_SPG9_TK_INS",50,100,50],                              // Hilux (SPG-9)
    ["CUP_O_Hilux_metis_TK_INS",50,120,50],                             // Hilux (Metis)
    ["CUP_O_Hilux_UB32_TK_INS",75,250,50],                              // Hilux (UB-32)
    ["CUP_O_LR_Ambulance_TKA",75,0,50],                                 // Land Rover 110 (Ambulance)
    ["CUP_O_LR_Transport_TKA",75,0,50],                                 // Land Rover 110 (Transport)
    ["CUP_O_LR_MG_TKA",100,50,50],                                      // Land Rover 110 (M2)
    ["CUP_O_LR_SPG9_TKA",100,90,50],                                    // Land Rover 110 (SPG-9)
    ["CUP_O_UAZ_Unarmed_TKA",100,0,50],                                 // UAZ
    ["CUP_O_UAZ_MG_TKA",125,60,50],                                     // UAZ (DShKM)
    ["CUP_O_UAZ_AGS30_TKA",125,80,50],                                  // UAZ (AGS-30)
    ["CUP_O_UAZ_SPG9_TKA",125,100,50],                                  // UAZ (SPG-9)
    ["CUP_O_UAZ_METIS_TKA",150,120,50],                                 // UAZ (Metis-M)
    ["CUP_O_LR_AA_TKA",200,160,50],                                     // Land Rover 110 (AA)
    ["CUP_O_Ural_ZU23_TKA",250,300,100],                                // Ural (ZU-23)
    ["CUP_O_BM21_TKA",300,750,100],                                     // BM-21
    ["CUP_O_Ural_Open_TKA",150,0,75],                                   // Ural (Open)
    ["CUP_O_Ural_TKA",150,0,75]                                         // Ural
];

heavy_vehicles = [
    ["CUP_O_Hilux_armored_zu23_TK_INS",100,150,75],                     // Hilux Armored (ZU-23-2)
    ["CUP_O_Hilux_armored_BTR60_TK_INS",100,200,75],                    // Hilux Armored (BTR-60)
    ["CUP_O_Hilux_armored_BMP1_TK_INS",100,350,75],                     // Hilux Armored (BMP-1)
    ["CUP_O_BTR40_TKA",150,0,100],                                      // BTR-40 (Unarmed)
    ["CUP_O_BTR40_MG_TKA",150,60,100],                                  // BTR-40 (DSHKM)
    ["CUP_O_BRDM2_TKA",200,200,150],                                    // BRDM-2
    ["CUP_O_BRDM2_ATGM_TKA",200,400,150],                               // BRDM-2 (ATGM)
    ["CUP_O_BTR60_TKA",300,200,200],                                    // BTR-60PB
    ["CUP_O_BTR80_TKA",400,300,200],                                    // BTR-80
    ["CUP_O_BTR80A_TKA",425,500,200],                                   // BTR-80A
    ["CUP_O_MTLB_pk_TKA",175,50,100],                                   // MT-LB LV
    ["CUP_O_M113_TKA",200,100,100],                                     // M113
    ["CUP_O_BMP1_TKA",300,400,200],                                     // BMP-1
    ["CUP_O_BMP1P_TKA",350,450,200],                                    // BMP-1P
    ["CUP_O_BMP2_TKA",500,600,200],                                     // BMP-2
    ["CUP_O_BMP2_ZU_TKA",300,300,200],                                  // BMP-2 ZU-23
    ["CUP_O_ZSU23_Afghan_TKA",350,500,200],                             // ZSU-23-4 Afghanski
    ["CUP_O_ZSU23_TKA",500,500,200],                                    // ZSU-23-4
    ["CUP_O_T55_TKA",500,350,250],                                      // T-55
    ["CUP_O_T72_TKA",700,500,300]                                       // T-72
];

air_vehicles = [
    ["CUP_O_UH1H_armed_TKA",400,250,250],                               // UH-1H (Armed)
    ["CUP_O_UH1H_gunship_TKA",500,350,250],                             // UH-1H (Gunship)
    ["CUP_O_Mi17_TK",500,350,300],                                      // Mi-8MT
    ["CUP_O_Mi24_D_Dynamic_TK",600,650,300],                            // Mi-24D
    ["CUP_O_C130J_TKA",200,0,250],                                      // C-130J
    ["CUP_O_C130J_Cargo_TKA",200,0,250],                                // C-130J (VIV)
    ["CUP_O_L39_TK",800,750,350],                                       // L-39ZA
    ["CUP_O_Su25_Dyn_TKA",1000,850,400]                                 // Su-25 Frogfoot
];

static_vehicles = [
    ["CUP_O_KORD_high_TK",25,40,0],                                     // KORD
    ["CUP_O_KORD_TK",25,40,0],                                          // KORD Minitripod
    ["CUP_O_AGS_TK",25,60,0],                                           // AGS-30
    ["CUP_O_Igla_AA_pod_TK",100,200,0],                                 // Igla AA Pod
    ["CUP_O_ZU23_TK",100,300,0],                                        // ZU-23
    ["CUP_O_2b14_82mm_TK",80,150,0],                                    // Podnos 2B14
    ["CUP_O_D30_AT_TK",100,200,0],                                      // D-30 AT
    ["CUP_O_D30_TK",200,250,0]                                          // D-30
];

buildings = [
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
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["CUP_O_Tractor_Old_TKA",50,0,75],                                  // Towing Tractor
    ["CUP_O_Ural_Repair_TKA",425,0,75],                                 // Ural (Repair)
    ["CUP_O_Ural_Refuel_TKA",125,0,375],                                // Ural (Refuel)
    ["CUP_O_Ural_Reammo_TKA",125,300,75],                               // Ural (Ammo)
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
blufor_squad_inf_light = [
    "CUP_O_TK_Soldier_SL",
    "CUP_O_TK_Soldier",
    "CUP_O_TK_Soldier",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_GL",
    "CUP_O_TK_Soldier_AR",
    "CUP_O_TK_Soldier_AR",
    "CUP_O_TK_Soldier_M",
    "CUP_O_TK_Medic",
    "CUP_O_TK_Engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_O_TK_Soldier_SL",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_GL",
    "CUP_O_TK_Soldier_AR",
    "CUP_O_TK_Soldier_AR",
    "CUP_O_TK_Soldier_MG",
    "CUP_O_TK_Soldier_M",
    "CUP_O_TK_Medic",
    "CUP_O_TK_Engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_O_TK_Soldier_SL",
    "CUP_O_TK_Soldier_AAT",
    "CUP_O_TK_Soldier_AAT",
    "CUP_O_TK_Soldier_AT",
    "CUP_O_TK_Soldier_AT",
    "CUP_O_TK_Soldier_HAT",
    "CUP_O_TK_Medic",
    "CUP_O_TK_Engineer"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_O_TK_Soldier_SL",
    "CUP_O_TK_Soldier_Backpack",
    "CUP_O_TK_Soldier_Backpack",
    "CUP_O_TK_Soldier_AA",
    "CUP_O_TK_Soldier_AA",
    "CUP_O_TK_Soldier_AA",
    "CUP_O_TK_Medic",
    "CUP_O_TK_Engineer"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_O_TK_SpecOps_TL",
    "CUP_O_TK_SpecOps",
    "CUP_O_TK_SpecOps",
    "CUP_O_TK_SpecOps",
    "CUP_O_TK_SpecOps_MG",
    "CUP_O_TK_SpecOps_MG",
    "CUP_O_TK_SpecOps_MG"
];

// Paratroopers squad.
blufor_squad_para = [
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT",
    "CUP_O_TK_Soldier_LAT"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_O_BTR60_TKA",                                                  // BTR-60 PB
    "CUP_O_BM21_TKA",                                                   // BM-21
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_ZSU23_Afghan_TKA",                                           // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_TKA",                                                  // ZSU-23-4
    "CUP_O_T72_TKA",                                                    // T-72
    "CUP_O_BTR80_TKA",                                                  // BTR-80
    "CUP_O_BTR80A_TKA",                                                 // BTR-80A
    "CUP_O_BRDM2_ATGM_TKA",                                             // BRDM-2 (ATGM)
    "CUP_O_Mi24_D_Dynamic_TK",                                          // Mi-24D
    "CUP_O_L39_TK",                                                     // L-39ZA
    "CUP_O_Su25_Dyn_TKA",                                               // Su-25 Frogfoot
    "CUP_O_Hilux_UB32_TK_INS",                                          // Hilux (UB-32)
    "CUP_O_D30_TKA"                                                     // D-30
];
