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
FOB_truck_typename = "CUP_B_MTVR_Repair_USA";                           // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_B_LR_Ambulance_GB_D";                     // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_B_CH47F_GB";                                      // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_B_BAF_Soldier_Crew_DDPM";                      // This defines the crew for vehicles.
pilot_classname = "CUP_B_BAF_Soldier_Helipilot_DDPM";                   // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "CUP_B_SA330_Puma_HC2_BAF";       // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_B_MTVR_BAF_DES";                   // These are the trucks which are used in the logistic convoy system.
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
    ["CUP_B_BAF_Soldier_RiflemanLite_DDPM",15,0,0],                     // Rifleman (Light)
    ["CUP_B_BAF_Soldier_Rifleman_DDPM",20,0,0],                         // Rifleman
    ["CUP_B_BAF_Soldier_RiflemanAT_DDPM",30,0,0],                       // Rifleman (AT)
    ["CUP_B_BAF_Soldier_Grenadier_DDPM",25,0,0],                        // Grenadier
    ["CUP_B_BAF_Soldier_AutoRifleman_DDPM",25,0,0],                     // Autorifleman
    ["CUP_B_BAF_Soldier_HeavyGunner_DDPM",35,0,0],                      // Heavygunner
    ["CUP_B_BAF_Soldier_Marksman_DDPM",30,0,0],                         // Marksman
    ["CUP_B_BAF_Soldier_SharpShooter_DDPM",40,0,0],                     // Sharpshooter
    ["CUP_B_BAF_Soldier_AT_DDPM",50,10,0],                              // AT Specialist
    ["CUP_B_BAF_Soldier_AA_DDPM",50,10,0],                              // AA Specialist
    ["CUP_B_BAF_Soldier_Medic_DDPM",30,0,0],                            // Combat Life Saver
    ["CUP_B_BAF_Soldier_Engineer_DDPM",30,0,0],                         // Engineer
    ["CUP_B_BAF_Soldier_Explosive_DDPM",30,0,0],                        // Explosives Specialist
    ["CUP_B_BAF_Soldier_Rifleman_MTP",20,0,0],                          // Recon Scout
    ["CUP_B_BAF_Soldier_RiflemanAT_MTP",30,0,0],                        // Recon Scout (AT)
    ["CUP_B_BAF_Soldier_Marksman_MTP",30,0,0],                          // Recon Marksman
    ["CUP_B_BAF_Soldier_SharpShooter_MTP",40,0,0],                      // Recon Sharpshooter
    ["CUP_B_BAF_Soldier_Medic_MTP",30,0,0],                             // Recon Paramedic
    ["CUP_B_BAF_Soldier_Explosive_MTP",30,0,0],                         // Recon Demolition Expert
    ["CUP_B_BAF_Sniper_AS50_TWS_DDPM",70,5,0],                          // Sniper
    ["CUP_B_BAF_Sniper_AS50_DDPM",70,5,0],                              // Sniper (Arid)
    ["CUP_B_BAF_Sniper_DDPM",70,5,0],                                   // Sniper (Lush)
    ["CUP_B_BAF_Spotter_DDPM",20,0,0],                                  // Spotter
    ["CUP_B_BAF_Soldier_Crew_DDPM",10,0,0],                             // Crewman
    ["CUP_B_BAF_Soldier_Paratrooper_DDPM",20,0,0],                      // Para Trooper
    ["CUP_B_BAF_Soldier_Helicrew_DDPM",10,0,0],                         // Helicopter Crew
    ["CUP_B_BAF_Soldier_Helipilot_DDPM",10,0,0],                        // Helicopter Pilot
    ["CUP_B_BAF_Soldier_Pilot_DDPM",10,0,0]                             // Pilot
];

