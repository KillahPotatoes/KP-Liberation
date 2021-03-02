/*
    Needed Mods:
    - None

    Optional Mods:
    - BWMod
    - RHSUSAF
    - F-15C
    - F/A-18
    - CUP Weapons
    - CUP Vehicles
    - USAF Main Pack
    - USAF Fighters Pack
    - USAF Utility Pack
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "B_Truck_01_box_F";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_CargoNet_01_ammo_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "B_Truck_01_medical_F";                        // This is the mobile respawn (and medical) truck.
huron_typename = "B_Heli_Transport_03_unarmed_F";                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "B_soldier_LAT_F";                                         // This defines the crew for vehicles.
pilot_classname = "B_soldier_LAT_F";                                      // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "C_Offroad_02_unarmed_green_F";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "B_Truck_01_transport_F";               // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_green_F";           // The building defined to unlock FOB recycling functionality.
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
	["B_soldier_LAT_F",5,5,0]
];

light_vehicles = [
	["B_Boat_Transport_01_F",50,0,50],
	["I_C_Boat_Transport_02_F",100,0,100],
    ["B_Boat_Armed_01_minigun_F",300,300,300],
    ["rhsusf_mkvsoc",400,400,400],
	["rhsusf_m1151_usarmy_wd",120,0,120],
	["BWA3_Eagle_Fleck",150,0,150],
	["rhs_tigr_msv",170,0,170],
	["rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy",100,0,100],
	["rhs_kamaz5350_open_msv",100,0,100],
	["RHS_Ural_MSV_01",100,0,100],
	["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",300,100,300],
	["BWA3_Eagle_FLW100_Fleck",300,100,300],
	["rhsusf_m1151_m2_v2_usarmy_wdd",300,100,300],
	["rhs_tigr_sts_msv",300,100,300],
	["rhsusf_m1045_w",350,200,350],
    ["rhsusf_M1230_M2_usarmy_wd",400,150,400],
    ["rhsusf_M1237_M2_usarmy_wd",400,150,400],
	["I_LT_01_cannon_F",350,250,350],
	["I_LT_01_AA_F",350,250,350],
	["RHS_MELB_MH6M",450,0,450],
	["rhs_ka60_grey",500,0,500],
	["RHS_UH1Y_UNARMED",500,0,500]
];

heavy_vehicles = [
    ["rhsusf_m113_usarmy",500,250,500],
	["rhs_btr80a_msv",600,650,600],
	["rhsusf_M977A4_BKIT_M2_usarmy_wd",600,100,600],
    ["rhsusf_stryker_m1126_m2_wd",650,250,650],
	["rhs_zsu234_aa",650,250,650],
	["BWA3_Puma_Fleck",700,700,700],
	["RHS_M2A3_wd",700,700,700],
	["RHS_MELB_AH6M",700,600,700],
	["RHS_Mi8AMT_vdv",800,0,800],
	["RHS_Mi8mt_vdv",800,300,800],
	["RHS_UH60M",800,300,800],
	["RHS_CH_47F",900,300,900],
	["rhsusf_CH53e_USMC_cargo",1000,0,1000],
	["BWA3_Leopard2_Fleck",800,900,800],
	["rhsusf_m1a2sep1wd_usarmy",800,900,800],
	["rhs_t90a_tv",800,900,800],
	["O_T_MBT_04_command_F",800,900,800],
	["RHS_AH1Z_wd",1000,800,1000],
	["BWA3_Tiger_RMK_Heavy",1100,1000,1100],
	["RHS_AH64D_wd",1100,1000,1100],
	["RHS_Mi24V_vdv",1200,1100,1200],
	["rhsusf_f22",1200,1100,1200],
	["rhs_mig29sm_vvsc",1200,1100,1200],
	["B_Plane_CAS_01_dynamicLoadout_F",1300,1300,1300],
	["I_Plane_Fighter_03_dynamicLoadout_F",1000,1000,1000],
	["RHS_Su25SM_vvsc",1300,1300,1300],
	["RHS_A10",1300,1300,1300]
];

air_vehicles = [
];

static_vehicles = [
];

buildings = [
    ["Flag_UNO_F",0,0,0],
    ["rhs_Flag_Russia_F",0,0,0],
    ["FlagCarrierGermany_EP1",0,0,0],
    ["Flag_UK_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_Campfire_F",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["Land_HBarrier_01_wall_6_green_F",0,0,0],
    ["Land_HBarrierWall6_F",0,0,0],
    ["Land_HelipadCivil_F",0,0,0],
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0],
	["Land_MapBoard_Enoch_F",0,0,0]
];


/* 
	[Arsenal_typename,100,200,0],
	[Respawn_truck_typename,200,0,100],
*/
support_vehicles = [
    [FOB_box_typename,1000,1000,1000],
    [FOB_truck_typename,1000,1000,1000],
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,250,250,250],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_plane_slot_building,500,0,0],
	["B_Slingload_01_Medevac_F",400,0,0],
    ["ACE_medicalSupplyCrate_advanced",0,0,0],
    ["ACE_Box_82mm_Mo_HE",0,0,0],
    ["ACE_Box_82mm_Mo_Smoke",0,0,0],
    ["ACE_Box_82mm_Mo_Illum",0,0,0],
	["Box_NATO_Equip_F",0,0,0],
    ["ACE_Wheel",0,0,0],
    ["ACE_Track",0,0,0],
    ["B_Slingload_01_Fuel_F",250,0,1000],										// Huron Fuel
    ["B_Slingload_01_Ammo_F",250,1000,0]									// Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F"
];

// AT specialists squad.
blufor_squad_at = [
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F"
];

// AA specialists squad.
blufor_squad_aa = [
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F"
];

// Force recon squad.
blufor_squad_recon = [
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F",
    "B_soldier_LAT_F"
];


/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [];
