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
FOB_truck_typename = "CUP_O_BMP_HQ_sla";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_O_BMP2_AMB_sla";                          // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_O_Mi8_SLA_1";                                     // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_O_sla_Crew";                                   // This defines the crew for vehicles.
pilot_classname = "CUP_O_sla_Pilot";                                    // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "CUP_O_UH1H_slick_SLA";           // These are the little birds which spawn on the Freedom or at Chimera bas
KP_liberation_boat_classname = "CUP_O_PBX_SLA";                         // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_O_Ural_Open_SLA";                  // These are the trucks which are used in the logistic convoy system.
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
    ["CUP_O_sla_Soldier",15,0,0],                                       // Rifleman
    ["CUP_O_SLA_Soldier_Backpack",20,0,0],                              // Rifleman (Backpack)
    ["CUP_O_sla_Soldier_AT",30,0,0],                                    // Rifleman (RPG-7)
    ["CUP_O_sla_Soldier_GL",25,0,0],                                    // Grenadier
    ["CUP_O_sla_Soldier_AR",25,0,0],                                    // Autorifleman
    ["CUP_O_sla_Soldier_MG",35,0,0],                                    // Machinegunner
    ["CUP_O_sla_Soldier_HAT",50,10,0],                                  // AT Specialist
    ["CUP_O_sla_Soldier_AA",50,10,0],                                   // AA Specialist
    ["CUP_O_sla_Medic",30,0,0],                                         // Medic
    ["CUP_O_sla_Engineer",30,0,0],                                      // Engineer
    ["CUP_O_sla_SpecOps_TL",20,0,0],                                    // Especas Team Leader
    ["CUP_O_sla_SpecOps_LAT",30,0,0],                                   // Especas (RPG18)
    ["CUP_O_sla_SpecOps_MG",40,0,0],                                    // Especas Machinegunner
    ["CUP_O_sla_SpecOps",30,0,0],                                       // Especas Commando
    ["CUP_O_sla_SpecOps_Demo",30,0,0],                                  // Especas (Demolitions)
    ["CUP_O_sla_Sniper",70,5,0],                                        // Sniper
    ["CUP_O_SLA_Sniper_SVD_Night",70,5,0],                              // Sniper (Night)
    ["CUP_O_sla_Sniper_KSVK",70,5,0],                                   // Sniper (KSVK)
    ["CUP_O_sla_Soldier_AKS_Night",70,5,0],                             // Soldier (AKS-74 Night)
    ["CUP_O_SLA_Spotter",20,0,0],                                       // Spotter
    ["CUP_O_sla_Crew",10,0,0],                                          // Crewman
    ["CUP_O_sla_Pilot",10,0,0]                                          // Pilot
];

light_vehicles = [
    ["CUP_O_UAZ_Unarmed_SLA",100,0,50],                                 // UAZ
    ["CUP_O_UAZ_MG_SLA",125,60,50],                                     // UAZ (DShKM)
    ["CUP_O_UAZ_AGS30_SLA",125,80,50],                                  // UAZ (AGS-30)
    ["CUP_O_UAZ_SPG9_SLA",125,100,50],                                  // UAZ (SPG-9)
    ["CUP_O_UAZ_METIS_SLA",150,120,50],                                 // UAZ (Metis-M)
    ["CUP_O_UAZ_AA_SLA",200,160,50],                                    // UAZ (AA)
    ["CUP_O_Ural_ZU23_SLA",250,300,100],                                // Ural (ZU-23)
    ["CUP_O_BM21_SLA",300,750,100],                                     // BM-21
    ["CUP_O_Ural_Open_SLA",150,0,75],                                   // Ural (Open)
    ["CUP_O_Ural_SLA",150,0,75]                                         // Ural
];

heavy_vehicles = [
    ["CUP_O_BRDM2_SLA",200,200,150],                                    // BRDM-2
    ["CUP_O_BRDM2_ATGM_SLA",200,400,150],                               // BRDM-2 (ATGM)
    ["CUP_O_BTR60_SLA",300,200,200],                                    // BTR-60PB
    ["CUP_O_BTR80_SLA",400,300,200],                                    // BTR-80
    ["CUP_O_BTR80A_SLA",425,500,200],                                   // BTR-80A
    ["CUP_O_MTLB_pk_SLA",175,50,100],                                   // MT-LB LV
    ["CUP_O_BMP2_SLA",500,600,200],                                     // BMP-2
    ["CUP_O_ZSU23_Afghan_SLA",350,500,200],                             // ZSU-23-4 Afghanski
    ["CUP_O_ZSU23_SLA",500,500,200],                                    // ZSU-23-4
    ["CUP_O_T55_SLA",500,350,250],                                      // T-55
    ["CUP_O_T72_SLA",700,500,300]                                       // T-72
];

