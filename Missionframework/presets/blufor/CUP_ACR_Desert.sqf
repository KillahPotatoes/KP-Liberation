/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - Qinetix's Titus
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "CUP_B_T810_Repair_CZ_DES";                        // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_B_LR_Ambulance_CZ_D";                     // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_B_Mi171Sh_Unarmed_ACR";                           // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "CUP_B_CZ_Crew_DES";                                // This defines the crew for vehicles.
pilot_classname = "CUP_B_CZ_Pilot_DES";                                 // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "B_Heli_Light_01_F";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_B_T810_Unarmed_CZ_DES";            // These are the trucks which are used in the logistic convoy system.
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
    ["CUP_B_CZ_Soldier_DES",15,0,0],                                    // Rifleman
    ["CUP_B_CZ_Soldier_backpack_DES",20,0,0],                           // Rifleman (Backpack)
    ["CUP_B_CZ_Soldier_RPG_DES",30,0,0],                                // Rifleman (RPG)
    ["CUP_B_CZ_Soldier_805_GL_DES",25,0,0],                             // Grenadier
    ["CUP_B_CZ_Soldier_AR_DES",25,0,0],                                 // Automatic Rifleman
    ["CUP_B_CZ_Soldier_MG_DES",35,0,0],                                 // Machinegunner
    ["CUP_B_CZ_Soldier_Marksman_DES",30,0,0],                           // Marksman (SVD)
    ["CUP_B_CZ_Soldier_AT_DES",50,10,0],                                // Rifleman (AT)
    ["B_soldier_AA_F",50,10,0],                                         // AA Specialist
    ["CUP_B_CZ_Medic_DES",30,0,0],                                      // Medic
    ["CUP_B_CZ_Engineer_DES",30,0,0],                                   // Engineer
    ["CUP_B_CZ_ExplosiveSpecialist_DES",30,0,0],                        // Explosive Specialist
    ["CUP_B_CZ_SpecOps_Scout_DES",20,0,0],                              // SF Scout
    ["CUP_B_CZ_SpecOps_Exp_DES",30,0,0],                                // SF Saboteur
    ["CUP_B_CZ_SpecOps_Recon_DES",30,0,0],                              // SF Recon
    ["CUP_B_CZ_SpecOps_DES",40,0,0],                                    // SF Rifleman
    ["CUP_B_CZ_SpecOps_MG_DES",30,0,0],                                 // SF Machinegunner
    ["CUP_B_CZ_SpecOps_TL_DES",30,0,0],                                 // SF Team Leader
    ["CUP_B_CZ_Sniper_DES",70,5,0],                                     // Sniper
    ["CUP_B_CZ_Spotter_DES",20,0,0],                                    // Spotter
    ["CUP_B_CZ_Crew_DES",10,0,0],                                       // Crewman
    ["CUP_B_CZ_Soldier_DES",20,0,0],                                    // Para Trooper
    ["CUP_B_CZ_Pilot_DES",10,0,0]                                       // Pilot
];

light_vehicles = [
    ["CUP_B_UAZ_Unarmed_ACR",100,0,50],                                 // UAZ
    ["CUP_B_UAZ_Open_ACR",100,0,50],                                    // UAZ (Open)
    ["CUP_B_UAZ_MG_ACR",100,40,50],                                     // UAZ (DShKM)
    ["CUP_B_UAZ_AGS30_ACR",100,60,50],                                  // UAZ (AGS-30)
    ["CUP_B_UAZ_SPG9_ACR",100,80,50],                                   // UAZ (SPG-9)
    ["CUP_B_UAZ_METIS_ACR",100,100,50],                                 // UAZ (Metis-M)
    ["CUP_B_LR_Transport_CZ_D",200,0,50],                               // Land Rover 110 (Transport) Desert
    ["CUP_B_LR_MG_CZ_D",200,40,50],                                     // Land Rover 110 (M2) Desert
    ["CUP_B_LR_Special_CZ_D",250,100,50],                               // Land Rover 110 (Special) Desert
    ["CUP_B_HMMWV_Ambulance_ACR",225,0,50],                             // HMMWV (Ambulance)
    ["CUP_B_HMMWV_DSHKM_GPK_ACR",225,60,50],                            // HMMWV M1114 DSHKM
    ["CUP_B_HMMWV_M2_GPK_ACR",225,60,50],                               // HMMWV M1114 M2
    ["CUP_B_HMMWV_AGS_GPK_ACR",225,80,50],                              // HMMWV M1114 AGS
    ["CUP_B_Dingo_CZ_Des",250,40,100],                                  // Dingo 2 (MG) (Desert)
    ["CUP_B_Dingo_GL_CZ_Des",250,60,100],                               // Dingo 2 (GL) (Desert)
    ["QIN_Titus_DES",350,0,50],                                         // Nexter Titus
    ["QIN_Titus_arx20_DES",350,225,50],                                 // Nexter Titus ARX20
    ["CUP_B_T810_Unarmed_CZ_DES",125,0,75],                             // Tatra T810 (Covered)
    ["CUP_B_T810_Armed_CZ_DES",125,60,75]                               // Tatra T810 (MG/Covered)
];

