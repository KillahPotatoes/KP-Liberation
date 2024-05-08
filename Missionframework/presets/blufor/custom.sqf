/*
    Needed Mods:
    - Legion Studios Base - Stable
    - Legion Studios - Star Wars Battlefields
    - Just Like The Simulations - The Great War
    - 3AS (Beta Test)
    - Kobra Mod Pack - Main
    - Keeli Company Auxillary Mod

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "ls_commandPost_republic_blue";                          // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "BNA_KC_Gammoth_Device";                           // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "BNA_KC_Gammoth_Medical";                      // This is the mobile respawn (and medical) truck.
huron_typename = "BNA_KC_Rho_crateMedical";                             // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "BNA_KC_Unit_Phase2_Tanker_CT";                     // This defines the crew for vehicles.
pilot_classname = "BNA_KC_Unit_Phase2_CXA";                             // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "BNA_KC_LAATi_MK2";               // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "442_boat_armed";                        // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "BNA_KC_Gammoth_Transport";             // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "lsd_gar_radarDish";               // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "3AS_Pad_GAR_Prop";                  // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "land_3AS_FOB_Hangar";              // The hangar used to increase the GLOBAL fixed-wing cap.
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
    ["SWLB_clone_assault_base_P2",20,0,0],                              // Rifleman
    ["SWLB_clone_at_base_P2",30,0,0],                                   // Rifleman (AT)
    ["SWLB_clone_base_P2",25,0,0],                                      // Grenadier
    ["SWLB_clone_sg_base_P2",50,0,0],                                   // Autorifleman
    ["SWLB_clone_sniper_base_P2",30,0,0],                               // Marksman
    ["SWLB_clone_at_heavy_P2",50,10,0],                                 // AT Specialist
    ["SWLB_clone_aa_base_P2",50,10,0],                                  // AA Specialist
    ["SWLB_clone_medic_base_P2",30,0,0],                                // Combat Life Saver
    ["SWLB_clone_engineer_base_P2",30,0,0],                             // Engineer
    ["SWLB_clone_eod_base_P2",30,0,0],                                  // Explosives Specialist
    ["SWLB_clone_recon_base_P2",20,0,0],                                // Recon Scout
    ["SWLB_clone_recon_at_base_P2",30,0,0],                             // Recon Scout (AT)
    ["SWLB_clone_recon_nco_base_P2",30,0,0],                            // Recon Marksman
    ["SWLB_clone_recon_medic_base_P2",30,0,0],                          // Recon Paramedic
    ["SWLB_clone_recon_officer_base_P2",30,0,0],                        // Recon Demolition Expert
    ["SWLB_clone_pilot_base_P2",10,0,0]                                 // Pilot
];

light_vehicles = [
    ["BNA_KC_Khezu_Unarmed",50,0,50],                                   // Khezu Drone
    ["BNA_KC_Khezu_Armed",50,25,50],                                    // Khezu Drone
    ["BNA_KC_Hornet_Unarmed",80,0,50],                                  // Hornet
    ["BNA_KC_Hornet_Armed",150,35,50],                                  // Hornet
    ["BNA_KC_Hornet_AT",200,40,50],                                     // Hornet
    ["BNA_KC_Gammoth_Transport",125,0,75],                              // Gammoth Transport
    ["BNA_KC_Gammoth_Covered",125,0,75],                                // Gammoth Transport (Covered)
    ["BNA_KC_Glavenus_Unarmed",100,0,75],                               // Glavenus Unarmed
    ["BNA_KC_Glavenus_HMG",125,50,75],                                  // Glavenus HMG
    ["BNA_KC_Glavenus_GMG",125,75,75],                                  // Glavenus GMG
    ["BNA_KC_BARC",150,25,50],                                          // BARC
    ["3AS_BarcSideCar",150,40,50],                                      // BARC (Side car)
    ["442_boat_armed",200,100,75]                                       // Republic Attack Boat
];

heavy_vehicles = [
    ["BNA_KC_ATRT",200,40,100],                                         // AT-RT
    // ["3AS_RTT",400,0,200],                                           // RTT
    ["BNA_KC_Saber_M1",500,350,225],                                    // Sabre
    ["BNA_KC_TX130_M1_Recon",400,200,225],                              // Sabre Recon
    ["BNA_KC_TX130_M1_GL",500,400,225],                                 // Sabre GL
    ["BNA_KC_TX130_Super",800,600,350],                                 // Sabre Super
    ["BNA_KC_ATAP",700,500,250],                                        // AT-AP
    ["BNA_KC_ATTE",1000,700,450],                                       // AT-TE
    ["BNA_KC_RX200_AA",600,1250,300],                                   // RX-200 (AA)
    ["BNA_KC_RX200_Artillery",750,1250,300],                            // RX-200 (Artillery)
    ["3AS_AV7",900,1250,300],                                           // AV-7 Artillery gun
    ["BNA_KC_Juggernaut",1500,750,600],                                 // HAVw A6 Juggernaut tank
    ["BNA_KC_Reek",650,600,300],                                        // Reek
    ["BNA_KC_Hydra",700,625,300],                                       // Hydra
    ["BNA_KC_Blitz",800,675,350]                                        // Blitz Tank
];

air_vehicles = [
    ["JLTS_UAV_prowler_gar",75,0,25],                                   // Recon Drone
    ["BNA_KC_Rho",300,100,175],                                         // NU Class Shuttle
    ["BNA_KC_LAATi_MK1",400,200,250],                                   // LAAT/i MK-1 (Ball turrets)
    ["BNA_KC_LAATi_MK2",300,150,250],                                   // LAAT/i MK-2 (Doors)
    ["BNA_KC_LAATc",500,50,400],                                        // LAAT/c
    ["BNA_KC_RepublicTransport",750,0,600],                             // Republic Transport
    ["3AS_Z95_Republic",500,400,350],                                   // Z-95 Head Hunter
    ["BNA_KC_ARC170",1500,1750,450],                                    // ARC-170
    ["BNA_KC_BTLB_YWing",750,1500,500]                                  // BTL-B Y Wing Bomber
];

static_vehicles = [
    ["3AS_HeavyRepeater_Unarmoured",35,60,0],                           // Heavy Repeater
    ["3AS_HeavyRepeater_Armoured",45,60,0],                             // Heavy Repeater (Armor)
    ["3AS_StationaryTurret",50,100,0],                                  // Fixed Turret
    ["lsd_gar_radarDish",250,0,0],                                      // Radar Dish
    ["3AS_Republic_Mortar",80,150,0]                                    // Republic Mortar
];

buildings = [
    ["land_FOB_gate",0,0,0],
    ["Land_FOB_build_New_Wall",0,0,0],
    ["Land_holotable_circular",0,0,0],
    ["Land_holotable_rectangular",0,0,0],
    ["Land_Cargo_House_V4_F",0,0,0],
    ["Land_Cargo_Patrol_V4_F",0,0,0],
    ["Land_Cargo_Tower_V4_F",0,0,0],
    ["BNA_KC_Flag_KeeliCompany_Pole",0,0,0],
    ["BNA_KC_Flag_KeeliCompany_Horizontal",0,0,0],
    ["BNA_KC_Flag_KeeliCompany_Vertical",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_ghex_F",0,0,0],
    ["CamoNet_ghex_open_F",0,0,0],
    ["CamoNet_ghex_big_F",0,0,0],
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
    ["Land_BagFence_01_round_green_F",0,0,0],
    ["Land_BagFence_01_short_green_F",0,0,0],
    ["Land_BagFence_01_long_green_F",0,0,0],
    ["Land_BagFence_01_corner_green_F",0,0,0],
    ["Land_BagFence_01_end_green_F",0,0,0],
    ["Land_BagBunker_01_small_green_F",0,0,0],
    ["Land_BagBunker_01_large_green_F",0,0,0],
    ["Land_lsb_fob_hBarrier_1",0,0,0],
    ["Land_lsb_fob_hBarrier_3",0,0,0],
    ["Land_lsb_fob_hBarrier_5",0,0,0],
    ["Land_lsb_fob_hBarrierBig_4",0,0,0],
    // ["Land_HBarrier_01_wall_4_green_F",0,0,0],
    ["Land_lsb_fob_hBarrierWall_7",0,0,0],
    ["Land_lsb_fob_hBarrierWall_exvertedCorner",0,0,0],
    ["Land_lsb_fob_hBarrierWall_invertedCorner",0,0,0],
    ["Land_lsb_fob_hBarrier_corridor",0,0,0],
    ["Land_lsb_fob_hBarrier_tower",0,0,0],
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
    ["BNA_KC_Resupply_SquadMedical",25,0,0],
    ["BNA_KC_Resupply_PlatoonMedical",50,0,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["BNA_KC_Gammoth_Repair",325,0,75],                                 // Gammoth Repair
    ["BNA_KC_Gammoth_Refuel",125,0,275],                                // Gammoth Fuel
    ["BNA_KC_Gammoth_Ammo",125,200,75],                                 // Gammoth Ammo
    ["BNA_KC_Gammoth_Medical",175,0,75],                                // Gammoth Medical
    ["BNA_KC_Gammoth_Device",175,0,75],                                 // Gammoth Medical
    ["BNA_KC_Glavenus_Medic",125,0,75]                                  // Glavenus Medical
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "SWLB_clone_assault_base_P2",
    "SWLB_clone_base_P2",
    "SWLB_clone_base_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_base_P2",
    "SWLB_clone_sg_base_P2",
    "SWLB_clone_sg_base_P2",
    "SWLB_clone_sniper_base_P2",
    "SWLB_clone_medic_base_P2",
    "SWLB_clone_engineer_base_P2"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "SWLB_clone_base_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_assault_base_P2",
    "B_soldier_AR_F",
    "B_soldier_AR_F",
    "B_HeavyGunner_F",
    "B_Sharpshooter_F",
    "SWLB_clone_medic_base_P2",
    "SWLB_clone_engineer_base_P2"
];

// AT specialists squad.
blufor_squad_at = [
    "SWLB_clone_base_P2",
    "SWLB_clone_assault_base_P2",
    "SWLB_clone_assault_base_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_at_heavy_P2",
    "SWLB_clone_medic_base_P2",
    "SWLB_clone_assault_base_P2"
];

// AA specialists squad.
blufor_squad_aa = [
    "SWLB_clone_base_P2",
    "SWLB_clone_assault_base_P2",
    "SWLB_clone_assault_base_P2",
    "SWLB_clone_aa_heavy_P2",
    "SWLB_clone_aa_heavy_P2",
    "SWLB_clone_aa_heavy_P2",
    "SWLB_clone_medic_base_P2",
    "SWLB_clone_assault_base_P2"
];

// Force recon squad.
blufor_squad_recon = [
    "SWLB_clone_recon_nco_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_at_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_recon_base_P1",
    "SWLB_clone_eod_base_P2"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "SWLB_clone_airborne_nco_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2",
    "SWLB_clone_airborne_base_P2"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "BNA_KC_TX130_Super",                                               // TX-130 Super Saber
    "BNA_KC_ATTE",                                                      // AT-TE
    "BNA_KC_ATAP",                                                      // AT-AP
    "3AS_AV7",                                                          // AV-7
    "BNA_KC_Juggernaut",                                                // HAVw A6 Juggernaut tank
    "BNA_KC_RX200_AA",                                                  // RX-200 (AA)
    "BNA_KC_RX200_Artillery",                                           // RX-200 (Artillery)
    "BNA_KC_LAATi_MK1",                                                 // LAAT/i MK2 (Ball turrets)
    "BNA_KC_LAATi_MK2",                                                 // LAAT/i MK2 (Doors)
    "3AS_Z95_Republic",                                                 // Z-95
    "BNA_KC_ARC170",                                                    // ARC-170
    "BNA_KC_BTLB_YWing"                                                 // Y-Wing
];