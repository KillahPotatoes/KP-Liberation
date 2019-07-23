/*
    Needed Mods:
    - None

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
FOB_box_typename = "Land_Pod_Heli_Transport_04_box_F";                  // This is the FOB as a container.
FOB_truck_typename = "O_Truck_03_device_F";                             // This is the FOB as a vehicle.
Arsenal_typename = "O_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "O_Truck_03_medical_F";                        // This is the mobile respawn (and medical) truck.
huron_typename = "O_Heli_Transport_04_F";                               // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "O_crew_F";                                         // This defines the crew for vehicles.
pilot_classname = "O_helipilot_F";                                      // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "O_Heli_Light_02_unarmed_F";      // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "O_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "O_Truck_03_transport_F";               // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "O_Radar_System_02_F";             // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";             // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                       // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "O_CargoNet_01_ammo_F";                      // This defines the ammunition crates.
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
    ["O_Soldier_lite_F",15,0,0],                                        // Rifleman (Light)
    ["O_Soldier_F",20,0,0],                                             // Rifleman
    ["O_Soldier_LAT_F",30,0,0],                                         // Rifleman (AT)
    ["O_Soldier_GL_F",25,0,0],                                          // Grenadier
    ["O_Soldier_AR_F",25,0,0],                                          // Autorifleman
    ["O_HeavyGunner_F",30,0,0],                                         // Autorifleman Heavy
    ["O_soldier_M_F",30,0,0],                                           // Marksman
    ["O_Soldier_AT_F",50,10,0],                                         // AT Specialist
    ["O_Soldier_AA_F",50,10,0],                                         // AA Specialist
    ["O_medic_F",30,0,0],                                               // Combat Life Saver
    ["O_engineer_F",30,0,0],                                            // Engineer
    ["O_sniper_F",70,5,0],                                              // Sniper
    ["O_spotter_F",20,0,0],                                             // Spotter
    ["O_crew_F",10,0,0],                                                // Crewman
    ["O_soldier_PG_F",20,0,0],                                          // Para Trooper
    ["O_helipilot_F",10,0,0],                                           // Helicopter Pilot
    ["O_Pilot_F",10,0,0]                                                // Pilot
];

light_vehicles = [
    ["O_Quadbike_01_F",50,0,25],                                        // Quad Bike
    ["O_LSV_02_unarmed_F",75,0,50],                                     // LSV Mk2
    ["O_LSV_02_armed_F",75,75,50],                                      // LSV Mk2 (M134)
    ["O_LSV_02_AT_F",75,75,50],                                         // LSV Mk2 (Metis)
    ["O_MRAP_02_F",100,0,50],                                           // Karatel
    ["O_MRAP_02_hmg_F",100,100,50],                                     // Karatel HMG
    ["O_MRAP_02_gmg_F",100,100,50],                                     // Karatel GMG
    ["O_Truck_03_transport_F",125,0,75],                                // Typhoon Transport
    ["O_Truck_03_covered_F",125,0,75],                                  // Typhoon Transport (Covered)
    ["O_UGV_01_F",150,0,50],                                            // UGV Saif
    ["O_UGV_01_rcws_F",150,40,50],                                      // UGV Saif (RCWS)
    ["O_Boat_Transport_01_F",100,0,25],                                 // Assault Boat
    ["O_Boat_Armed_01_hmg_F",200,80,75],                                // Speedboat HMG
    ["O_SDV_01_F",150,0,50]                                             // SDV
];

heavy_vehicles = [
    ["O_APC_Wheeled_02_rcws_v2_F",200,150,150],                         // Otokar
    ["O_APC_Tracked_02_cannon_F",200,200,150],                          // Stalker
    ["O_APC_Tracked_02_AA_F",300,250,175],                              // Tigris
    ["O_MBT_02_cannon_F",500,400,250],                                  // T-100
    ["O_MBT_04_cannon_F",550,450,250],                                  // T-14
    ["O_MBT_04_command_F",550,500,250],                                 // T-14K
    ["O_MBT_02_arty_F",600,1250,300]                                    // Sochor
];

air_vehicles = [
    ["O_UAV_01_F",75,0,25],                                             // Tayran
    ["O_UAV_06_F",80,0,30],                                             // Jinaah
    ["O_Heli_Light_02_unarmed_F",250,0,150],                            // Ka-60 Kasatka (unarmed)
    ["O_Heli_Light_02_dynamicLoadout_F",250,100,150],                   // Ka-60 Kasatka
    ["O_Heli_Transport_04_bench_F",250,0,150],                          // Taru Bench
    ["O_Heli_Transport_04_covered_F",300,0,150],                        // Taru Covered
    ["O_Heli_Transport_04_medevac_F",300,0,150],                        // Taru Medical
    ["O_Heli_Attack_02_dynamicLoadout_F",800,800,250],                  // Kajman
    ["O_UAV_02_dynamicLoadout_F",450,500,250],                          // YABHON
    ["O_T_UAV_04_CAS_F",400,300,200],                                   // Burraq
    ["O_Plane_CAS_02_dynamicLoadout_F",1000,800,400],                   // YAK-130
    ["O_Plane_Fighter_02_F",1500,1750,450],                             // Shikra
    ["O_T_VTOL_02_infantry_dynamicLoadout_F",950,800,500],              // Xian (Infantry)
    ["O_T_VTOL_02_vehicle_dynamicLoadout_F",950,800,500]                // Xian (Vehicle)
];

static_vehicles = [
    ["O_Static_Designator_02_F",25,0,0],                                // Remote Designator
    ["O_HMG_01_F",25,40,0],                                             // Mk30A HMG .50
    ["O_HMG_01_high_F",25,40,0],                                        // Mk30 HMG .50 (Raised)
    ["O_HMG_01_A_F",35,40,0],                                           // Mk30 HMG .50 (Autonomous)
    ["O_GMG_01_F",35,60,0],                                             // Mk32A GMG 20mm
    ["O_GMG_01_high_F",35,60,0],                                        // Mk32 GMG 20mm (Raised)
    ["O_GMG_01_A_F",45,60,0],                                           // Mk32 GMG 20mm (Autonomous)
    ["O_static_AT_F",50,100,0],                                         // Static Titan Launcher (AT)
    ["O_static_AA_F",50,100,0],                                         // Static Titan Launcher (AA)
    ["O_Mortar_01_F",80,150,0],                                         // Mk6 Mortar
    ["O_SAM_System_04_F",250,500,0]                                     // S-750 Rhea
];

buildings = [
    ["Land_Cargo_House_V3_F",0,0,0],
    ["Land_Cargo_Patrol_V3_F",0,0,0],
    ["Land_Cargo_Tower_V3_F",0,0,0],
    ["Flag_CSAT_F",0,0,0],
    ["Flag_Viper_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_OPFOR_F",0,0,0],
    ["CamoNet_OPFOR_open_F",0,0,0],
    ["CamoNet_OPFOR_big_F",0,0,0],
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
    ["Land_Razorwire_F",0,0,0]
];

support_vehicles = [
    [Respawn_truck_typename,200,0,100],
    [FOB_box_typename,300,500,0],
    [FOB_truck_typename,300,500,75],
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,200,100,0],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_plane_slot_building,500,0,0],
    [Arsenal_typename,25,0,0],
    ["ACE_medicalSupplyCrate_advanced",10,0,0],
    ["Box_East_Support_F",10,0,0],
    ["Box_CSAT_Equip_F",10,0,0],
    ["Box_East_Grenades_F",10,0,0],
    ["Box_East_WpsSpecial_F",10,0,0],
    ["Box_East_Ammo_F",10,0,0],
    ["Box_East_Wps_F",10,0,0],
    ["Box_CSAT_Uniforms_F",10,0,0],
    ["Box_East_AmmoOrd_F",10,0,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["Land_CanisterFuel_F",0,0,2],
    ["O_Truck_03_repair_F",325,0,75],                                   // Typhoon Repair
    ["O_Truck_03_ammo_F",125,200,75],                                   // Typhoon Ammo
    ["O_Truck_03_fuel_F",125,0,275],                                    // Typhoon Fuel
    ["O_Heli_Transport_04_repair_F",500,0,150],                         // Taru Repair
    ["O_Heli_Transport_04_ammo_F",300,200,150],                         // Taru Ammo
    ["O_Heli_Transport_04_fuel_F",300,0,350],                           // Taru Fuel
    ["Land_Pod_Heli_Transport_04_repair_F",275,0,0],                    // Taru Repaircontainer
    ["Land_Pod_Heli_Transport_04_ammo_F",75,200,0],                     // Taru Ammocontainer
    ["Land_Pod_Heli_Transport_04_fuel_F",75,0,200]                      // Taru Fuelcontainer
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "O_Soldier_SL_F",
    "O_Soldier_TL_F",
    "O_Soldier_TL_F",
    "O_Soldier_AR_F",
    "O_Soldier_AR_F",
    "O_Soldier_GL_F",
    "O_Soldier_GL_F",
    "O_Soldier_LAT_F",
    "O_medic_F",
    "O_soldier_M_F"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "O_Soldier_TL_F",
    "O_HeavyGunner_F",
    "O_Soldier_A_F",
    "O_HeavyGunner_F",
    "O_Soldier_A_F",
    "O_HeavyGunner_F",
    "O_Soldier_A_F",
    "O_HeavyGunner_F",
    "O_Soldier_A_F",
    "O_medic_F"
];

// AT specialists squad.
blufor_squad_at = [
    "O_Soldier_TL_F",
    "O_Soldier_AT_F",
    "O_Soldier_HAT_F",
    "O_Soldier_AT_F",
    "O_Soldier_HAT_F",
    "O_Soldier_AT_F",
    "O_Soldier_HAT_F",
    "O_medic_F"
];

// AA specialists squad.
blufor_squad_aa = [
    "O_Soldier_TL_F",
    "O_Soldier_AA_F",
    "O_Soldier_AAA_F",
    "O_Soldier_AA_F",
    "O_Soldier_AAA_F",
    "O_Soldier_AA_F",
    "O_Soldier_AAA_F",
    "O_medic_F"
];

// Force recon squad.
blufor_squad_recon = [
    "O_recon_TL_F",
    "O_recon_F",
    "O_recon_F",
    "O_recon_LAT_F",
    "O_recon_JTAC_F",
    "O_recon_M_F",
    "O_sniper_F",
    "O_spotter_F",
    "O_recon_medic_F",
    "O_recon_exp_F"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F",
    "O_soldier_PG_F"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "O_MBT_04_cannon_F",                                                // T-14
    "O_MBT_04_command_F",                                               // T-14K
    "O_MBT_02_arty_F",                                                  // Sochor
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Kajman
    "O_UAV_02_dynamicLoadout_F",                                        // YABHON
    "O_T_UAV_04_CAS_F",                                                 // Burraq
    "O_Plane_CAS_02_dynamicLoadout_F",                                  // YAK-130
    "O_Plane_Fighter_02_F",                                             // Shikra
    "O_T_VTOL_02_infantry_dynamicLoadout_F",                            // Xian (Infantry)
    "O_T_VTOL_02_vehicle_dynamicLoadout_F"                              // Xian (Vehicle)
];