heavy_vehicles = [
    ["CUP_B_BRDM2_HQ_CZ_Des",200,25,200],                               // BRDM-2 (HQ) (Desert)
    ["CUP_B_BRDM2_CZ_Des",200,200,200],                                 // BRDM-2 (Desert)
    ["I_APC_Wheeled_03_cannon_F",500,400,300],                          // Pandur II
    ["CUP_I_BMP1_TK_GUE",300,300,200],                                  // BVP-1
    ["CUP_B_BMP2_CZ_Des",400,350,200],                                  // BVP-2
    ["CUP_B_BMP2_AMB_CZ_Des",350,0,200],                                // BVP-2 Ambulance
    ["B_APC_Tracked_01_AA_F",500,450,400],                              // IFV-6a Cheetah
    ["CUP_O_T72_RU",600,500,400],                                       // T-72
    ["CUP_B_T72_CZ",800,500,450]                                        // T-72M4CZ
];

air_vehicles = [
    ["CUP_B_Mi171Sh_ACR",700,600,500],                                  // Mi-171Sh (Rockets)
    ["CUP_B_Mi35_Dynamic_CZ",850,1000,550],                             // Mi-35
    ["CUP_B_Mi35_Dynamic_CZ_Dark",850,1000,550],                        // Mi-35 (Dark)
    ["CUP_B_Mi35_Dynamic_CZ_Ram",850,1000,550],                         // Mi-35 (Ram)
    ["CUP_B_Mi35_Dynamic_CZ_Tiger",850,1000,550],                       // Mi-35 (Tiger)
    ["CUP_B_L39_CZ_GREY",1200,1250,650],                                // L-39ZA (Grey)
    ["I_Plane_Fighter_03_dynamicLoadout_F",1200,1250,550],              // L-159 Alca
    ["I_Plane_Fighter_04_F",1500,1400,800]                              // JAS 39 Gripen
];

static_vehicles = [
    ["CUP_B_DSHKM_ACR",25,40,0],                                        // DShKM
    ["CUP_B_AGS_ACR",35,60,0],                                          // AGS-30
    ["CUP_B_2b14_82mm_ACR",80,150,0],                                   // Podnos 2B14
    ["CUP_B_RBS70_ACR",100,200,0]                                       // RBS 70
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["FlagCarrierCzechRepublic_EP1",0,0,0],
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
    ["CUP_B_TowingTractor_CZ",50,0,25],                                 // Towing Tractor
    ["CUP_B_T810_Repair_CZ_DES",325,0,75],                              // Tatra T810 (Repair)
    ["CUP_B_T810_Refuel_CZ_DES",125,0,275],                             // Tatra T810 (Fuel)
    ["CUP_B_T810_Reammo_CZ_DES",125,200,75],                            // Tatra T810 (Ammo)
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
    "CUP_B_CZ_Soldier_SL_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_RPG_DES",
    "CUP_B_CZ_Soldier_805_GL_DES",
    "CUP_B_CZ_Soldier_AR_DES",
    "CUP_B_CZ_Soldier_AR_DES",
    "CUP_B_CZ_Soldier_Marksman_DES",
    "CUP_B_CZ_Medic_DES",
    "CUP_B_CZ_Engineer_DES"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "CUP_B_CZ_Soldier_SL_DES",
    "CUP_B_CZ_Soldier_RPG_DES",
    "CUP_B_CZ_Soldier_RPG_DES",
    "CUP_B_CZ_Soldier_805_GL_DES",
    "CUP_B_CZ_Soldier_AR_DES",
    "CUP_B_CZ_Soldier_AR_DES",
    "CUP_B_CZ_Soldier_MG_DES",
    "CUP_B_CZ_Soldier_Marksman_DES",
    "CUP_B_CZ_Medic_DES",
    "CUP_B_CZ_Engineer_DES"
];

// AT specialists squad.
blufor_squad_at = [
    "CUP_B_CZ_Soldier_SL_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_AT_DES",
    "CUP_B_CZ_Soldier_AT_DES",
    "CUP_B_CZ_Soldier_AT_DES",
    "CUP_B_CZ_Medic_DES",
    "CUP_B_CZ_Engineer_DES"
];

// AA specialists squad.
blufor_squad_aa = [
    "CUP_B_CZ_Soldier_SL_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "CUP_B_CZ_Medic_DES",
    "CUP_B_CZ_Engineer_DES"
];

// Force recon squad.
blufor_squad_recon = [
    "CUP_B_CZ_SpecOps_TL_DES",
    "CUP_B_CZ_SpecOps_Recon_DES",
    "CUP_B_CZ_SpecOps_Recon_DES",
    "CUP_B_CZ_Soldier_RPG_DES",
    "CUP_B_CZ_SpecOps_MG_DES",
    "CUP_B_CZ_SpecOps_MG_DES",
    "CUP_B_CZ_SpecOps_GL_DES",
    "CUP_B_CZ_SpecOps_GL_DES",
    "CUP_B_CZ_Medic_DES",
    "CUP_B_CZ_Engineer_DES"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES",
    "CUP_B_CZ_Soldier_DES"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_B_Dingo_CZ_Des",                                               // Dingo 2 (MG) (Desert)
    "CUP_B_Dingo_GL_CZ_Des",                                            // Dingo 2 (GL) (Desert)
    "QIN_Titus_WDL",                                                    // Nexter Titus
    "QIN_Titus_arx20_WDL",                                              // Nexter Titus ARX20
    "I_APC_Wheeled_03_cannon_F",                                        // Pandur II
    "CUP_B_BMP2_CZ_Des",                                                // BVP-2
    "B_APC_Tracked_01_AA_F",                                            // IFV-6a Cheetah
    "CUP_B_T72_CZ",                                                     // T-72M4CZ
    "CUP_B_L39_CZ_GREY",                                                // L-39ZA (Grey)
    "I_Plane_Fighter_03_dynamicLoadout_F",                              // L-159 Alca
    "I_Plane_Fighter_04_F"                                              // JAS 39 Gripen
];
