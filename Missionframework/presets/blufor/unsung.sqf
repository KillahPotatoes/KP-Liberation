/*
    Needed Mods:
    - The Unsung Vietnam War Mod

    Optional Mods:
    - None
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "LAND_sb_bunker_main";                                   // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "uns_M35A2_fuel";                                  // This is the FOB as a vehicle.
Arsenal_typename = "uns_resupply_crate_US";                             // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "uns_M577_amb";                                // This is the mobile respawn (and medical) truck.
huron_typename = "uns_h21c";                                            // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "uns_US_25ID_STY3";                                 // This defines the crew for vehicles.
pilot_classname = "uns_pilot1";                                         // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "uns_H13_transport_CAV";          // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "UNS_Zodiac_W";                          // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "uns_M35A2_Open";                       // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "uns_motorpool1_repair";               // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "LAND_uns_signaltower";            // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "LAND_uns_Heli_pad";                 // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "UNS_Hanger_repair";                // The hangar used to increase the GLOBAL fixed-wing cap.
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
    ["uns_US_25ID_STY3",15,0,0],                                        // Sentry
    ["uns_US_25ID_RF6",20,0,0],                                         // Rifleman
    ["uns_US_25ID_AT",30,0,0],                                          // Rifleman (AT)
    ["uns_US_25ID_GL",25,0,0],                                          // Grenadier
    ["uns_US_25ID_HMG",25,0,0],                                         // Machinegunner
    ["uns_US_25ID_MRK3",30,0,0],                                        // Marksman
    ["uns_US_25ID_MRK",30,0,0],                                         // Sharpshooter
    ["uns_US_25ID_MED",30,0,0],                                         // Combat Life Saver
    ["uns_US_25ID_ENG",30,0,0],                                         // Engineer
    ["uns_US_25ID_DEM",30,0,0],                                         // Explosives Specialist
    ["uns_men_US_1AC_SL",40,0,0],                                       // Recon NCO
    ["uns_men_US_1AC_TPR1",40,0,0],                                     // Recon Rifleman 1
    ["uns_men_US_1AC_TPR2",40,0,0],                                     // Recon Rifleman 2
    ["uns_men_US_1AC_AT",40,0,0],                                       // Recon AT
    ["uns_men_US_1AC_MRK3",40,0,0],                                     // Recon Marksman
    ["uns_men_US_1AC_MRK",40,0,0],                                      // Recon Sniper
    ["uns_men_US_1AC_MED",40,0,0],                                      // Recon Medic
    ["uns_men_US_1AC_DEM",40,0,0],                                      // Recon Demolition Expert
    ["uns_pilot2",10,0,0],                                              // Helicopter Crew
    ["uns_pilot1",10,0,0],                                              // Helicopter Pilot
    ["uns_pil1",10,0,0]                                                 // Pilot
];

light_vehicles = [
    ["uns_m274",50,0,25],                                               // M-274 Mule
    ["uns_m274_m60",50,25,25],                                          // M-274 Mule (M60)
    ["uns_willys",75,0,50],                                             // M-151 MUTT
    ["uns_willysmg",75,30,50],                                          // M-151 MUTT (M60)
    ["uns_willysmg50",75,40,50],                                        // M-151 MUTT (M2)
    ["uns_willysm40",75,60,50],                                         // M-151 MUTT (M40)
    ["uns_m37b1",100,0,50],                                             // M-37B1 Dodge 3/4T
    ["uns_m37b1_m1919",100,40,50],                                      // M-37B1 Dodge 3/4T (M1919)
    ["uns_M35A2_Open",125,0,75],                                        // M35A2 2.5T Truck
    ["uns_M35A2",125,0,75],                                             // M35A2 2.5T Truck (Covered)
    ["UNS_Zodiac_W",100,0,25],                                          // Zodiac RIB (Assault)
    ["uns_pbr",200,80,75],                                              // PBR Mk. II (M2)
    ["uns_pbr_mk18",200,80,75],                                         // PBR Mk. II (Mk18 GL)
    ["uns_PBR_M10",200,80,75]                                           // PBR Mk. II (M10 Flamethrower)
];

heavy_vehicles = [
    ["uns_xm706e2",100,50,100],                                         // XM-706-E2 Commando
    ["uns_xm706e1",100,60,100],                                         // XM-706-E1 Commando (30 cal)
    ["uns_M113_30cal",200,75,100],                                      // M-113 ACAV (30 cal)
    ["uns_M113_M134",200,75,100],                                       // M-113 ACAV (M134)
    ["uns_M113_M2",200,75,100],                                         // M-113 ACAV (M2)
    ["uns_M113_M60",200,75,100],                                        // M-113 ACAV (M60)
    ["uns_M113_XM182",200,75,100],                                      // M-113 ACAV (XM182)
    ["uns_M113A1_M134",250,100,120],                                    // M-113A1 ACAV (M134)
    ["uns_M113A1_M2",250,100,120],                                      // M-113A1 ACAV (M2)
    ["uns_M113A1_M60",250,100,120],                                     // M-113A1 ACAV (M60)
    ["uns_M113A1_XM182",250,100,120],                                   // M-113A1 ACAV (XM182)
    ["uns_m163",250,125,120],                                           // M-163 Vulcan ADS
    ["uns_m551",300,250,200],                                           // M-551 Sheridan
    ["uns_M67A",350,300,250],                                           // M-67A Flamethrower Tank
    ["uns_m48a3",400,350,250],                                          // M-48A3 Patton MBT
    ["uns_M113_M30",250,150,120],                                       // M106 Mortar Carrier
    ["uns_m107sp",600,600,300],                                         // M-107 Self-Propelled Gun
    ["uns_m110sp",600,750,300]                                          // M-110 Self-Propelled Gun
];

air_vehicles = [
    ["uns_H13_transport_CAV",100,0,80],                                 // UH-13B
    ["uns_H13_amphib_CAV",100,0,80],                                    // OH-13C CSAR
    ["uns_H13_medevac_CAV",100,0,80],                                   // MH-13E Medevac
    ["uns_H13_gunship_CAV",100,75,80],                                  // AH-13H
    ["uns_oh6_transport",200,0,100],                                    // OH-6A Transport
    ["uns_oh6_m27",200,100,100],                                        // OH-6A M27
    ["uns_oh6_xm8",200,120,100],                                        // OH-6A XM8
    ["uns_uh1D_med",200,0,125],                                         // UH-1D Iroquois (Medevac)
    ["uns_UH1D_m60",200,50,125],                                        // UH-1D Iroquois
    ["uns_UH1H_m60",225,50,150],                                        // UH-1H Iroquois
    ["UNS_UH1C_M3_ARA",225,80,150],                                     // UH-1C/M3 Iroquois (ARA)
    ["UNS_UH1C_M3_ARA_AP",225,80,150],                                  // UH-1C/M3 Iroquois (ARA/AP)
    ["UNS_UH1C_M3_ARA_AT",225,80,150],                                  // UH-1C/M3 Iroquois (ARA/AT)
    ["uns_UH1C_M6_M158",225,100,150],                                   // UH-1C/M6 Iroquois (M158)
    ["uns_UH1C_M6_M200",225,100,150],                                   // UH-1C/M6 Iroquois (M200)
    ["uns_UH1C_M6_M200_M134",225,100,150],                              // UH-1C/M6 Iroquois (M200/M134)
    ["uns_ch34_army_M60",250,100,125],                                  // CH-34 Choctaw (M60)
    ["uns_h21c_mg",250,150,125],                                        // H-21B Workhorse (Armed)
    ["uns_ch47a_medevac",300,0,200],                                    // CH-47A Chinook (Ambulance)
    ["uns_ch47_m60_1AC",300,80,200],                                    // CH-47A Chinook (1AC)
    ["uns_ach47_m134",300,150,200],                                     // ACH-47A Guns-a-Go-Go (M134)
    ["uns_ach47_m200",300,175,200],                                     // ACH-47A Guns-a-Go-Go (M200)
    ["UNS_AH1G",400,400,200],                                           // AH-1D Cobra (CAS)
    ["UNS_AH1G_FFAR",400,400,200],                                      // AH-1D Cobra (M158/M200)
    ["UNS_AH1G_M158",400,400,200],                                      // AH-1D Cobra (M158)
    ["UNS_AH1G_M195",400,400,200],                                      // AH-1D Cobra (M195)
    ["UNS_AH1G_M200",400,400,200],                                      // AH-1D Cobra (M200)
    ["UNS_AH1G_SUU11",400,400,200],                                     // AH-1D Cobra (SUU11)
    ["uns_AC47",600,50,400],                                            // AC-47
    ["uns_C130_H",600,0,400],                                           // C-130H
    ["uns_KC130_H",600,0,500],                                          // KC-130H
    ["uns_A1J_CAS",400,400,350],                                        // A-1H Skyraider (CAS)
    ["uns_A7_CAS",750,600,400],                                         // A-7D Corsair II (CAS)
    ["uns_F4E_CAS",800,600,400]                                         // F-4E Phantom II (CAS)
];

static_vehicles = [
    ["uns_US_SearchLight",20,0,0],                                      // Searchlight
    ["uns_m60_low",25,40,0],                                            // M60 7.62mm (low)
    ["uns_m60_high",25,40,0],                                           // M60 7.62mm (high)
    ["uns_m1919_low",25,45,0],                                          // M-1919A4 .30cal (low)
    ["uns_m2_low",25,50,0],                                             // M-2HB .50cal (low)
    ["uns_m2_high",25,50,0],                                            // M-2HB .50cal (high)
    ["uns_US_MK18_low",25,60,0],                                        // Mk18 Mod0 Honeywell HMGL
    ["uns_m60_bunker_small",40,40,0],                                   // M60 Bunker (small)
    ["uns_m60_bunker_large",50,40,0],                                   // M60 Bunker (large)
    ["uns_M40_106mm_US",50,100,0],                                      // M-40 106mm Recoilless Rifle
    ["Uns_M55_Quad",50,100,0],                                          // M-55 Quad 50
    ["uns_M1_81mm_mortar",80,150,0],                                    // M-1 81mm Mortar
    ["Uns_M102_artillery",100,200,0],                                   // M-102 105mm Howitzer
    ["Uns_M114_artillery",100,200,0]                                    // M-114A1 155mm Howitzer
];

buildings = [
    ["uns_FlagCarrierUS",0,0,0],
    ["uns_FlagCarrier101AB",0,0,0],
    ["uns_FlagCarrier25ID",0,0,0],
    ["uns_FlagCarrierUS_AIRCAV",0,0,0],
    ["uns_FlagCarrierUS_SOG",0,0,0],
    ["uns_FlagCarrierUSMC",0,0,0],
    ["Flag_White_F",0,0,0],
    ["uns_FlagCarrierMed",0,0,0],
    ["LAND_uns_army_med",0,0,0],
    ["uns_mash_main",0,0,0],
    ["uns_mash",0,0,0],
    ["US_Tent_MASH",0,0,0],
    ["sign_HELI",0,0,0],
    ["Helipad",0,0,0],
    ["LAND_uns_evac_pad",0,0,0],
    ["LAND_uns_Heli_H",0,0,0],
    ["Land_BarrelWater_F",0,0,0],
    ["Land_BarrelWater_grey_F",0,0,0],
    ["Land_camonet_east_ep1",0,0,0],
    ["Land_camonet_east_var1_ep1",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingChair_V2_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["LAND_CSJ_gunpit",0,0,0],
    ["LAND_CSJ_punji",0,0,0],
    ["LAND_CSJ_punjiWall",0,0,0],
    ["Land_fort_rampart",0,0,0],
    ["Land_guardShed",0,0,0],
    ["Land_Illum_Tower",0,0,0],
    ["Land_misc_deerstand",0,0,0],
    ["LAND_mortarpit_sb",0,0,0],
    ["Land_Net_Open",0,0,0],
    ["LAND_P_wire1",0,0,0],
    ["LAND_P_wire1a",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_pristresek_mensi",0,0,0],
    ["Land_Razorwire_F",0,0,0],
    ["LAND_Revetment_5",0,0,0],
    ["LAND_sb_bunker_small",0,0,0],
    ["LAND_sb_revetment",0,0,0],
    ["Land_Sign_WarningMilAreaSmall_F",0,0,0],
    ["Land_Sign_WarningMilitaryArea_F",0,0,0],
    ["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
    ["LAND_t_2_FOP2",0,0,0],
    ["LAND_t_sb_20_half",0,0,0],
    ["LAND_t_sb_20",0,0,0],
    ["LAND_t_sb_45_half",0,0,0],
    ["LAND_t_sb_45",0,0,0],
    ["LAND_t_sb_5_covered",0,0,0],
    ["LAND_t_sb_5_half",0,0,0],
    ["LAND_t_sb_5",0,0,0],
    ["LAND_t_sb_bunker2",0,0,0],
    ["LAND_t_sb_cnr_half",0,0,0],
    ["LAND_t_sb_cnr",0,0,0],
    ["LAND_t_sb_Cross_half",0,0,0],
    ["LAND_t_sb_Cross",0,0,0],
    ["LAND_t_sb_end",0,0,0],
    ["LAND_t_sb_pit1",0,0,0],
    ["LAND_t_sb_pit2",0,0,0],
    ["LAND_t_sb_pit3",0,0,0],
    ["LAND_t_sb_Tee",0,0,0],
    ["LAND_tarp_1",0,0,0],
    ["LAND_tower_1",0,0,0],
    ["LAND_uns_armyhut2",0,0,0],
    ["LAND_uns_armyhut3",0,0,0],
    ["LAND_uns_bunker_troop",0,0,0],
    ["LAND_uns_bunker_troop2",0,0,0],
    ["LAND_uns_bunker_troop3",0,0,0],
    ["LAND_UNS_GuardHouse",0,0,0],
    ["LAND_UNS_HootchE",0,0,0],
    ["LAND_UNS_HootchE1",0,0,0],
    ["LAND_UNS_Latrine",0,0,0],
    ["LAND_UNS_OM",0,0,0],
    ["LAND_uns_showers",0,0,0],
    ["LAND_uns_tent2",0,0,0],
    ["LAND_uns_tent3",0,0,0],
    ["LAND_uns_tentbarracks",0,0,0],
    ["LAND_uns_weapon_pit",0,0,0],
    ["LAND_uns_westbunker1",0,0,0],
    ["LAND_uns_westbunker2",0,0,0],
    ["Land_Water_Tank",0,0,0],
    ["Land_WaterBarrel_F",0,0,0],
    ["Land_WaterTank_F",0,0,0],
    ["Land_Wood_Tower",0,0,0],
    ["Land_Wood_Tower2",0,0,0],
    ["Land_woodenramp",0,0,0],
    ["MapBoard_altis_F",0,0,0],
    ["MapBoard_seismic_F",0,0,0],
    ["MapBoard_stratis_F",0,0,0],
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
    ["PortableHelipadLight_01_red_F",0,0,0],
    ["Razorwire",0,0,0],
    ["SB_Wall_1",0,0,0],
    ["SB_Wall_2",0,0,0],
    ["SB_Wall_3",0,0,0],
    ["SB_Wall_4",0,0,0],
    ["SB_Wall_5",0,0,0],
    ["SB_Wall_6",0,0,0],
    ["Tent_Open",0,0,0],
    ["uns_camp",0,0,0],
    ["uns_foxhole1",0,0,0],
    ["uns_foxhole2",0,0,0],
    ["uns_sbagcircle",0,0,0],
    ["uns_sbagwall_u",0,0,0],
    ["US_Tent_1",0,0,0],
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
    ["uns_M113_ENG",500,250,350],                                       // M-113 Engineer
    ["uns_M35A2_repair",325,0,75],                                      // M35A2 2.5T Truck (repair)
    ["uns_M35A2_fueltanker",125,0,275],                                 // M35A2 2.5T Tanker (Fuel)
    ["uns_M35A2_ammo",125,200,75],                                      // M35A2 2.5T Truck (Ammo)
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad
blufor_squad_inf_light = [
    "uns_US_25ID_SL",
    "uns_US_25ID_RF6",
    "uns_US_25ID_RF6",
    "uns_US_25ID_AT",
    "uns_US_25ID_GL",
    "uns_US_25ID_HMG",
    "uns_US_25ID_HMG",
    "uns_US_25ID_MRK3",
    "uns_US_25ID_MED",
    "uns_US_25ID_ENG"
];

// Heavy infantry squad
blufor_squad_inf = [
    "uns_US_25ID_SL",
    "uns_US_25ID_AT",
    "uns_US_25ID_AT",
    "uns_US_25ID_GL",
    "uns_US_25ID_HMG",
    "uns_US_25ID_HMG",
    "uns_US_25ID_HMG",
    "uns_US_25ID_MRK",
    "uns_US_25ID_MED",
    "uns_US_25ID_ENG"
];

// AT specialists squad
blufor_squad_at = [
    "uns_US_25ID_SL",
    "uns_US_25ID_RF6",
    "uns_US_25ID_RF6",
    "uns_US_25ID_AT",
    "uns_US_25ID_AT",
    "uns_US_25ID_AT",
    "uns_US_25ID_MED",
    "uns_US_25ID_RF6"
];

// AA specialists squad
blufor_squad_aa = [
    "uns_US_25ID_SL",
    "uns_US_25ID_RF6",
    "uns_US_25ID_RF6",
    "uns_US_25ID_HMG",
    "uns_US_25ID_HMG",
    "uns_US_25ID_HMG",
    "uns_US_25ID_MED",
    "uns_US_25ID_RF6"
];

// Force recon squad
blufor_squad_recon = [
    "uns_men_US_1AC_SL",
    "uns_men_US_1AC_TPR1",
    "uns_men_US_1AC_TPR2",
    "uns_men_US_1AC_AT",
    "uns_men_US_1AC_MRK3",
    "uns_men_US_1AC_MRK3",
    "uns_men_US_1AC_MRK",
    "uns_men_US_1AC_MRK",
    "uns_men_US_1AC_MED",
    "uns_men_US_1AC_DEM"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13",
    "uns_men_US_5SFG_SP13"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "uns_A1J_CAS",                                                      // A-1H Skyraider (CAS)
    "uns_A7_CAS",                                                       // A-7D Corsair II (CAS)
    "uns_F4E_CAS",                                                      // F-4E Phantom II (CAS)
    "Uns_M102_artillery",                                               // M-102 105mm Howitzer
    "uns_m107sp",                                                       // M-107 Self-Propelled Gun
    "uns_m110sp",                                                       // M-110 Self-Propelled Gun
    "Uns_M114_artillery",                                               // M-114A1 155mm Howitzer
    "uns_m48a3",                                                        // M-48A3 Patton MBT
    "uns_M67A",                                                         // M-67A Flamethrower Tank
    "uns_PBR_M10"                                                       // PBR Mk. II (M10 Flamethrower)
];
