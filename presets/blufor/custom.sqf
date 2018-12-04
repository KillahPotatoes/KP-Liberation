/*
Needed Mods:
- None

Optional Mods:
*/

/* - Support classnames.
Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not, just don't try!	*/
FOB_typename = "cwa_CampEast";									// This is the main FOB HQ building. 																									Default is "Land_Cargo_HQ_V1_F".
FOB_box_typename = "B_Slingload_01_Cargo_F";							// This is the FOB as a container. 																										Default is "B_Slingload_01_Cargo_F".
FOB_truck_typename = "LIB_US_GMC_Parm";								// This is the FOB as a vehicle.																										Default is "B_Truck_01_box_F".
Arsenal_typename = "fow_ab_us_60mm_m2_SMOKE";									// This is the virtual arsenal as portable supply crates.  																				Default is "B_supplyCrate_F".
Respawn_truck_typename = "LIB_US_GMC_Ambulance";						// This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "LIB_C47_Skytrain";						// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
crewman_classname = "fow_s_uk_crewman";											// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "LIB_US_pilot";										// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
KP_liberation_little_bird_classname = "LIB_HORSA"; 				// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
KP_liberation_boat_classname = "LIB_LCM3_Armed"; 				// These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
KP_liberation_truck_classname = "LIB_US_GMC_Tent";				// These are the trucks which are used in the logistic convoy system.																	Default is "B_Truck_01_transport_F".
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";		// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";		// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
KP_liberation_recycle_building = "Land_CarService_F";					// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
KP_liberation_air_vehicle_building = "Land_Radar_Small_F";				// The building defined to unlock FOB air vehicle functionality.																		Default is "Land_Radar_Small_F".
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";				// The helipad used to increase the GLOBAL rotary-wing cap.																				Default is "Land_HelipadSquare_F".
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";				// The hangar used to increase the GLOBAL fixed-wing cap.																				Default is "Land_TentHangar_V1_F".
KP_liberation_supply_crate = "CargoNet_01_box_F";						// This defines the supply crates, as in resources.																						Default is "CargoNet_01_box_F".
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";						// This defines the ammunition crates.																									Default is "B_CargoNet_01_ammo_F".
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";						// This defines the fuel crates.																										Default is "CargoNet_01_barrels_F".

/* - Friendly classnames.
Each array below represents one of the 7 pages within the build menu. 
Format: ["vehicle_classname",supplies,ammunition,fuel],	Example: ["B_APC_Tracked_01_AA_F",300,150,150],
The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.	*/
infantry_units = [
	["fow_s_aus_officer",5,0,0],
	["fow_s_aus_temleader",5,0,0],
	["fow_s_uk_cdo_teamleader",5,0,0],
	["fow_s_uk_cdo_bren_gunner",5,0,0],
	["fow_s_aus_section_commander",5,0,0],
	["fow_s_uk_cdo_rifleman",2,0,0],
	["fow_s_aus_bren_gunner",5,0,0],
	["fow_s_aus_at",10,0,0],
	["fow_s_aus_medic",2,0,0],
	["fow_s_uk_cdo_radio_operator",2,0,0],
	["fow_s_uk_cdo_at_asst",3,0,0],
	["fow_s_uk_cdo_bren_asst",3,0,0],
	["fow_s_uk_cdo_at",10,0,0],
	["fow_s_uk_crewman",1,0,0],
	["LIB_US_pilot",1,0,0]
];

light_vehicles = [
	["LIB_US_NAC_Willys_MB",20,0,5],
	["lib_us6_open",50,0,20],
	["LIB_US_NAC_GMC_Open",50,0,20],
	["LIB_US_NAC_GMC_Tent",50,0,20],
	["R71USA",50,0,20],
	["fow_v_universalCarrier",50,5,10],
	["LIB_US_Scout_M3",100,10,20],
	["LIB_US_M3_Halftrack",100,10,30],
	["LIB_US_NAC_M3_Halftrack",100,10,20],
	["fow_v_lvta2_usa",200,100,25],
	["LIB_Zis5v_61k",200,100,25],
	["LIB_M8_Greyhound",200,150,75],
	["LIB_US6_BM13",1500,1000,75]
];

