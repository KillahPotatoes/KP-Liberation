/*
    Needed Mods:
    - Global Mobilization

    Optional Mods:
    - LEN - Cold War Helicopters (due to lack fo air assets in GM for now) - https://steamcommunity.com/sharedfiles/filedetails/?id=1726445116
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "land_gm_tower_bt_6_fuest_80";                           // This is the main FOB HQ building.
FOB_box_typename = "gm_ge_army_shelteraceI_command_win";                // This is the FOB as a container.
FOB_truck_typename = "gm_ge_army_bpz2a0_win";                           // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "gm_ge_army_u1300l_medic_win_rc";              // This is the mobile respawn (and medical) truck.
huron_typename = "gm_ge_army_ch53gs";                                   // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "gm_ge_army_crew_mp2a1_80_win";                     // This defines the crew for vehicles.
pilot_classname = "gm_ge_army_crew_mp2a1_80_win";                       // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "gm_ge_army_bo105p1m_vbh_swooper";// These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "gm_ge_army_kat1_454_cargo_win";        // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "land_gm_euro_shed_03";                // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "land_gm_radiotower_01";           // The building defined to unlock FOB air vehicle functionality.
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
    ["gm_ge_army_rifleman_g3a3_parka_80_win",20,0,0],                   // Rifleman
    ["gm_ge_army_antitank_g3a3_pzf44_parka_80_win",30,0,0],             // Rifleman (AT)
    ["gm_ge_army_grenadier_g3a3_parka_80_win",25,0,0],                  // Grenadier
    ["gm_ge_army_machinegunner_mg3_parka_80_win",25,0,0],               // Autorifleman
    ["gm_ge_army_antitank_g3a3_pzf84_parka_80_win",50,10,0],            // AT Specialist
    ["gm_ge_army_medic_g3a3_parka_80_win",30,0,0],                      // Combat Life Saver
    ["gm_ge_army_engineer_g3a4_parka_80_win",30,0,0],                   // Engineer
    ["gm_ge_army_demolition_g3a4_parka_80_win",30,0,0],                 // Explosives Specialist
    ["gm_ge_army_crew_mp2a1_80_oli",10,0,0]                             // Crewman
];

light_vehicles = [
    ["gm_ge_army_bicycle_01_oli",10,0,0],                               // Service Bicycle
    ["gm_ge_army_k125",50,0,25],                                        // K125 Bike
    ["gm_ge_army_iltis_cargo_win",100,0,50],                            // Truck 0.5t
    ["gm_ge_army_iltis_milan_win",100,60,50],                           // Truck 0.5t MILAN
    ["gm_ge_army_u1300l_cargo_win",125,30,75],                          // Truck 2t Transport
    ["gm_ge_army_kat1_451_cargo_win",145,30,75],                        // Truck 5t Transport
    ["gm_ge_army_u1300l_container_win",100,30,50],                      // Truck 2t Flatbed
    ["B_Boat_Transport_01_F",100,0,25]                                  // Assault Boat
];

heavy_vehicles = [
    ["gm_ge_army_m113a1g_apc_win",200,40,100],                          // M113A3 (MG3)
    ["gm_ge_army_m113a1g_apc_milan_win",200,60,100],                    // M113A3 (MILAN)
    ["gm_ge_army_m113a1g_medic",200,0,100],                             // M113A3 (Medical)
    ["gm_ge_army_fuchsa0_engineer_win",200,75,125],                     // Fuchs (Engineer)
    ["gm_ge_army_fuchsa0_reconnaissance_win",200,150,125],              // Fuchs (Recon, MILAN)
    ["gm_ge_army_gepard1a1_win",300,250,175],                           // Gepard 1A1
    ["gm_ge_army_Leopard1a1a1_win",400,300,200],                        // Leopard 1A1A1
    ["gm_ge_army_Leopard1a1a2_win",400,350,225],                        // Leopard 1A1A2
    ["gm_ge_army_Leopard1a3_win",500,500,250],                          // Leopard 1A3
    ["gm_ge_army_Leopard1a3a1_win",550,550,250]                         // Leopard 1A3A1
];

air_vehicles = [
    ["gm_ge_army_bo105m_vbh",200,0,100],                                // VBH 1
    ["gm_ge_army_bo105p1m_vbh",200,0,100],                              // VBH 1A1
    ["gm_ge_army_bo105p1m_vbh_swooper",200,0,100],                      // VBH 1A1 Swooper
    ["gm_ge_army_bo105p_pah1",200,100,100],                             // PAH 1
    ["gm_ge_army_bo105p_pah1a1",200,120,100],                           // PAH 1A1
    ["len_uh1d_bw",225,0,125],                                          // BW UH-1D
    ["gm_ge_army_ch53g",300,0,175],                                     // CH-53G
    ["gm_ge_airforce_do28d2",350,0,200],                                // Do 28 D2
    ["gm_ge_airforce_do28d2_medevac",350,0,200]                         // Do 28 D2 (Medevac)
];

static_vehicles = [
    ["gm_ge_army_milan_launcher_tripod",50,100,0]                       // Static MILAN
];

buildings = [
    ["Land_Cargo_House_V4_F",0,0,0],
    ["Land_Cargo_Patrol_V4_F",0,0,0],
    ["Land_Cargo_Tower_V4_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
    ["Flag_White_F",0,0,0],
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
    ["land_gm_euro_furniture_mapboard_01",0,0,0],
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
    ["Land_HBarrier_01_tower_green_F",0,0,0],
    ["Land_HBarrier_01_line_1_green_F",0,0,0],
    ["Land_HBarrier_01_line_3_green_F",0,0,0],
    ["Land_HBarrier_01_line_5_green_F",0,0,0],
    ["Land_HBarrier_01_big_4_green_F",0,0,0],
    ["Land_HBarrier_01_wall_4_green_F",0,0,0],
    ["Land_HBarrier_01_wall_6_green_F",0,0,0],
    ["Land_HBarrier_01_wall_corner_green_F",0,0,0],
    ["Land_HBarrier_01_wall_corridor_green_F",0,0,0],
    ["Land_HBarrier_01_big_tower_green_F",0,0,0],
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
    ["land_gm_sandbags_01_round_01",0,0,0],
    ["land_gm_sandbags_01_wall_01",0,0,0],
    ["land_gm_sandbags_01_short_01",0,0,0],
    ["land_gm_sandbags_01_door_01",0,0,0],
    ["land_gm_sandbags_01_door_02",0,0,0]
];

support_vehicles = [
    [Arsenal_typename,100,200,0],
    [Respawn_truck_typename,200,0,100],
    [FOB_box_typename,200,500,0],
    [FOB_truck_typename,300,500,100],
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
    ["gm_ge_army_u1300l_repair_win",325,30,75],                         // Truck 2t repair
    ["gm_ge_army_kat1_451_refuel_win",125,0,275],                       // Truck 5t fuel
    ["gm_ge_army_kat1_451_reammo_win",125,200,75],                      // Truck 5t ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",
    "gm_ge_army_grenadier_g3a3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_demolition_g3a4_parka_80_win",
    "gm_ge_army_medic_g3a3_parka_80_win",
    "gm_ge_army_engineer_g3a4_parka_80_win"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",
    "gm_ge_army_grenadier_g3a3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_demolition_g3a4_parka_80_win",
    "gm_ge_army_medic_g3a3_parka_80_win",
    "gm_ge_army_engineer_g3a4_parka_80_win"
];

// AT specialists squad.
blufor_squad_at = [
    "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_medic_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win"
];

// AA specialists squad.
blufor_squad_aa = [
    "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win",
    "gm_ge_army_medic_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win"
];

// Force recon squad.
blufor_squad_recon = [
    "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",
    "gm_ge_army_grenadier_g3a3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_machinegunner_mg3_parka_80_win",
    "gm_ge_army_demolition_g3a4_parka_80_win",
    "gm_ge_army_medic_g3a3_parka_80_win",
    "gm_ge_army_engineer_g3a4_parka_80_win",
    "gm_ge_army_antitank_g3a3_pzf84_parka_80_win"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win",
    "gm_ge_army_rifleman_g3a3_parka_80_win"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "gm_ge_army_Leopard1a1a2_win",                                      // Leopard 1A1A2
    "gm_ge_army_Leopard1a3a1_win"                                       // Leopard 1A3A1
];
