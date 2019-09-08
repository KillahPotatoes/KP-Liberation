/*
    Needed Mods:
    - RHS AFRF

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "rhs_gaz66_r142_msv";                              // This is the FOB as a vehicle.
Arsenal_typename = "O_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "rhs_gaz66_ap2_msv";                           // This is the mobile respawn (and medical) truck.
huron_typename = "RHS_Mi8mt_vvs";                                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "rhs_msv_emr_armoredcrew";                          // This defines the crew for vehicles.
pilot_classname = "rhs_pilot_combat_heli";                              // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "rhs_ka60_grey";                  // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "O_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "rhs_kamaz5350_flatbed_vdv";            // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_forest_F";   // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_forest_F";   // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "rhs_prv13";                       // The building defined to unlock FOB air vehicle functionality.
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
    ["rhs_vdv_rifleman_lite",15,0,0],                                   // Rifleman (Light)
    ["rhs_vdv_rifleman",20,0,0],                                        // Rifleman
    ["rhs_vdv_LAT",30,0,0],                                             // Rifleman (LAT)
    ["rhs_vdv_grenadier_alt",25,0,0],                                   // Grenadier
    ["rhs_vdv_machinegunner", 25,0,0],                                  // Machinegunner
    ["rhs_vdv_arifleman",30,0,0],                                       // Autorifleman
    ["rhs_vdv_marksman",30,0,0],                                        // Marksman
    ["rhs_vdv_at",50,10,0],                                             // AT Specialist
    ["rhs_vdv_aa",50,10,0],                                             // AA Specialist
    ["rhs_vdv_medic",30,0,0],                                           // Combat Life Saver
    ["rhs_vdv_engineer",30,0,0],                                        // Engineer
    ["rhs_vdv_recon_rifleman",20,0,0],                                  // Recon Rifleman
    ["rhs_vdv_recon_rifleman_lat",30,0,0],                              // Recon Rifleman (AT)
    ["rhs_vdv_recon_arifleman",30,0,0],                                 // Recon Autorifleman
    ["rhs_vdv_recon_arifleman_scout",25,0,0],                           // Recon Autorifleman Scout
    ["rhs_vdv_recon_marksman",30,0,0],                                  // Recon Marksman
    ["rhs_vdv_armoredcrew",10,0,0],                                     // Crewman
    ["rhs_pilot_combat_heli",10,0,0],                                   // Helicopter Pilot
    ["rhs_pilot_transport_heli",10,0,0],                                // Helicopter Pilot Transport
    ["rhs_pilot",10,0,0]                                                // Pilot
];

light_vehicles = [
    ["O_Quadbike_01_F",50,0,25],                                        // Quad Bike
    ["rhs_uaz_vdv",50,0,45],                                            // UAZ
    ["rhs_uaz_open_vdv",50,0,45],                                       // UAZ (Open)
    ["rhs_tigr_m_vdv",100,0,50],                                        // GAZ-233114 (Unarmed)
    ["rhs_tigr_m_3camo_vdv",100,0,50],                                  // GAZ-233114 (Unarmed) Camo
    ["rhs_tigr_sts_vdv",100,60,50],                                     // GAZ-233014 (Armed)
    ["rhs_tigr_sts_3camo_vdv",100,60,50],                               // GAZ-233014 (Armed) Camo
    ["rhs_gaz66_ap2_vdv",120,0,60],                                     // GAZ-66-AP-2 (Medical)
    ["rhs_kamaz5350_vdv",125,0,75],                                     // KamAZ-5350 (covered infantry truck)
    ["RHS_Ural_VDV_01",105,0,75],                                       // Ural-4320 (covered infantry truck)
    ["rhs_kamaz5350_open_vdv",125,0,75],                                // KamaZ-5350 (open infantry truck)
    ["RHS_Ural_Open_VDV_01",105,0,75],                                  // Ural-4320 (open infantry truck)
    ["rhs_pts_vmf",125,0,100],                                          // PTS
    ["rhs_gaz66_zu23_vdv",105,70,65],                                   // GAZ-66 (ZU-23)
    ["rhs_btr60_vdv",150,40,100],                                       // BTR-60PB
    ["rhs_btr70_vdv",180,60,100],                                       // BTR-70
    ["rhs_btr80_vdv",180,80,100],                                       // BTR-80
    ["rhs_btr80a_vdv",220,80,100],                                      // BTR-80A
    ["RHS_BM21_VDV_01",200,1500,200],                                   // BM-21 (Grad)
    ["O_UGV_01_F",150,0,50],                                            // UGV Saif
    ["O_UGV_01_rcws_F",150,40,50],                                      // UGV Saif (RCWS)
    ["O_Boat_Transport_01_F",100,0,25],                                 // Assault Boat
    ["O_Boat_Armed_01_minigun_F",200,80,75],                            // Speedboat Minigun
    ["O_SDV_01_F",150,0,50]                                             // SDV
];

heavy_vehicles = [
    ["rhs_bmp1k_vdv",200,40,100],                                       // BMP-1K
    ["rhs_bmp2k_vdv",240,150,100],                                      // BMP-2K
    ["rhs_bmd2m",260,170,120],                                          // BMD-2M (Berezhok)
    ["rhs_bmd4m_vdv",300,200,150],                                      // BMD-4M
    ["rhs_bmd4ma_vdv",300,250,150],                                     // BMD-4M (Armored)
    ["rhs_zsu234_aa",300,250,175],                                      // ZSU-23-4
    ["rhs_t72bd_tv",400,250,200],                                       // T-72B3
    ["rhs_t80ue1",400,350,250],                                         // T-80UE1
    ["rhs_t90a_tv",500,400,300],                                        // T-90A
    ["rhs_t90sab_tv",600,400,300],                                      // T-90SA (2016)
    ["rhs_t14_tv",600,500,400],                                         // T-14
    ["rhs_2s1_tv",600,1000,300],                                        // 2S1
    ["rhs_2s3_tv",600,1250,300]                                         // 2S3M1
];

air_vehicles = [
    ["O_UAV_01_F",75,0,25],                                             // AR-2 Tayran
    ["O_UAV_06_F",80,0,30],                                             // AL-6 Jinaah (Cargo)
    ["rhs_ka60_c",200,0,100],                                           // KA-60
    ["RHS_Mi8AMT_vdv",225,0,125],                                       // Mi-8AMT (Unarmed)
    ["RHS_Mi8MTV3_vdv",225,200,125],                                    // Mi-8MTV-3
    ["RHS_Ka52_vvsc",500,500,200],                                      // Ka-52
    ["RHS_Mi24V_vdv",550,550,250],                                      // Mi-24V
    ["rhs_mi28n_vvsc",650,600,300],                                     // Mi-28N
    ["O_UAV_02_dynamicLoadout_F",400,300,200],                          // K40 Ababil
    ["O_T_UAV_04_CAS_F",450,500,250],                                   // KH-3A
    ["RHS_Su25SM_vvsc",900,900,400],                                    // Su-25SM
    ["rhs_mig29s_vvsc",1250,1250,450]                                   // Mig-29S
];

static_vehicles = [
    ["RHS_NSV_TriPod_VDV",25,40,0],                                     // NSV Low Tripod
    ["rhs_KORD_high_VDV",25,40,0],                                      // KORD High Tripod
    ["RHS_AGS30_TriPod_VDV",25,60,0],                                   // AGS30 Low Tripod
    ["rhs_Kornet_9M133_2_vdv",50,100,0],                                // Kornet (AT)
    ["rhs_Igla_AA_pod_vdv",50,100,0],                                   // Igla Pod (AA)
    ["RHS_ZU23_VDV",80,120,0],                                          // ZU-23
    ["rhs_SPG9M_VDV",40,90,0],                                          // SPG-9 Low Tripod
    ["rhs_D30_vdv",100,200,0],                                          // D-30
    ["rhs_D30_at_vdv",100,200,0]                                        // D-30 AT
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["rhs_Flag_Russia_F",0,0,0],
    ["rhs_Flag_vdv_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
    ["rhs_Flag_vmf_F",0,0,0],
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
    ["RHS_Ural_Repair_VDV_01",325,0,75],                                // Ural Repair
    ["RHS_Ural_Fuel_VDV_01",125,0,275],                                 // Ural Fuel
    ["rhs_gaz66_ammo_msv",125,200,75],                                  // Gaz-66 Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Container Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Container Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Container Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "rhs_vdv_sergeant    ",
    "rhs_vdv_rifleman",
    "rhs_vdv_LAT",
    "rhs_vdv_at",
    "rhs_vdv_grenadier_alt",
    "rhs_vdv_arifleman",
    "rhs_vdv_arifleman",
    "rhs_vdv_marksman",
    "rhs_vdv_medic",
    "rhs_vdv_engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "rhs_vdv_sergeant    ",
    "rhs_vdv_rifleman",
    "rhs_vdv_LAT",
    "rhs_vdv_grenadier_alt",
    "rhs_vdv_arifleman",
    "rhs_vdv_arifleman",
    "rhs_vdv_machinegunner",
    "rhs_vdv_marksman",
    "rhs_vdv_medic",
    "rhs_vdv_engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "rhs_vdv_sergeant    ",
    "rhs_vdv_rifleman",
    "rhs_vdv_LAT",
    "rhs_vdv_at",
    "rhs_vdv_at",
    "rhs_vdv_at",
    "rhs_vdv_medic",
    "rhs_vdv_rifleman"
];

// AA specialists squad.
blufor_squad_aa = [
    "rhs_vdv_sergeant    ",
    "rhs_vdv_rifleman",
    "rhs_vdv_LAT",
    "rhs_vdv_aa",
    "rhs_vdv_aa",
    "rhs_vdv_aa",
    "rhs_vdv_medic",
    "rhs_vdv_rifleman"
];

// Force recon squad.
blufor_squad_recon = [
    "rhs_vdv_recon_sergeant",
    "rhs_vdv_rifleman",
    "rhs_vdv_recon_grenadier",
    "rhs_vdv_recon_at",
    "rhs_vdv_recon_machinegunner",
    "rhs_vdv_recon_machinegunner",
    "rhs_vdv_recon_marksman",
    "rhs_vdv_recon_marksman",
    "rhs_vdv_recon_medic",
    "rhs_vdv_recon_engineer"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "rhs_vdv_recon_rifleman",
    "rhs_vdv_recon_rifleman",
    "rhs_vdv_recon_rifleman_lat",
    "rhs_vdv_recon_rifleman",
    "rhs_vdv_recon_rifleman",
    "rhs_vdv_recon_rifleman_lat",
    "rhs_vdv_recon_medic",
    "rhs_vdv_recon_rifleman",
    "rhs_vdv_recon_rifleman_lat",
    "rhs_vdv_recon_marksman"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "rhs_t80ue1",                                                       // T-80UE1
    "rhs_t90a_tv",                                                      // T-90A
    "rhs_t90sab_tv",                                                    // T-90SA (2016)
    "rhs_t14_tv",                                                       // T-14
    "rhs_2s1_tv",                                                       // 2S1
    "rhs_2s3_tv",                                                       // 2S3M1
    "rhs_mi28n_vvsc",                                                   // Mi-28N
    "O_UAV_02_dynamicLoadout_F",                                        // K40 Ababil
    "O_T_UAV_04_CAS_F",                                                 // KH-3A
    "RHS_Su25SM_vvsc",                                                  // Su-25SM
    "rhs_mig29s_vvsc",                                                  // Mig-29S
    "rhs_bmd4m_vdv",                                                    // BMD-4M
    "rhs_bmd4ma_vdv",                                                   // BMD-4MA
    "RHS_Ka52_vvsc",                                                    // Ka-52
    "rhs_btr80a_vdv",                                                   // BTR-80A
    "rhs_bmd2m",                                                        // BMD-2M (Berezhok)
    "RHS_BM21_VDV_01"                                                   // BM-21 (Grad)
];