heavy_vehicles = [
	["LIB_M3A3_Stuart",250,50,50],
	["LIB_M5A1_Stuart",300,100,55],
	["fow_v_cromwell_uk",350,250,200],
	["LIB_M4A3_75",550,400,200],
	["LIB_M4A3_75_tubes",600,400,220],
	["LIB_M4A3_76",700,500,250],
	["LIB_M4A3_76_HVSS",800,550,300],
	["LIB_M4A4_Firefly",1000,650,400]
];

air_vehicles = [
	["LIB_CG4_Waco",0,0,0],
	["LIB_Horsa",0,0,0],
	["sab_gladiator",25,10,25],
	["sab_s510",30,10,25],
	["sab_d510",40,10,25],
	["lib_p26",50,10,25],
	["lib_C47_Skytrain",100,0,75],
	["LIB_US_P39",150,100,100],
	["LIB_US_P39_2",200,150,100],
	["ifa3_p47",250,200,150],
	["ifa3_p47_rocket",275,250,150],
	["lib_p51_mustang_blue_1",300,300,200],
	["sab_mb5",350,350,250],
	["sab_texan",400,375,300],
	["sab_dauntless",450,400,325],
	["lib_f4u_white",500,425,375],
	["lib_f6f_grey",550,450,400],
	["fow_va_f6f_c",600,450,450],
	["lib_f7f_blue",650,500,500],
	["sab_avenger",700,550,525],
	["lib_p38_green",750,600,550],
	["sab_p61",800,650,600],
	["sab_meteor",900,700,700],
	["lib_b17_beige",1000,950,800],
	["lib_b24_green_2",1250,1250,850],
	["lib_b25_green",1500,1200,650]
];

static_vehicles = [
    ["fow_w_vickers_uk",50,10,0],
	["LIB_M2_60",150,50,0],
	["ifa3_M2StaticMG_base",50,10,0],
	["fow_uk_6Pounder",150,20,0],
	["fow_w_6pounder_usa",150,20,0],
	["LIB_leFH18",500,350,0],
	["LIB_Nebelwerfer41",850,600,0],
	["sab_small_static_aa2",150,100,0],
	["sab_small_static_2xaa2",250,150,0],
	["sab_static_aa2",400,200,0],
	["sab_static_deckgun2",500,250,0],
	["sab_static_12inch2",1000,500,0],
	["sab_item_flak0",100,50,0]
];

