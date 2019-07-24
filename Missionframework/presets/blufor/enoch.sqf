/*
    Needed Mods:
    - Contact DLC

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V4_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "B_T_Truck_01_box_F";                              // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "I_E_Truck_02_Medical_F";                      // This is the mobile respawn (and medical) truck.
huron_typename = "B_Heli_Transport_03_unarmed_F";                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "I_E_Crew_F";                                       // This defines the crew for vehicles.
pilot_classname = "I_E_Helipilot_F";                                    // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "B_Heli_Light_01_F";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_T_Boat_Transport_01_F";               // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "I_E_Truck_02_transport_F";             // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_green_F";         // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "I_E_Radar_System_01_F";           // The building defined to unlock FOB air vehicle functionality.
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
    ["I_E_Soldier_lite_F",15,0,0],                                      // Rifleman (Light)
    ["I_E_Soldier_F",20,0,0],                                           // Rifleman
    ["I_E_Soldier_LAT2_F",30,0,0],                                      // Rifleman (AT)
    ["I_E_Soldier_GL_F",25,0,0],                                        // Grenadier
    ["I_E_Soldier_AR_F",25,0,0],                                        // Autorifleman
    ["I_E_soldier_M_F",30,0,0],                                         // Marksman
    ["I_E_Soldier_AT_F",50,10,0],                                       // AT Specialist
    ["I_E_Soldier_AA_F",50,10,0],                                       // AA Specialist
    ["I_E_Medic_F",30,0,0],                                             // Combat Life Saver
    ["I_E_Engineer_F",30,0,0],                                          // Engineer
    ["I_E_Soldier_Exp_F",30,0,0],                                       // Explosives Specialist
    ["B_T_Recon_F",20,0,0],                                             // Recon Scout
    ["B_T_Recon_LAT_F",30,0,0],                                         // Recon Scout (AT)
    ["B_T_Recon_M_F",30,0,0],                                           // Recon Marksman
    ["B_T_Recon_Medic_F",30,0,0],                                       // Recon Paramedic
    ["B_T_Recon_exp_F",30,0,0],                                         // Recon Demolition Expert
    ["B_T_Sniper_F",70,5,0],                                            // Sniper
    ["B_ghillie_lsh_F",70,5,0],                                         // Sniper (Green)
    ["B_T_Spotter_F",20,0,0],                                           // Spotter
    ["I_E_Crew_F",10,0,0],                                              // Crewman
    ["B_T_Soldier_PG_F",20,0,0],                                        // Para Trooper
    ["I_E_Helicrew_F",10,0,0],                                          // Helicopter Crew
    ["I_E_Helipilot_F",10,0,0],                                         // Helicopter Pilot
    ["B_T_Pilot_F",10,0,0]                                              // Pilot
];

light_vehicles = [
    ["I_E_Quadbike_01_F",50,0,25],                                      // Quad Bike
    ["I_E_Offroad_01_F",60,0,35],                                       // Offroad
    ["I_E_Offroad_01_covered_F",60,0,35],                               // Offroad (Covered)
    ["I_E_Offroad_01_comms_F",60,0,35],                                 // Offroad (Comms)
    ["I_E_Van_02_vehicle_F",70,0,45],                                   // Transporter
    ["I_E_Van_02_transport_MP_F",70,0,45],                              // Transporter (MP)
    ["I_E_Van_02_transport_F",70,0,45],                                 // Transporter (Transporter)
    ["B_T_LSV_01_unarmed_F",75,0,50],                                   // Prowler
    ["B_T_LSV_01_armed_F",75,40,50],                                    // Prowler (HMG)
    ["B_T_LSV_01_AT_F",75,60,50],                                       // Prowler (AT)
    ["I_E_Truck_02_transport_F",125,0,75],                              // Zamak Transport
    ["I_E_Truck_02_F",125,0,75],                                        // Zamak Transport (Covered)
    ["B_UGV_01_F",150,0,50],                                            // UGV Stomper
    ["B_UGV_01_rcws_F",150,40,50],                                      // UGV Stomper (RCWS)
    ["B_T_Boat_Transport_01_F",100,0,25],                               // Assault Boat
    ["B_T_Boat_Armed_01_minigun_F",200,80,75]                           // Speedboat Minigun
];

heavy_vehicles = [
    ["B_T_APC_Wheeled_01_cannon_F",200,75,125],                         // AMV-7 Marshall
    ["I_E_APC_tracked_03_cannon_F",300,150,150],                        // FV-720 Odyniec
    ["B_T_APC_Tracked_01_AA_F",300,250,175],                            // IFV-6a Cheetah
    ["B_T_MBT_01_cannon_F",400,300,200],                                // M2A1 Slammer
    ["B_T_MBT_01_TUSK_F",500,350,225],                                  // M2A4 Slammer UP
    ["B_T_AFV_Wheeled_01_cannon_F",500,500,250],                        // Rhino MGS
    ["B_T_AFV_Wheeled_01_up_cannon_F",550,550,250],                     // Rhino MGS UP
    ["I_E_Truck_02_MRL_F",600,1250,300]                                 // Zamak MRL
];

air_vehicles = [
    ["I_E_UAV_01_F",75,0,25],                                           // AR-2 Darter
    ["I_E_UAV_06_F",80,0,30],                                           // AL-6 Pelican
    ["B_Heli_Light_01_F",200,0,100],                                    // MH-9 Hummingbird
    ["I_E_Heli_light_03_unarmed_F",225,0,125],                          // WY-55 Czapla
    ["I_E_Heli_light_03_dynamicLoadout_F",225,200,125],                 // WY-55 Czapla (Armed)
    ["B_Heli_Transport_03_F",300,80,175],                               // CH-67 Huron (Armed)
    ["B_Heli_Attack_01_dynamicLoadout_F",500,400,200],                  // AH-99 Blackfoot
    ["B_UAV_02_dynamicLoadout_F",400,300,200],                          // MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",450,500,250],                        // MQ-12 Falcon
    ["B_UAV_05_F",500,500,200],                                         // UCAV Sentinel
    ["B_Plane_CAS_01_dynamicLoadout_F",1000,800,400],                   // A-164 Wipeout (CAS)
    ["B_Plane_Fighter_01_F",1500,1750,450],                             // F/A-181 Black Wasp II
    ["B_Plane_Fighter_01_Stealth_F",1500,1750,450],                     // F/A-181 Black Wasp II (Stealth)
    ["B_T_VTOL_01_armed_F",750,1500,500],                               // V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",750,0,500],                               // V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",750,0,500]                                 // V-44 X Blackfish (Vehicle)
];

static_vehicles = [
    ["B_W_Static_Designator_01_F",25,0,0],                              // Remote Designator
    ["I_E_HMG_01_F",25,40,0],                                           // Mk30A HMG .50
    ["I_E_HMG_01_high_F",25,40,0],                                      // Mk30 HMG .50 (Raised)
    ["I_E_HMG_01_A_F",35,40,0],                                         // Mk30 HMG .50 (Autonomous)
    ["I_E_GMG_01_F",35,60,0],                                           // Mk32A GMG 20mm
    ["I_E_GMG_01_high_F",35,60,0],                                      // Mk32 GMG 20mm (Raised)
    ["I_E_GMG_01_A_F",45,60,0],                                         // Mk32 GMG 20mm (Autonomous)
    ["I_E_Static_AT_F",50,100,0],                                       // Static Titan Launcher (AT)
    ["I_E_Static_AA_F",50,100,0],                                       // Static Titan Launcher (AA)
    ["I_E_Mortar_01_F",80,150,0],                                       // Mk6 Mortar
    ["I_E_SAM_System_03_F",250,500,0]                                   // MIM-145 Defender
];

buildings = [
    ["Land_Cargo_House_V4_F",0,0,0],
    ["Land_Cargo_Patrol_V4_F",0,0,0],
    ["Land_Cargo_Tower_V4_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["Flag_EAF_F",0,0,0],
    ["Flag_Enoch_F",0,0,0],
    ["Flag_UK_F",0,0,0],
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
    ["Land_ClutterCutter_large_F",0,0,0]
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
    ["I_E_Van_02_medevac_F",150,0,80],                                  // Transporter (Ambulance)
    ["I_E_Truck_02_Box_F",325,0,75],                                    // Zamak Repair
    ["I_E_Truck_02_fuel_F",125,0,275],                                  // Zamak Fuel
    ["I_E_Truck_02_Ammo_F",125,200,75],                                 // Zamak Ammo
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
    "I_E_Soldier_TL_F",
    "I_E_Soldier_F",
    "I_E_Soldier_F",
    "I_E_Soldier_LAT2_F",
    "I_E_Soldier_GL_F",
    "I_E_Soldier_AR_F",
    "I_E_Soldier_AR_F",
    "I_E_soldier_M_F",
    "I_E_Medic_F",
    "I_E_Engineer_F"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "I_E_Soldier_TL_F",
    "I_E_Soldier_LAT2_F",
    "I_E_Soldier_LAT2_F",
    "I_E_Soldier_GL_F",
    "I_E_Soldier_AR_F",
    "I_E_Soldier_AR_F",
    "I_E_Soldier_AR_F",
    "I_E_soldier_M_F",
    "I_E_Medic_F",
    "I_E_Engineer_F"
];

// AT specialists squad.
blufor_squad_at = [
    "I_E_Soldier_TL_F",
    "I_E_Soldier_F",
    "I_E_Soldier_F",
    "I_E_Soldier_AT_F",
    "I_E_Soldier_AT_F",
    "I_E_Soldier_AT_F",
    "I_E_Medic_F",
    "I_E_Soldier_F"
];

// AA specialists squad.
blufor_squad_aa = [
    "I_E_Soldier_TL_F",
    "I_E_Soldier_F",
    "I_E_Soldier_F",
    "I_E_Soldier_AA_F",
    "I_E_Soldier_AA_F",
    "I_E_Soldier_AA_F",
    "I_E_Medic_F",
    "I_E_Soldier_F"
];

// Force recon squad.
blufor_squad_recon = [
    "B_T_Recon_TL_F",
    "B_T_Recon_F",
    "B_T_Recon_F",
    "B_T_Recon_LAT_F",
    "B_T_Recon_M_F",
    "B_T_Recon_M_F",
    "B_T_Sniper_F",
    "B_T_Spotter_F",
    "B_T_Recon_Medic_F",
    "B_T_Recon_Exp_F"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F",
    "B_T_Soldier_PG_F"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "B_T_MBT_01_TUSK_F",                                                // M2A4 Slammer UP
    "B_T_AFV_Wheeled_01_cannon_F",                                      // Rhino MGS
    "B_T_AFV_Wheeled_01_up_cannon_F",                                   // Rhino MGS UP
    "I_E_Truck_02_MRL_F",                                               // Zamak MRL
    "B_Heli_Attack_01_dynamicLoadout_F",                                // AH-99 Blackfoot
    "B_UAV_02_dynamicLoadout_F",                                        // MQ-4A Greyhawk
    "B_T_UAV_03_dynamicLoadout_F",                                      // MQ-12 Falcon
    "B_UAV_05_F",                                                       // UCAV Sentinel
    "B_Plane_CAS_01_dynamicLoadout_F",                                  // A-164 Wipeout (CAS)
    "B_Plane_Fighter_01_F",                                             // F/A-181 Black Wasp II
    "B_Plane_Fighter_01_Stealth_F",                                     // F/A-181 Black Wasp II (Stealth)
    "B_T_VTOL_01_armed_F"                                               // V-44 X Blackfish (Armed)
];
