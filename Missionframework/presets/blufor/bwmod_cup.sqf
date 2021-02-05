/*
    File: bwmod_cup.sqf
    Author: Ahto Taat - https://github.com/ahtotaat
    Date: 2020-10-07
    Last Update: 2020-10-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        BLUFOR German Bundeswehr alternative player preset.

    Needed Mods:
        - BWMod [https://steamcommunity.com/sharedfiles/filedetails/?id=1200127537]
        - CUP Vehicles [https://steamcommunity.com/sharedfiles/filedetails/?id=541888371]
        - CUP Units [https://steamcommunity.com/workshop/filedetails/?id=497661914]
        - CUP Weapons [https://steamcommunity.com/workshop/filedetails/?id=497660133]
        - CBA_A3 (dependency) [https://steamcommunity.com/workshop/filedetails/?id=450814997]
    Optional Mods:
        - Eurofighter Typhoon AWS [https://steamcommunity.com/sharedfiles/filedetails/?id=1625724231]
        - FIR AWS (dependency) [https://steamcommunity.com/sharedfiles/filedetails/?id=366425329] 
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                   // This is the main FOB HQ building.
FOB_box_typename = "BWA3_Container_Fleck";                             // This is the FOB as a container.
FOB_truck_typename = "B_Truck_01_F";                                   // This is the FOB as a vehicle.
Arsenal_typename = "BWA3_Box_Gear_Fleck";                              // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "CUP_B_HMMWV_Ambulance_USMC";                 // This is the mobile respawn (and medical) truck.
huron_typename = "CUP_B_CH53E_GER";                                    // This is Potato 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "BWA3_Crew_Fleck";                                 // This defines the crew for vehicles.
pilot_typename = "BWA3_Helipilot";                                     // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "CUP_B_UH1D_slick_GER_KSK";      // These are the additional helicopters which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "CUP_B_LCU1600_USMC";                   // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "CUP_B_MTVR_USMC";                     // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";    // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";    // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";          // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "B_Radar_System_01_F";            // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";             // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";            // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                      // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";                     // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                    // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
    ["BWA3_Crew_Fleck",10,5,0],                                         // Crewman
    ["BWA3_Helipilot",10,5,0],                                          // Helicopter Pilot
    ["BWA3_Rifleman_lite_Fleck",15,30,0],                               // Rifleman (Light)
    ["CUP_B_GER_Fleck_Operator",15,30,0],                               // KSK Assault Rifleman
    ["BWA3_Rifleman_Fleck",20,30,0],                                    // Rifleman
    ["BWA3_RiflemanG27_Fleck",20,30,0],                                 // Rifleman (G27)
    ["BWA3_RiflemanG28_Fleck",20,30,0],                                 // Rifleman (G28)
    ["BWA3_Grenadier_Fleck",25,50,0],                                   // Grenadier
    ["CUP_B_GER_Fleck_Operator_GL",25,50,0],                            // KSK Assault Grenadier
    ["BWA3_Autorifleman_Fleck",25,100,0],                               // Autorifleman
    ["CUP_B_GER_Fleck_Soldier_Ammo",25,100,0],                          // KSK Ammo Bearer
    ["BWA3_recon_Radioman_Fleck",25,50,0],                              // Recon Radioman
    ["BWA3_AutoriflemanMG5_Fleck",30,200,0],                            // Heavygunner
    ["CUP_B_GER_Fleck_Soldier_MG3",30,200,0],                           // KSK Machinegunner (MG3)
    ["BWA3_RiflemanAT_Pzf3_Fleck",30,100,0],                            // Rifleman (AT)
    ["CUP_B_GER_Fleck_Soldier_AT",30,100,0],                            // KSK AT Specialist (Carl Gustav)
    ["BWA3_CombatLifeSaver_Fleck",30,5,0],                              // Combat Life Saver
    ["CUP_B_GER_Fleck_Medic",30,50,0],                                  // KSK Paramedic
    ["BWA3_Engineer_Fleck",30,10,10],                                   // Engineer
    ["CUP_B_GER_Fleck_Soldier_Engineer",30,10,10],                      // KSK Combat Engineer
    ["BWA3_recon_LAT_Fleck",30,100,0],                                  // Recon Rifleman (AT)
    ["CUP_B_GER_Fleck_Soldier_Scout",30,15,0],                          // KSK Scout
    ["BWA3_recon_Marksman_Fleck",30,50,0],                              // Recon Marksman
    ["BWA3_recon_Medic_Fleck",30,5,0],                                  // Recon Combat Life Saver
    ["BWA3_recon_Pioneer_Fleck",35,100,100],                            // Recon Engineer
    ["BWA3_recon_Fleck",40,20,0],                                       // Recon Rifleman
    ["CUP_B_GER_Fleck_Operator_TL",40,20,0],                            // KSK Assault Team Leader
    ["BWA3_Marksman_Fleck",50,100,0],                                   // Marksman
    ["BWA3_RiflemanAT_RGW90_Fleck",50,100,0],                           // AT Specialist
    ["CUP_B_GER_Fleck_Soldier_TL",50,10,0],                             // KSK Team Leader
    ["BWA3_RiflemanAA_Fliegerfaust_Fleck",50,200,0],                    // AA Specialist
    ["CUP_B_GER_Fleck_Soldier_AA",50,200,0],                            // KSK AA Specialist (Fliegerfaust)
    ["BWA3_Spotter_Fleck",50,10,0],                                     // Spotter
    ["BWA3_Sniper_G29_Fleck",60,350,0],                                 // Sniper (G29)
    ["BWA3_Sniper_G82_Fleck",70,400,0],                                 // Sniper (G82)
    ["CUP_B_GER_Fleck_Soldier_Sniper",75,300,0]                         // KSK Sniper (G22)

];  

light_vehicles = [
    ["CUP_B_M1030_USMC",10,0,10],                                       // M1030 dirt bike
    ["BWA3_Eagle_Fleck",100,0,50],                                      // Eagle IV
    ["BWA3_Eagle_FLW100_Fleck",100,50,50],                              // Eagle IV (FLW 100)
    ["CUP_B_FENNEK_GER_Wdl",100,0,50],                                  // Fennek (Woodland)
    ["CUP_B_Dingo_GER_Wdl",100,50,50] ,                                 // Dingo 2 (MG, Woodland)
    ["CUP_B_Dingo_GL_GER_Wdl",100,50,50],                               // Dingo 2 (GL, Woodland)
    ["CUP_B_Boxer_GMG_GER_WDL",100,50,50],                              // GTK Boxer (GMG)
    ["CUP_B_Boxer_HMG_GER_WDL",100,50,50],                              // GTK Boxer (HMG)
    ["B_Boat_Transport_01_F",100,0,25],                                 // Assault Boat
    ["B_Boat_Armed_01_minigun_F",200,80,75],                            // Speedboat Minigun
    ["CUP_O_BTR80A_CHDKZ",200,500,100],                                 // BTR-80A
    ["CUP_O_BM21_CHDKZ",200,1000,74]                                    // BM-21 "Grad"
];

heavy_vehicles = [
    ["BWA3_Puma_Fleck",350,550,275],                                    // IFV Puma
    ["CUP_O_T72_CHDKZ",500,500,300],                                    // T-72
    ["BWA3_Leopard2_Fleck",500,400,250],                                // MBT Leopard 2A6M
    ["CUP_B_M270_HE_BAF_WOOD",550,550,200],                             // M270 MLRS (HE) [M270 is used by Bundeswehr, but not added to Bundeswehr faction in CUP/BWMod]
    ["CUP_B_M270_DPICM_BAF_WOOD",550,550,200]                           // M270 MLRS (DPICM)
];

air_vehicles = [
    ["CUP_B_AW159_Unarmed_RN_Blackcat",200,0,100],                      // AW159 Wildcat (Unarmed)
    ["CUP_B_AW159_RN_Blackcat",200,200,100],                            // AW159 Wildcar (Armed)
    ["CUP_B_UH1D_slick_GER_KSK",225,50,50],                             // UH-1D (Slick)
    ["CUP_B_CH53E_GER",275,0,175],                                      // CH-53G Super Stallion
    ["CUP_B_UH1D_gunship_GER_KSK",300,50,50],                           // UH-1D (Gunship)
    ["CUP_B_UH1D_armed_GER_KSK",300,50,50],                             // UH-1D (Armed)
    ["CUP_B_CH53E_VIV_GER",300,50,150],                                 // CH-47F (VIV)
    ["BWA3_Tiger_Gunpod_FZ",650,300,100],                               // UH Tiger Gunpod (FZ Rockets)
    ["BWA3_Tiger_Gunpod_Heavy",650,300,120],                            // UH Tiger Gunpod (Heavy)
    ["BWA3_Tiger_Gunpod_PARS",650,300,100],                             // UH Tiger Gunpod (PARS)
    ["BWA3_Tiger_RMK_FZ",650,300,100],                                  // UH Tiger RMK (FZ Rockets)
    ["BWA3_Tiger_RMK_Heavy",650,300,120],                               // UH Tiger RMK (Heavy)
    ["BWA3_Tiger_RMK_PARS",650,300,100],                                // UH Tiger RMK (PARS)
    ["BWA3_Tiger_RMK_Universal",650,300,100],                           // UH Tiger RMK (Universal)
    ["CUP_O_Mi24_V_Dynamic_CSAT_T",750,500,200],                        // Mi-24V
    ["CUP_O_Mi24_D_Dynamic_CSAT_T",750,500,200],                        // Mi-24D
    ["CUP_O_Mi24_P_Dynamic_CSAT_T",750,500,200],                        // Mi-24P
    ["CUP_O_Mi24_Mk4_CSAT_T",750,500,150],                              // Mi-24 Superhind Mk.IV (S8)
    ["EAWS_EF2000_GER_CAP",1000,1000,1000]                              // Eurofighter Typhoon (GER)
];

static_vehicles = [
    ["CUP_B_SearchLight_static_USMC",10,0,0],                           // Search Light
    ["CUP_B_M2StaticMG_USMC",25,40,0],                                  // Mk HMG .50
    ["CUP_B_M119_USMC",25,40,0],                                        // M119
    ["CUP_B_MK19_TriPod_USMC",25,60,0],                                 // Mk19 Minitripod
    ["CUP_B_TOW2_TriPod_USMC",50,100,0],                                // M220 TOW-2
    ["CUP_B_Stinger_AA_pod_Base_USMC",50,100,0],                        // Stinger (AA)
    ["CUP_O_D30_ChDKZ",75,500,0],                                       // D-30 155mm Howitzer
    ["CUP_B_M252_USMC",80,150,0],                                       // M252 81mm Mortar
    ["CUP_B_Type072_Turret",100,100,0],                                 // Type 072A Turret
    ["CUP_WV_B_SS_Launcher",500,500,0],                                 // Mk29 GMLS
    ["B_AAA_System_01_F",500,1000,0],                                   // Praetorian 1C
    ["CUP_WV_B_CRAM",500,1000,0],                                       // C-RAM
    ["CUP_WV_B_RAM_Launcher",500,500,0]                                 // Mk49 GMLS

];

buildings = [
    ["BlockConcrete_F",0,0,0],
    ["Land_ConcretePanels_02_Single_v2_F",0,0,0],
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["BWA3_Flag_Germany",0,0,0],                                        // Flag (Germany)
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
    ["Land_AirstripPlatform_01_F",0,0,0],
    ["Land_BagFence_Round_F",0,0,0],
    ["Land_BagFence_Short_F",0,0,0],
    ["Land_BagFence_Long_F",0,0,0],
    ["Land_BagFence_Corner_F",0,0,0],
    ["Land_BagFence_End_F",0,0,0],
    ["Land_BagFence_01_corner_green_F",0,0,0],
    ["Land_BagFence_01_end_green_F",0,0,0],
    ["Land_BagFence_01_long_green_F",0,0,0],
    ["Land_BagFence_01_round_green_F",0,0,0],
    ["Land_BagFence_01_short_green_F",0,0,0],
    ["Land_BagBunker_Small_F",0,0,0],
    ["Land_BagBunker_Large_F",0,0,0],
    ["Land_BagBunker_01_large_green_F",0,0,0],
    ["Land_BagBunker_01_small_green_F",0,0,0],
    ["Land_Device_slingloadable_F",0,0,0],
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
    ["Land_ClutterCutter_large_F",0,0,0],
    ["Land_WallCity_01_8m_plain_grey_F",0,0,0],
    ["Land_CamoConcreteWall_01_l_4m_v2_F",0,0,0],
    ["Land_CamoConcreteWall_01_pole_v1_F",0,0,0],
    ["Land_Pier_F",0,0,0]
];

support_vehicles = [
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0], 
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0], 
    ["ACE_medicalSupplyCrate_advanced",50,0,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["BWA3_Box_Ammo",50,100,0],                                         // Ammo [BW]
    ["CUP_B_Tractor_CDF",50,0,25],                                      // Towing Tractor
    ["CUP_B_Boxer_Empty_GER_WDL",75,0,50],                              // Boxer (Empty)	
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0],                                 // Huron Ammo
    [Arsenal_typename,100,200,0],
    ["CUP_B_MTVR_Refuel_BAF_WOOD",125,0,275],                           // MTVR (Refuel)
    ["CUP_B_MTVR_Ammo_BAF_WOOD",125,200,75],                            // MTVR (Ammo)
    [Respawn_truck_typename,200,0,100],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_recycle_building,250,0,0],
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    [KP_liberation_plane_slot_building,500,0,0],
    [FOB_box_typename,300,500,0],
    [FOB_truck_typename,300,500,75],
    ["CUP_B_MTVR_Repair_BAF_WOOD",325,0,75],                            // MTVR (Repair)
    [KP_liberation_air_vehicle_building,1000,0,0] 
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "BWA3_TL_Fleck",
    "BWA3_Rifleman_lite_Fleck",
    "BWA3_Rifleman_lite_Fleck",
    "BWA3_RiflemanAT_Pzf3_Fleck",
    "BWA3_Grenadier_Fleck",
    "BWA3_Autorifleman_Fleck",
    "BWA3_Autorifleman_Fleck",
    "BWA3_Marksman_Fleck",
    "BWA3_CombatLifeSaver_Fleck",
    "BWA3_Engineer_Fleck"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "BWA3_TL_Fleck",
    "BWA3_RiflemanAT_Pzf3_Fleck",
    "BWA3_RiflemanAT_Pzf3_Fleck",
    "BWA3_Grenadier_Fleck",
    "BWA3_Autorifleman_Fleck",
    "BWA3_Autorifleman_Fleck",
    "BWA3_AutoriflemanMG5_Fleck",
    "BWA3_Marksman_Fleck",
    "BWA3_CombatLifeSaver_Fleck",
    "BWA3_Engineer_Fleck"
];

// AT specialists squad.
blufor_squad_at = [
    "BWA3_TL_Fleck",
    "BWA3_Rifleman_Fleck",
    "BWA3_Rifleman_Fleck",
    "BWA3_RiflemanAT_RGW90_Fleck",
    "BWA3_RiflemanAT_RGW90_Fleck",
    "BWA3_RiflemanAT_RGW90_Fleck",
    "BWA3_CombatLifeSaver_Fleck",
    "BWA3_Rifleman_Fleck"
];

// AA specialists squad.
blufor_squad_aa = [
    "BWA3_TL_Fleck",
    "BWA3_Rifleman_Fleck",
    "BWA3_Rifleman_Fleck",
    "BWA3_RiflemanAA_Fliegerfaust_Fleck",
    "BWA3_RiflemanAA_Fliegerfaust_Fleck",
    "BWA3_RiflemanAA_Fliegerfaust_Fleck",
    "BWA3_CombatLifeSaver_Fleck",
    "BWA3_Rifleman_Fleck"
];

// Force recon squad.
blufor_squad_recon = [
    "BWA3_recon_TL_Fleck",
    "CUP_B_GER_Fleck_Soldier_Ammo",
    "CUP_B_GER_Fleck_Soldier_MG3",
    "BWA3_recon_LAT_Fleck",
    "BWA3_recon_Radioman_Fleck",
    "BWA3_recon_Marksman_Fleck",
    "BWA3_SniperG82_Fleck",
    "BWA3_Spotter_Fleck",
    "BWA3_recon_Medic_Fleck",
    "BWA3_recon_Pioneer_Fleck"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "BWA3_recon_Medic_Fleck",
    "BWA3_recon_Marksman_Fleck",
    "BWA3_recon_Pioneer_Fleck",
    "BWA3_recon_Radioman_Fleck",
    "BWA3_recon_LAT_Fleck",
    "BWA3_recon_Fleck",
    "BWA3_recon_TL_Fleck",
    "BWA3_Sniper_G29_Fleck",
    "BWA3_Spotter_Fleck",
    "BWA3_recon_Fleck"
];

/*
    --- Vehicles to unlock ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "CUP_O_D30_ChDKZ",                                                  // D-30 155mm Howitzer
    "CUP_O_BM21_CHDKZ",                                                 // BM-21 "Grad" MLRS
    "CUP_O_BTR80A_CHDKZ",                                               // BTR-80A
    "CUP_O_T72_CHDKZ",                                                  // T-72
    "CUP_O_Mi24_V_Dynamic_CSAT_T",                                      // Mi-24V
    "CUP_O_Mi24_D_Dynamic_CSAT_T",                                      // Mi-24D
    "CUP_O_Mi24_P_Dynamic_CSAT_T",                                      // Mi-24P
    "CUP_O_Mi24_Mk4_CSAT_T"                                             // Mi-24 Superhind Mk.IV (S8)
];
