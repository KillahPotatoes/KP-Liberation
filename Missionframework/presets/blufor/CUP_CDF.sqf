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
FOB_truck_typename = "B_Truck_01_box_F";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_B_BMP2_AMB_CDF";                          // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_B_MI6A_CDF";                                      // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_B_CDF_Crew_FST";                               // This defines the crew for vehicles.
pilot_classname = "CUP_B_CDF_Pilot_FST";                                // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "B_Heli_Light_01_F";              // These are the little birds which spawn on the Freedom or at Chimera bas
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_B_Ural_Open_CDF";                  // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "B_Radar_System_01_F";             // The building defined to unlock FOB air vehicle functionality.
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
    ["CUP_B_CDF_Soldier_FST",20,0,0],                                   // Rifleman
    ["CUP_B_CDF_Soldier_RPG18_FST",30,0,0],                             // Rifleman (RPG-18)
    ["CUP_B_CDF_Soldier_GL_FST",25,0,0],                                // Grenadier
    ["CUP_B_CDF_Soldier_AR_FST",25,0,0],                                // Automatic Rifleman
    ["CUP_B_CDF_Soldier_MG_FST",35,0,0],                                // Machinegunner
    ["CUP_B_CDF_Soldier_AMG_FST",35,0,0],                               // Asst. Machinegunner
    ["CUP_B_CDF_Soldier_Marksman_FST",30,0,0],                          // Marksman
    ["CUP_B_CDF_Soldier_LAT_FST",50,25,0],                              // AT Specialist
    ["CUP_B_CDF_Soldier_AAT_FST",50,10,0],                              // Asst. AT Specialist
    ["CUP_B_CDF_Soldier_AA_FST",50,10,0],                               // AA Specialist
    ["CUP_B_CDF_Medic_FST",30,0,0],                                     // Medic
    ["CUP_B_CDF_Engineer_FST",30,0,0],                                  // Engineer
    ["CUP_B_CDF_Soldier_MNT",20,0,0],                                   // Rifleman
    ["CUP_B_CDF_Soldier_RPG18_MNT",30,0,0],                             // Rifleman (RPG-18 - TTsko Mountain)
    ["CUP_B_CDF_Soldier_Marksman_MNT",30,0,0],                          // Marksman
    ["CUP_B_CDF_Sniper_MNT",40,0,0],                                    // Sniper
    ["CUP_B_CDF_Medic_MNT",30,0,0],                                     // Medic
    ["CUP_B_CDF_Engineer_MNT",30,0,0],                                  // Engineer
    ["CUP_B_CDF_Sniper_FST",70,5,0],                                    // Sniper
    ["CUP_B_CDF_Spotter_FST",20,0,0],                                   // Spotter
    ["CUP_B_CDF_Crew_FST",10,0,0],                                      // Crewman
    ["CUP_B_CDF_Pilot_FST",10,0,0]                                      // Pilot
];

light_vehicles = [
    ["CUP_B_S1203_Ambulance_CDF",75,0,50],                              // Škoda S1203 (Ambulance)
    ["CUP_B_UAZ_Unarmed_CDF",75,0,50],                                  // UAZ
    ["CUP_B_UAZ_MG_CDF",100,60,50],                                     // UAZ (DShKM)
    ["CUP_B_UAZ_AGS30_CDF",100,80,50],                                  // UAZ (AGS-30)
    ["CUP_B_UAZ_SPG9_CDF",100,100,50],                                  // UAZ (SPG-9)
    ["CUP_B_UAZ_METIS_CDF",100,120,50],                                 // UAZ (Metis-M)
    ["CUP_B_UAZ_AA_CDF",100,160,50],                                    // UAZ (AA)
    ["CUP_B_Ural_ZU23_CDF",150,300,100],                                // Ural (ZU-23)
    ["CUP_B_BM21_CDF",225,750,100],                                     // BM-21
    ["CUP_B_Kamaz_CDF",125,0,75],                                       // Kamaz 5350
    ["CUP_B_Kamaz_Open_CDF",125,0,75],                                  // Kamaz 5350 (Open)
    ["CUP_B_Ural_Open_CDF",125,0,75],                                   // Ural (Open)
    ["CUP_B_Ural_CDF",125,0,75]                                         // Ural
];

heavy_vehicles = [
    ["CUP_B_BRDM2_CDF",200,200,125],                                    // BRDM-2
    ["CUP_B_BRDM2_ATGM_CDF",200,400,125],                               // BRDM-2 (ATGM)
    ["CUP_B_BTR60_CDF",300,200,125],                                    // BTR-60PB
    ["CUP_B_BTR80_CDF",400,200,150],                                    // BTR-80
    ["CUP_B_BTR80A_CDF",450,300,150],                                   // BTR-80A
    ["CUP_B_MTLB_pk_CDF",150,50,100],                                   // MT-LB LV
    ["CUP_B_BMP2_CDF",500,400,200],                                     // BMP-2
    ["CUP_B_ZSU23_Afghan_CDF",350,350,200],                             // ZSU-23-4 Afghanski
    ["CUP_B_ZSU23_CDF",450,350,200],                                    // ZSU-23-4
    ["CUP_B_T72_CDF",600,500,250]                                       // T-72
];

