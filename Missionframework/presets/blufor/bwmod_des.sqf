/*
    Needed Mods:
    - BWMod
    - RHS USAF

    Optional Mods:
    - F-15C
    - F/A-18
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V3_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy";             // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy";    // This is the mobile respawn (and medical) truck.
huron_typename = "RHS_CH_47F";                                          // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "BWA3_Crew_Tropen";                                 // This defines the crew for vehicles.
pilot_classname = "BWA3_Helipilot";                                     // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "RHS_MELB_MH6M";                  // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "rhsusf_M977A4_BKIT_usarmy_d";          // These are the trucks which are used in the logistic convoy system.
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
    ["BWA3_Rifleman_lite_Tropen",15,0,0],                               // Rifleman (Light)
    ["BWA3_Rifleman_Tropen",20,0,0],                                    // Rifleman
    ["BWA3_RiflemanG27_Tropen",20,0,0],                                 // Rifleman (G27)
    ["BWA3_RiflemanG28_Tropen",20,0,0],                                 // Rifleman (G28)
    ["BWA3_RiflemanAT_Pzf3_Tropen",30,0,0],                             // Rifleman (AT)
    ["BWA3_Grenadier_Tropen",25,0,0],                                   // Grenadier
    ["BWA3_Autorifleman_Tropen",25,0,0],                                // Autorifleman
    ["BWA3_AutoriflemanMG5_Tropen",35,0,0],                             // Heavygunner
    ["BWA3_Marksman_Tropen",30,0,0],                                    // Marksman
    ["BWA3_RiflemanAT_RGW90_Tropen",50,10,0],                           // AT Specialist
    ["BWA3_RiflemanAA_Fliegerfaust_Tropen",50,10,0],                    // AA Specialist
    ["BWA3_CombatLifeSaver_Tropen",30,0,0],                             // Combat Life Saver
    ["BWA3_Engineer_Tropen",30,0,0],                                    // Engineer
    ["BWA3_recon_Tropen",20,0,0],                                       // Recon Rifleman
    ["BWA3_recon_LAT_Tropen",30,0,0],                                   // Recon Rifleman (AT)
    ["BWA3_recon_Radioman_Tropen",25,0,0],                              // Recon Radioman
    ["BWA3_recon_Marksman_Tropen",30,0,0],                              // Recon Marksman
    ["BWA3_recon_Medic_Tropen",30,0,0],                                 // Recon Combat Life Saver
    ["BWA3_recon_Pioneer_Tropen",30,0,0],                               // Recon Engineer
    ["BWA3_SniperG82_Tropen",70,5,0],                                   // Sniper
    ["BWA3_Spotter_Tropen",20,0,0],                                     // Spotter
    ["BWA3_Crew_Tropen",10,0,0],                                        // Crewman
    ["rhsusf_army_ocp_rifleman_101st",20,0,0],                          // Para Trooper
    ["BWA3_Helipilot",10,0,0],                                          // Helicopter Pilot
    ["rhsusf_airforce_jetpilot",10,0,0]                                 // Pilot
];

light_vehicles = [
    ["B_Quadbike_01_F",50,0,25],                                        // Quad Bike
    ["rhsusf_m1025_d",100,0,50],                                        // M1025A2
    ["rhsusf_m1025_d_m2",100,40,50],                                    // M1025A2 (M2)
    ["rhsusf_m1025_d_Mk19",100,60,50],                                  // M1025A2 (Mk19)
    ["rhsusf_m998_d_2dr_fulltop",100,0,50],                             // M1097A2 (2D)
    ["rhsusf_m998_d_2dr_halftop",100,0,50],                             // M1097A2 (2D / open back)
    ["BWA3_Eagle_Tropen",100,0,50],                                     // Eagle IV
    ["BWA3_Eagle_FLW100_Tropen",100,100,50],                            // Eagle IV (FLW 100)
    ["rhsusf_M1220_usarmy_d",120,0,60],                                 // M1220
    ["rhsusf_M1220_M2_usarmy_d",120,40,60],                             // M1220 (M2)
    ["rhsusf_M1220_MK19_usarmy_d",120,60,60],                           // M1220 (Mk19)
    ["rhsusf_M1232_usarmy_d",140,0,60],                                 // M1232
    ["rhsusf_M1232_M2_usarmy_d",140,40,60],                             // M1232 (M2)
    ["rhsusf_M1232_MK19_usarmy_d",140,60,60],                           // M1232 (Mk19)
    ["rhsusf_M1230a1_usarmy_wd",120,0,60],                              // M1230A1 (MEDEVAC)
    ["rhsusf_M1083A1P2_D_open_fmtv_usarmy",125,0,75],                   // M1083A1P2 Transport
    ["rhsusf_M1083A1P2_D_fmtv_usarmy",125,0,75],                        // M1083A1P2 Transport (Covered)
    ["rhsusf_M1083A1P2_D_flatbed_fmtv_usarmy",100,0,50],                // M1083A1P2
    ["rhsusf_M977A4_BKIT_usarmy_d",125,0,75],                           // M977A4 BKIT
    ["rhsusf_M977A4_BKIT_M2_usarmy_d",125,40,75],                       // M977A4 BKIT (HMG)
    ["rhsusf_M1117_D",150,50,50],                                       // M1117 ASV
    ["B_UGV_01_F",150,0,50],                                            // UGV Stomper
    ["B_UGV_01_rcws_F",150,40,50],                                      // UGV Stomper (RCWS)
    ["B_Boat_Transport_01_F",100,0,25],                                 // Assault Boat
    ["B_Boat_Armed_01_minigun_F",200,80,75],                            // Speedboat Minigun
    ["rhsusf_mkvsoc",250,200,100],                                      // Mk.V SOCOM
    ["B_SDV_01_F",150,0,50]                                             // SDV
];

heavy_vehicles = [
    ["rhsusf_m113d_usarmy",200,40,100],                                 // M113A3 (M2)
    ["rhsusf_m113d_usarmy_MK19",200,60,100],                            // M113A3 (Mk19)
    ["rhsusf_m113d_usarmy_medical",200,0,100],                          // M113A3 (Medical)
    ["RHS_M2A2_BUSKI",300,200,150],                                     // M2A2ODS (Busk I)
    ["BWA3_Puma_Tropen",300,225,150],                                   // IFV Puma
    ["RHS_M2A3_BUSKIII",300,250,175],                                   // M2A3 (Busk III)
    ["RHS_M6",300,250,175],                                             // M6A2
    ["rhsusf_m1a1aim_tuski_d",400,350,225],                             // M1A1SA (Tusk I)
    ["rhsusf_m1a2sep1tuskiid_usarmy",500,400,250],                      // M1A2SEPv1 (Tusk II)
    ["BWA3_Leopard2_Tropen",500,400,250],                               // MBT Leopard 2A6M
    ["rhsusf_m109d_usarmy",600,1250,300]                                // M109A6
];

air_vehicles = [
    ["B_UAV_01_F",75,0,25],                                             // AR-2 Darter
    ["B_UAV_06_F",80,0,30],                                             // AL-6 Pelican (Cargo)
    ["RHS_MELB_MH6M",200,0,100],                                        // MH-6M Little Bird
    ["RHS_MELB_AH6M",200,200,100],                                      // AH-6M Pawnee
    ["RHS_UH1Y_UNARMED_d",225,0,125],                                   // UH-1Y (Unarmed)
    ["RHS_UH1Y_d_GS",225,200,125],                                      // UH-1Y (Ground Suppression)
    ["RHS_AH1Z",500,500,200],                                           // AH-1Z (Multi-Role)
    ["RHS_AH64D",750,750,250],                                          // AH-64D (Multi-Role)
    ["BWA3_Tiger_RMK_Universal",750,750,250],                           // UH Tiger RMK (Universal)
    ["RHS_UH60M2_d",250,0,150],                                         // UH-60M (Unarmed)
    ["RHS_UH60M_d",250,80,150],                                         // UH-60M
    ["RHS_UH60M_MEV2_d",300,0,150],                                     // UH-60M MEV2
    ["RHS_CH_47F_10",275,80,175],                                       // CH-47 Chinook (Armed)
    ["rhsusf_CH53E_USMC_D",300,0,175],                                  // CH-53E Super Stallion
    ["rhsusf_CH53E_USMC_GAU21_D",300,100,175],                          // CH-53E Super Stallion (GAU-21)
    ["B_UAV_02_dynamicLoadout_F",400,300,200],                          // MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",450,500,250],                        // MQ-12 Falcon
    ["B_UAV_05_F",500,500,200],                                         // UCAV Sentinel
    ["RHS_A10",1000,1000,400],                                          // A-10A (CAS)
    ["FIR_F15C",1250,1250,450],                                         // F-15C Eagle
    ["FIR_F15D",1250,1250,450],                                         // F-15D Eagle
    ["FIR_F15E",1250,1500,450],                                         // F-15E Strike Eagle
    ["JS_JC_FA18E",1500,1750,450],                                      // F/A-18 E Super Hornet
    ["JS_JC_FA18F",1500,1750,450],                                      // F/A-18 F Super Hornet
    ["B_Plane_Fighter_01_F",1500,1750,450],                             // F/A-181 Black Wasp II
    ["B_Plane_Fighter_01_Stealth_F",1500,1750,450],                     // F/A-181 Black Wasp II (Stealth)
    ["B_T_VTOL_01_armed_F",750,1500,500],                               // V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",750,0,500],                               // V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",750,0,500]                                 // V-44 X Blackfish (Vehicle)
];

static_vehicles = [
    ["RHS_M2StaticMG_MiniTripod_D",25,40,0],                            // Mk2 HMG .50
    ["RHS_M2StaticMG_D",25,40,0],                                       // Mk2 HMG .50 (Raised)
    ["RHS_MK19_TriPod_D",25,60,0],                                      // Mk19 GMG 20mm
    ["RHS_TOW_TriPod_D",50,100,0],                                      // TOW (AT)
    ["RHS_Stinger_AA_pod_D",50,100,0],                                  // Stinger (AA)
    ["RHS_M252_D",80,150,0],                                            // Mk6 Mortar
    ["RHS_M119_D",100,200,0],                                           // M119A2
    ["B_SAM_System_03_F",250,500,0]                                     // MIM-145 Defender
];

buildings = [
    ["Land_Cargo_House_V3_F",0,0,0],
    ["Land_Cargo_Patrol_V3_F",0,0,0],
    ["Land_Cargo_Tower_V3_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
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
    ["B_APC_Tracked_01_CRV_F",500,250,350],                             // CRV-6e Bobcat
    ["rhsusf_M1078A1R_SOV_M2_D_fmtv_socom",400,200,300],                // M1078A1R SOV
    ["rhsusf_M977A4_REPAIR_usarmy_d",325,0,75],                         // M977A4 Repair
    ["rhsusf_M978A4_usarmy_d",125,0,275],                               // M978A4 Fuel
    ["rhsusf_M977A4_AMMO_usarmy_d",125,200,75],                         // M977A4 Ammo
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
    "BWA3_TL_Tropen",
    "BWA3_Rifleman_lite_Tropen",
    "BWA3_Rifleman_lite_Tropen",
    "BWA3_RiflemanAT_Pzf3_Tropen",
    "BWA3_Grenadier_Tropen",
    "BWA3_Autorifleman_Tropen",
    "BWA3_Autorifleman_Tropen",
    "BWA3_Marksman_Tropen",
    "BWA3_CombatLifeSaver_Tropen",
    "BWA3_Engineer_Tropen"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "BWA3_TL_Tropen",
    "BWA3_RiflemanAT_Pzf3_Tropen",
    "BWA3_RiflemanAT_Pzf3_Tropen",
    "BWA3_Grenadier_Tropen",
    "BWA3_Autorifleman_Tropen",
    "BWA3_Autorifleman_Tropen",
    "BWA3_AutoriflemanMG5_Tropen",
    "BWA3_Marksman_Tropen",
    "BWA3_CombatLifeSaver_Tropen",
    "BWA3_Engineer_Tropen"
];

// AT specialists squad.
blufor_squad_at = [
    "BWA3_TL_Tropen",
    "BWA3_Rifleman_Tropen",
    "BWA3_Rifleman_Tropen",
    "BWA3_RiflemanAT_RGW90_Tropen",
    "BWA3_RiflemanAT_RGW90_Tropen",
    "BWA3_RiflemanAT_RGW90_Tropen",
    "BWA3_CombatLifeSaver_Tropen",
    "BWA3_Rifleman_Tropen"
];

// AA specialists squad.
blufor_squad_aa = [
    "BWA3_TL_Tropen",
    "BWA3_Rifleman_Tropen",
    "BWA3_Rifleman_Tropen",
    "BWA3_RiflemanAA_Fliegerfaust_Tropen",
    "BWA3_RiflemanAA_Fliegerfaust_Tropen",
    "BWA3_RiflemanAA_Fliegerfaust_Tropen",
    "BWA3_CombatLifeSaver_Tropen",
    "BWA3_Rifleman_Tropen"
];

// Force recon squad.
blufor_squad_recon = [
    "BWA3_recon_TL_Fleck",
    "BWA3_recon_Fleck",
    "BWA3_recon_Fleck",
    "BWA3_recon_LAT_Fleck",
    "BWA3_recon_Radioman_Fleck",
    "BWA3_recon_Marksman_Fleck",
    "BWA3_SniperG82_Fleck",
    "BWA3_Spotter_Fleck",
    "BWA3_recon_Medic_Tropen",
    "BWA3_recon_Pioneer_Tropen"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "rhsusf_mkvsoc",                                                    // Mk.V SOCOM
    "rhsusf_m1a1aim_tuski_d",                                           // M1A1SA (Tusk I)
    "rhsusf_m1a2sep1tuskiid_usarmy",                                    // M1A2SEPv1 (Tusk II)
    "BWA3_Leopard2_Tropen",                                             // MBT Leopard 2A6M
    "rhsusf_m109d_usarmy",                                              // M109A6
    "RHS_AH64D",                                                        // AH-64D (Multi-Role)
    "BWA3_Tiger_RMK_Universal",                                         // UH Tiger RMK (Universal)
    "B_UAV_02_dynamicLoadout_F",                                        // MQ-4A Greyhawk
    "B_T_UAV_03_dynamicLoadout_F",                                      // MQ-12 Falcon
    "B_UAV_05_F",                                                       // UCAV Sentinel
    "RHS_A10",                                                          // A-10A (CAS)
    "FIR_F15C",                                                         // F-15C Eagle
    "FIR_F15D",                                                         // F-15D Eagle
    "FIR_F15E",                                                         // F-15E Strike Eagle
    "JS_JC_FA18E",                                                      // F/A-18 E Super Hornet
    "JS_JC_FA18F",                                                      // F/A-18 F Super Hornet
    "B_Plane_Fighter_01_F",                                             // F/A-181 Black Wasp II
    "B_Plane_Fighter_01_Stealth_F",                                     // F/A-181 Black Wasp II (Stealth)
    "B_T_VTOL_01_armed_F"                                               // V-44 X Blackfish (Armed)
];