light_vehicles = [
    ["CUP_B_LR_Transport_GB_D",75,0,50],                                // Land Rover 110 Transport
    ["CUP_B_LR_MG_GB_D",75,50,50],                                      // Land Rover 110 (M2)
    ["CUP_B_LR_Special_M2_GB_D",100,80,50],                             // Land Rover 110 (M2 Special)
    ["CUP_B_LR_Special_GMG_GB_D",100,100,50],                           // Land Rover 110 (GMG Special)
    ["CUP_B_BAF_Coyote_L2A1_D",200,40,50],                              // Coyote L2A1
    ["CUP_B_BAF_Coyote_GMG_D",200,60,50],                               // Coyote GMG
    ["CUP_B_Mastiff_LMG_GB_D",250,20,150],                              // Mastiff PPV LMG
    ["CUP_B_Mastiff_HMG_GB_D",250,40,150],                              // Mastiff PPV HMG
    ["CUP_B_Mastiff_GMG_GB_D",250,60,150],                              // Mastiff PPV GMG
    ["CUP_B_Wolfhound_LMG_GB_D",275,20,150],                            // Wolfhound TSV LMG
    ["CUP_B_Wolfhound_HMG_GB_D",275,40,150],                            // Wolfhound TSV HMG
    ["CUP_B_Wolfhound_GMG_GB_D",275,60,150],                            // Wolfhound TSV GMG
    ["CUP_B_MTVR_BAF_DES",125,0,75]                                     // MTVR Transport
];

heavy_vehicles = [
    ["CUP_B_FV432_Bulldog_GB_D",300,100,150],                           // FV432 Bulldog M240
    ["CUP_B_FV432_Bulldog_GB_D_RWS",300,250,150],                       // FV432 Bulldog M2 RWS
    ["CUP_B_MCV80_GB_D",300,450,275],                                   // MCV-80 Warrior
    ["CUP_B_MCV80_GB_D_SLAT",400,450,275],                              // MCV-80 Warrior (SLAT)
    ["CUP_B_FV510_GB_D",350,550,275],                                   // FV510 Warrior
    ["CUP_B_FV510_GB_D_SLAT",450,550,275],                              // FV510 Warrior (SLAT)
    ["CUP_B_Challenger2_Desert_BAF",500,800,450],                       // FV4034 Challenger 2
    ["CUP_B_Challenger2_2CD_BAF",500,800,450]                           // FV4034 Challenger 2 (Two-Color Desert)
];

air_vehicles = [
    ["CUP_B_AW159_Unarmed_RN_Blackcat",225,0,125],                      // AW159 Wildcat (Black Cat, Unarmed)
    ["CUP_B_AW159_Unarmed_GB",225,0,125],                               // AW159 Wildcat (Green, Unarmed)
    ["CUP_B_AW159_Unarmed_RN_Grey",225,0,125],                          // AW159 Wildcat (Grey, Unarmed)
    ["CUP_B_AW159_RN_Blackcat",350,400,125],                            // AW159 Wildcat (Black Cat)
    ["CUP_B_AW159_GB",350,400,125],                                     // AW159 Wildcat (Green)
    ["CUP_B_AW159_RN_Grey",350,400,125],                                // AW159 Wildcat (Grey)
    ["CUP_B_AH1_DL_BAF",750,600,325],                                   // AH1
    ["CUP_B_GR9_DYN_GB",1000,1200,600],                                 // Harrier GR.9
    ["CUP_B_F35B_BAF",1500,1750,450],                                   // F-35B Lightning II
    ["CUP_B_F35B_Stealth_BAF",1500,1750,450]                            // F-35B Lightning II (Stealth)
];