air_vehicles = [
    ["CUP_O_UH1H_armed_SLA",400,250,250],                               // UH-1H (Armed)
    ["CUP_O_UH1H_gunship_SLA",500,350,250],                             // UH-1H (Gunship)
    ["CUP_O_Mi8_SLA_2",500,350,300],                                    // Mi-8MTV3
    ["CUP_O_Mi24_D_Dynamic_SLA",600,650,300],                           // Mi-24D
    ["CUP_O_Ka50_DL_SLA",800,750,350],                                  // Ka-50 Black Shark
    ["CUP_O_Su25_Dyn_SLA",1000,850,400],                                // Su-25 Frogfoot
    ["CUP_O_SU34_SLA",1200,1000,500]                                    // Su-34
];

static_vehicles = [
    ["CUP_O_DSHKM_SLA",25,40,0],                                        // DShKM
    ["CUP_O_DSHkM_MiniTripod_SLA",25,40,0],                             // DShKM Minitripod
    ["CUP_O_AGS_SLA",25,60,0],                                          // AGS-30
    ["CUP_O_SPG9_SLA",50,100,0],                                        // SPG-9
    ["CUP_O_Igla_AA_pod_SLA",100,200,0],                                // Igla AA Pod
    ["CUP_O_ZU23_SLA",100,300,0],                                       // ZU-23
    ["CUP_O_2b14_82mm_SLA",80,150,0],                                   // Podnos 2B14
    ["CUP_O_D30_AT_SLA",100,200,0],                                     // D-30 AT
    ["CUP_O_D30_SLA",200,250,0]                                         // D-30
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
    ["CUP_O_LCVP_SLA",100,100,50],                                      // LCVP
    ["CUP_O_LCVP_VIV_SLA",100,100,50],                                  // LCVP (VIV)
    ["CUP_O_Tractor_SLA",50,0,75],                                      // Towing Tractor
    ["CUP_O_Ural_Repair_SLA",425,0,75],                                 // Ural (Repair)
    ["CUP_O_Ural_Refuel_SLA",125,0,375],                                // Ural (Refuel)
    ["CUP_O_Ural_Reammo_SLA",125,300,75],                               // Ural (Ammo)
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
    "CUP_O_sla_Soldier_SL",
    "CUP_O_sla_Soldier",
    "CUP_O_sla_Soldier",
    "CUP_O_sla_Soldier_LAT",
    "CUP_O_sla_Soldier_GL",
    "CUP_O_sla_Soldier_AR",
    "CUP_O_sla_Soldier_AR",
    "CUP_O_sla_Sniper",
    "CUP_O_sla_Medic",
    "CUP_O_sla_Engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_O_sla_Soldier_SL",
    "CUP_O_sla_Soldier_LAT",
    "CUP_O_sla_Soldier_LAT",
    "CUP_O_sla_Soldier_GL",
    "CUP_O_sla_Soldier_AR",
    "CUP_O_sla_Soldier_AR",
    "CUP_O_sla_Soldier_MG",
    "CUP_O_sla_Sniper",
    "CUP_O_sla_Medic",
    "CUP_O_sla_Engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_O_sla_Soldier_SL",
    "CUP_O_sla_Soldier_AAT",
    "CUP_O_sla_Soldier_AAT",
    "CUP_O_sla_Soldier_AT",
    "CUP_O_sla_Soldier_AT",
    "CUP_O_sla_Soldier_HAT",
    "CUP_O_sla_Medic",
    "CUP_O_sla_Engineer"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_O_sla_Soldier_SL",
    "CUP_O_sla_Soldier_Backpack",
    "CUP_O_sla_Soldier_Backpack",
    "CUP_O_sla_Soldier_AA",
    "CUP_O_sla_Soldier_AA",
    "CUP_O_sla_Soldier_AA",
    "CUP_O_sla_Medic",
    "CUP_O_sla_Engineer"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_O_sla_SpecOps_TL",
    "CUP_O_sla_SpecOps",
    "CUP_O_sla_SpecOps_Demo",
    "CUP_O_sla_SpecOps",
    "CUP_O_sla_SpecOps_LAT",
    "CUP_O_sla_SpecOps_LAT",
    "CUP_O_sla_SpecOps_MG"
];

// Paratroopers squad.
blufor_squad_para = [
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Officer_urban",
    "CUP_O_sla_Soldier_LAT_urban",
    "CUP_O_sla_Soldier_LAT_urban",
    "CUP_O_sla_Soldier_LAT_urban",
    "CUP_O_sla_Soldier_LAT_urban"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_O_BTR60_SLA",                                                  // BTR-60 PB
    "CUP_O_BM21_SLA",                                                   // BM-21
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_ZSU23_Afghan_SLA",                                           // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_SLA",                                                  // ZSU-23-4
    "CUP_O_T72_SLA",                                                    // T-72
    "CUP_O_BTR80_SLA",                                                  // BTR-80
    "CUP_O_BTR80A_SLA",                                                 // BTR-80A
    "CUP_O_BRDM2_ATGM_SLA",                                             // BRDM-2 (ATGM)
    "CUP_O_Mi24_D_Dynamic_SLA",                                         // Mi-24D
    "CUP_O_Ka50_DL_SLA",                                                // Ka-50 Black Shark
    "CUP_O_Su25_Dyn_SLA",                                               // Su-25 Frogfoot
    "CUP_O_SU34_SLA",                                                   // Su-34
    "CUP_O_D30_SLA"                                                     // D-30
];