buildings = [
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_GuardShed",0,0,0],
	["Land_Misc_deerstand",0,0,0],
	["Land_WW2_Rus_plash_palatka",0,0,0],
	["Land_tent_east",0,0,0],
	["Land_setka_car",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_CamoNet_NATO",0,0,0],
	["LIB_FlagCarrier_SU",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_WW2_wire_2",0,0,0],
	["Hhedgehog_concreteBig",0,0,0],
	["Hedgehog",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_fort_bagfence_long",0,0,0],
	["Land_fort_bagfence_round",0,0,0],
	["Land_fort_bagfence_bunker",0,0,0],
	["WoodChair",0,0,0],
	["Land_WoodenTable_small_F",0,0,0],
	["Land_WoodenTable_large_F",0,0,0],
	["MetalBarrel_burning_F",0,0,0],
	["Campfire_burning_F",0,0,0],
	["Gunrack2",0,0,0],
	["Lib_AmmoCrates_NoInteractive_Large",0,0,0],
	["CargoNet_01_box_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0],
	["trench_gun1",0,0,0],
	["trench_small1",0,0,0],
	["trench_mortar",0,0,0],
	["Trench_Single1",0,0,0],
	["WW2_Fortification_Trench_Bunker_FFP_Doors",0,0,0],
	["WW2_Fortification_Trench_Corner_90",0,0,0],
	["WW2_Fortification_Trench_Corner_x2",0,0,0],
	["WW2_Fortification_Trench_Bunker_Big_Doors",0,0,0],
	["WW2_Fortification_Trench_Long_x3",0,0,0],
	["WW2_Fortification_Trench_Wall",0,0,0],
	["WW2_Fortification_Trench_Wide",0,0,0],
	["WW2_Fortification_Trench_Bridge",0,0,0],
	["Land_fort_rampart",0,0,0],
	["Trench_Tank1",0,0,0],
	["Land_fort_artillery_nest",0,0,0]
];

support_vehicles = [
	[Arsenal_typename,100,200,0],
	[Respawn_truck_typename,200,0,100],
	[FOB_truck_typename,300,500,75],
	[KP_liberation_small_storage_building,0,0,0],
	[KP_liberation_large_storage_building,0,0,0],
	[KP_liberation_recycle_building,250,0,0],
	[KP_liberation_plane_slot_building,500,0,0],
	[KP_liberation_air_vehicle_building,1000,0,0],
	["ACE_medicalSupplyCrate_advanced",50,0,0],
	["LIB_US_GMC_Parm",200,0,50],
	["LIB_US_GMC_Fuel",150,0,200],
	["LIB_US_GMC_Ammo",150,150,50],
	["LIB_US_GMC_Ambulance",200,0,50],
	["LIB_LCM3_Armed",250,50,75],
	["sab_boat_rubberboat",5,0,0],
	["sab_boat_torpedo",500,200,250],
	["sab_boat_u7",750,450,500],
	["sab_boat_destroyer",2500,1500,1000],
	["sab_boat_cruiser",4000,2500,2000],
	["sab_boat_battleship",6000,4000,4000],
	["sab_carrier_enterprise",2000,0,1000],
	["sab_item_carrier2",4000,0,2000]
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
	"fow_s_aus_section_commander",
	"fow_s_aus_medic",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_asst",
	"fow_s_aus_at",
	"fow_s_aus_at_asst"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"fow_s_aus_section_commander",
	"fow_s_aus_medic",
	"fow_s_aus_teamleader",
	"fow_s_aus_teamleader",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_asst",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_asst",
	"fow_s_aus_at",
	"fow_s_aus_at_asst"
];

// AT specialists squad.
blufor_squad_at = [
	"fow_s_aus_section_commander",
	"fow_s_aus_rifleman",
	"fow_s_aus_at",
	"fow_s_aus_at",
	"fow_s_aus_at_asst"
];

// AA specialists squad.
blufor_squad_aa = [
	"fow_s_aus_section_commander",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_gunner",
	"fow_s_aus_bren_asst",
	"fow_s_aus_bren_asst",
	"fow_s_aus_bren_asst",
	"fow_s_aus_bren_asst"
];

// Force recon squad.
blufor_squad_recon = [
	"fow_s_aus_section_commander",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_rifleman",
	"fow_s_aus_medic",
	"fow_s_aus_medic"
];

// Paratroopers squad.
blufor_squad_para = [
	"LIB_US_101AB_CO_para",
	"LIB_US_101AB_NCO_para",
	"LIB_US_101AB_mgunner_assistant_para",
	"LIB_US_101AB_AT_soldier_para",
	"LIB_US_101AB_mgunner_para",
	"LIB_US_101AB_rifleman_para",
	"LIB_US_101AB_rifleman_para",
	"LIB_US_101AB_rifleman_para",
	"LIB_US_101AB_rifleman_para",
	"LIB_US_101AB_rifleman_para"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
"lib_C47_Skytrain",
"LIB_US_P39",
"LIB_US_P39_2",
"ifa3_p47",
"ifa3_p47_rocket",
"lib_p51_mustang_blue_1",
"sab_mb5",
"sab_texan",
"sab_dauntless",
"lib_f4u_white",
"lib_f6f_grey",
"fow_va_f6f_c",
"lib_f7f_blue",
"sab_avenger",
"lib_p38_green",
"sab_p61",
"sab_meteor",
"lib_b17_beige",
"lib_b24_green_2",
"lib_b25_green",
"fow_uk_6Pounder",
"LIB_M8_Greyhound",
"LIB_M3A3_Stuart",
"LIB_M5A1_Stuart",
"fow_v_cromwell_uk",
"LIB_M4A3_75",
"LIB_M4A3_75_tubes",
"LIB_M4A3_76",
"LIB_M4A3_76_HVSS",
"LIB_M4A4_Firefly"
];