static_vehicles = [
    ["CUP_B_L111A1_BAF_DDPM",25,40,0],                                  // L111A1 Machine Gun
    ["CUP_B_L111A1_MiniTripod_BAF_DDPM",25,40,0],                       // L111A1 Minitripod
    ["CUP_WV_B_CRAM",500,500,0],                                        // C-RAM
    ["CUP_WV_B_SS_Launcher",750,500,0],                                 // Mk-29 GMLS
    ["CUP_WV_B_RAM_Launcher",750,750,0],                                // Mk-49 GMLS
    ["B_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["CUP_B_L16A2_BAF_DDPM",80,150,0]                                   // L16A2 81mm Mortar
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
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
    ["CUP_B_TowingTractor_GB",50,0,25],                                     // Towing Tractor
    ["CUP_B_MTVR_Repair_BAF_DES",425,0,75],                                 // MTVR Repair
    ["CUP_B_MTVR_Refuel_BAF_DES",125,0,375],                                // MTVR Refuel
    ["CUP_B_MTVR_Ammo_BAF_DES",125,300,75],                                 // MTVR Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                    // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                     // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                      // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "CUP_B_BAF_Soldier_TeamLeader_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DDPM",
    "CUP_B_BAF_Soldier_Grenadier_DDPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DDPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DDPM",
    "CUP_B_BAF_Soldier_Marksman_DDPM",
    "CUP_B_BAF_Soldier_Medic_DDPM",
    "CUP_B_BAF_Soldier_Engineer_DDPM"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_B_BAF_Soldier_TeamLeader_DDPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DDPM",
    "CUP_B_BAF_Soldier_RiflemanLAT_DDPM",
    "CUP_B_BAF_Soldier_Grenadier_DDPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DDPM",
    "CUP_B_BAF_Soldier_AutoRifleman_DDPM",
    "CUP_B_BAF_Soldier_HeavyGunner_DDPM",
    "CUP_B_BAF_Soldier_SharpShooter_DDPM",
    "CUP_B_BAF_Soldier_Medic_DDPM",
    "CUP_B_BAF_Soldier_Engineer_DDPM"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_B_BAF_Soldier_TeamLeader_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_AT_DDPM",
    "CUP_B_BAF_Soldier_AT_DDPM",
    "CUP_B_BAF_Soldier_AT_DDPM",
    "CUP_B_BAF_Soldier_Medic_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_B_BAF_Soldier_TeamLeader_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM",
    "CUP_B_BAF_Soldier_AA_DDPM",
    "CUP_B_BAF_Soldier_AA_DDPM",
    "CUP_B_BAF_Soldier_AA_DDPM",
    "CUP_B_BAF_Soldier_Medic_DDPM",
    "CUP_B_BAF_Soldier_Rifleman_DDPM"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_B_BAF_Soldier_TeamLeader_MTP",
    "CUP_B_BAF_Soldier_Rifleman_MTP",
    "CUP_B_BAF_Soldier_Rifleman_MTP",
    "CUP_B_BAF_Soldier_RiflemanLAT_MTP",
    "CUP_B_BAF_Soldier_Marksman_MTP",
    "CUP_B_BAF_Soldier_Marksman_MTP",
    "CUP_B_BAF_Soldier_SharpShooter_MTP",
    "CUP_B_BAF_Soldier_SharpShooter_MTP",
    "CUP_B_BAF_Soldier_Medic_MTP",
    "CUP_B_BAF_Soldier_Explosive_MTP"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM",
    "CUP_B_BAF_Soldier_Paratrooper_DDPM"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_B_MCV80_GB_D_SLAT",                                            // MCV-80 Warrior (SLAT)
    "CUP_B_FV510_GB_D",                                                 // FV510 Warrior
    "CUP_B_FV510_GB_D_SLAT",                                            // FV510 Warrior (SLAT)
    "CUP_B_Challenger2_Desert_BAF",                                     // FV4034 Challenger 2
    "CUP_B_Challenger2_2CD_BAF",                                        // FV4034 Challenger 2 (Two-Color Desert)
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_F35B_BAF",                                                   // F-35B Lightning II
    "CUP_B_F35B_Stealth_BAF",                                           // F-35B Lightning II (Stealth)
    "CUP_WV_B_CRAM",                                                    // C-RAM
    "CUP_WV_B_SS_Launcher",                                             // Mk-29 GMLS
    "CUP_WV_B_RAM_Launcher"                                             // Mk-49 GMLS
];