air_vehicles = [
    ["CUP_B_Mi17_CDF",300,100,300],                                     // Mi-8MT
    ["CUP_B_Pchela1T_CDF",100,0,50],                                    // Pchela-1T
    ["CUP_B_Mi24_D_Dynamic_CDF",700,600,300],                           // Mi-24D
    ["CUP_B_Su25_Dyn_CDF",1000,800,400],                                // Su-25 Frogfoot
    ["CUP_B_SU34_CDF",1200,1000,500]                                    // Su-34
];

static_vehicles = [
    ["CUP_B_DSHKM_CDF",25,40,0],                                        // DShKM
    ["CUP_B_DSHkM_MiniTripod_CDF",25,40,0],                             // DShKM Minitripod
    ["CUP_B_AGS_CDF",25,60,0],                                          // AGS-30
    ["CUP_B_SPG9_CDF",50,100,0],                                        // SPG-9
    ["CUP_B_Igla_AA_pod_CDF",100,200,0],                                // Igla AA Pod
    ["CUP_B_ZU23_CDF",100,300,0],                                       // ZU-23
    ["B_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["CUP_B_2b14_82mm_CDF",80,150,0],                                   // Podnos 2B14
    ["CUP_B_D30_AT_CDF",100,200,0],                                     // D-30 AT
    ["CUP_B_D30_CDF",200,250,0]                                         // D-30
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["FlagCarrierCDFEnsign_EP1",0,0,0],
    ["FlagCarrierCDF",0,0,0],
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
    ["CUP_B_Tractor_CDF",50,0,75],                                      // Towing Tractor
    ["CUP_B_Kamaz_Repair_CDF",425,0,75],                                // Kamaz 5350 (Repair)
    ["CUP_B_Kamaz_Refuel_CDF",125,0,375],                               // Kamaz 5350 (Fuel)
    ["CUP_B_Kamaz_Reammo_CDF",125,300,75],                              // Kamaz 5350 (Ammo)
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
    "CUP_B_CDF_Soldier_TL_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_RPG18_FST",
    "CUP_B_CDF_Soldier_GL_FST",
    "CUP_B_CDF_Soldier_AR_FST",
    "CUP_B_CDF_Soldier_AR_FST",
    "CUP_B_CDF_Soldier_Marksman_FST",
    "CUP_B_CDF_Medic_FST",
    "CUP_B_CDF_Engineer_FST"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_B_CDF_Soldier_TL_FST",
    "CUP_B_CDF_Soldier_RPG18_FST",
    "CUP_B_CDF_Soldier_RPG18_FST",
    "CUP_B_CDF_Soldier_GL_FST",
    "CUP_B_CDF_Soldier_AR_FST",
    "CUP_B_CDF_Soldier_AR_FST",
    "CUP_B_CDF_Soldier_MG_FST",
    "CUP_B_CDF_Soldier_Marksman_FST",
    "CUP_B_CDF_Medic_FST",
    "CUP_B_CDF_Engineer_FST"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_B_CDF_Soldier_TL_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_LAT_FST",
    "CUP_B_CDF_Soldier_LAT_FST",
    "CUP_B_CDF_Soldier_AAT_FST",
    "CUP_B_CDF_Medic_FST",
    "CUP_B_CDF_Soldier_FST"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_B_CDF_Soldier_TL_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_AA_FST",
    "CUP_B_CDF_Soldier_AA_FST",
    "CUP_B_CDF_Soldier_AA_FST",
    "CUP_B_CDF_Medic_FST",
    "CUP_B_CDF_Soldier_FST"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_B_CDF_Soldier_TL_MNT",
    "CUP_B_CDF_SOldier_MNT",
    "CUP_B_CDF_Soldier_GL_MNT",
    "CUP_B_CDF_Soldier_MG_MNT",
    "CUP_B_CDF_Soldier_LAT_MNT",
    "CUP_B_CDF_Soldier_RPG18_MNT",
    "CUP_B_CDF_Soldier_MArksman_MNT",
    "CUP_B_CDF_Sniper_MNT",
    "CUP_B_CDF_Medic_MNT",
    "CUP_B_CDF_Engineer_MNT"
];

// Paratroopers squad.
blufor_squad_para = [
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST",
    "CUP_B_CDF_Soldier_FST"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_B_BTR60_CDF",                                                  // BTR-60 PB
    "CUP_B_BM21_CDF",                                                   // BM-21
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_ZSU23_Afghan_CDF",                                           // ZSU-23-4 Afghanski
    "CUP_B_ZSU23_CDF",                                                  // ZSU-23-4
    "CUP_B_T72_CDF",                                                    // T-72
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Su25_Dyn_CDF",                                               // Su-25 Frogfoot
    "CUP_B_SU34_CDF",                                                   // Su-34
    "CUP_B_D30_CDF"                                                     // D-30
];
