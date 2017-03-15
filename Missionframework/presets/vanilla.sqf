// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.



// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = nil;							// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = nil;						// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = nil;					// Default "B_Truck_01_box_F";
Arsenal_typename = nil;						// Default "B_supplyCrate_F";
Respawn_truck_typename = nil;				// Default "B_Truck_01_medical_F";
huron_typename = nil;						// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = nil;					// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = nil;					// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = nil;				// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = nil;					// Default "B_officer_F"
crewman_classname = nil;					// Default "B_crew_F";
pilot_classname = nil;						// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = nil;	// Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base




// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = false;
infantry_units_extension = [

];

light_vehicles_overwrite = false;
light_vehicles_extension = [
	["rhsusf_m998_w_4dr",0,0,5],
	["rhsusf_rg33_m2_d",0,40,5],
	["fsf_fnk_norm_ce",0,0,3],
	["greuh_fnk_norm_ce",0,0,3],
	["I_MRAP_03_F",0,0,5],
	["I_MRAP_03_hmg_F",0,40,5],
	["I_MRAP_03_gmg_F",0,60,5],
	["fsf_fnk_hmg_ce",0,10,3],
	["greuh_fnk_hmg_ce",0,10,3],
	["greuh_fnk_hmg_dsrt",0,10,3]
];

heavy_vehicles_overwrite = false;
heavy_vehicles_extension = [
	["I_APC_Wheeled_03_cannon_F",0,100,10],
	["greuh_pandur_wdld",0,50,10],
	["I_APC_tracked_03_cannon_F",0,180,15],
	["greuh_fv510_wdld",0,40,15],
	["greuh_fv510_dsrt",0,40,15],
	["RHS_M2A3_BUSKIII_wd",0,240,15],
	["Steve_MBT_Kuma",0,100,25],
	["I_MBT_03_cannon_F",0,350,25],
	["rhsusf_m1a2sep1tuskiid_usarmy",0,500,25],
	["Burnes_FV4034_01",0,250,40]
];

air_vehicles_overwrite = false;
air_vehicles_extension = [
	["greuh_aw159_t",0,0,12],
	["greuh_aw159_a",0,50,12],
	["I_Heli_light_03_unarmed_F",0,0,10],
	["I_Heli_light_03_F",0,500,10],
	["JNS_Skycrane_BLU_Black",0,0,18],
	["RHS_CH_47F",0,80,20],
	["greuh_eh101_gr",0,0,25],
	["I_Heli_Transport_02_F",0,0,25],
	["MV22",0,0,25],
	["RHS_AH1Z_wd_GS",0,1000,30],
	["H_RAH66",0,200,30],
	["RHS_AH64D_wd",0,1200,50],
	["FIR_F16C",0,100,30],
	["FIR_F15E",0,200,50],
	["JS_JC_FA18E",0,3000,40],
	["JS_JC_FA18F",0,3200,40],
	["sab_C130_CSP",0,0,30],
	["sab_C130_J",0,0,30],
	["usaf_f22",0,2800,75],
	["USAF_F35A",0,2800,75],
	["I_Plane_Fighter_03_AA_F",0,1600,50],
	["I_Plane_Fighter_03_CAS_F",0,1800,50]
];

static_vehicles_overwrite = false;
static_vehicles_extension = [

];

buildings_overwrite = false;
buildings_extension = [

];

support_vehicles_overwrite = false;		// If you're going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
	["JNS_Skycrane_Pod_Bench_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Ammo_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Medical_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Repair_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Transport_BLU_Black",5,0,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"B_UAV_01_F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [

];

// Heavy infantry squad
blufor_squad_inf = [

];

// AT specialists squad
blufor_squad_at = [

];

// AA specialists squad
blufor_squad_aa = [

];

// Force recon squad
blufor_squad_recon = [

];

// Paratroopers squad
blufor_squad_para = [

];







// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = nil;
opfor_rifleman = nil;
opfor_grenadier = nil;
opfor_squad_leader = nil;
opfor_team_leader = nil;
opfor_marksman = nil;
opfor_machinegunner = nil;
opfor_heavygunner = nil;
opfor_medic = nil;
opfor_rpg = nil;
opfor_at = nil;
opfor_aa = nil;
opfor_officer = nil;
opfor_sharpshooter = nil;
opfor_sniper = nil;
opfor_engineer = nil;
opfor_paratrooper = nil;

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = nil;
opfor_mrap_armed = nil;
opfor_transport_helo = nil;
opfor_transport_truck = nil;
opfor_fuel_truck = nil;
opfor_ammo_truck = nil;
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = nil;

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = false;
militia_squad_extension = [

];

// Militia vehicles to choose from
militia_vehicles_overwrite = false;
militia_vehicles_extension = [
	"rhs_btr70_chdkz",
	"rhs_zsu234_chdkz",
	"I_MU_mercs_Offroad_01_armed_F",
	"I_MU_mercs_Offroad_01_armed_F",
	"LOP_AFR_BTR60",
	"LOP_AFR_M113_W",
	"LOP_AFR_T72BA",
	"I_MU_mercs_Offroad_01_armed_F"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = false;
opfor_vehicles_extension = [

];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = false;
opfor_vehicles_low_intensity_extension = [

];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = false;
opfor_battlegroup_vehicles_extension = [

];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = false;
opfor_battlegroup_vehicles_low_intensity_extension = [

];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = false;
opfor_troup_transports_extension = [

];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = false;
opfor_choppers_extension = [

];

// Opfor military aircrafts
opfor_air_overwrite = false;
opfor_air_extension = [

];







// Other stuff

// civilians
civilians_overwrite = false;
civilians_extension = [

];

// civilian vehicles
civilian_vehicles_overwrite = false;
civilian_vehicles_extension = [

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [

];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [

];
vehicle_rearm_sources_extension = [

];
vehicle_refuel_sources_extension = [

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
	"B_UGV_01_rcws_F",
	"B_MBT_01_TUSK_F",
	"B_MBT_01_arty_F",
	"B_MBT_01_mlrs_F",
	"B_Heli_Attack_01_F",
	"B_Plane_CAS_01_F",
	"B_UAV_02_F",
	"B_UAV_02_CAS_F"
];

// Blacklisted arsenal items such as deployable weapons that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf
// REMEMBER: Using of the Blacklist will decrease performance while entering the arsenal. Usage of Whitelist is highly recommended.

// Classnames of weapons which should not be available in the arsenal
blacklisted_from_arsenal_weapons = [

];

// Classnames of items (optics, uniforms, vests, etc.) which should not be available in the arsenal
blacklisted_from_arsenal_items = [
	"optic_Nightstalker",
	"optic_tws",
	"optic_tws_mg"
];

// Classnames of magazines or explosives which should not be available in the arsenal
blacklisted_from_arsenal_magazines = [

];

// Classnames of backpacks which should not be available in the arsenal
blacklisted_from_arsenal_extension = [
	"RHS_Podnos_Bipod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Metis_Gun_Bag",
	"RHS_Metis_Tripod_Bag",
	"RHS_AGS30_Tripod_Bag",
	"RHS_AGS30_Gun_Bag",
	"RHS_DShkM_Gun_Bag",
	"RHS_DShkM_TripodHigh_Bag",
	"RHS_DShkM_TripodLow_Bag",
	"RHS_Kord_Tripod_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"rhs_M252_Gun_Bag",
	"rhs_M252_Bipod_Bag",
	"RHS_M2_MiniTripod_Bag",
	"RHS_Mk19_Gun_Bag",
	"RHS_Mk19_Tripod_Bag",
	"RHS_NSV_Tripod_Bag",
	"RHS_NSV_Gun_Bag",
	"RHS_SPG9_Gun_Bag",
	"RHS_SPG9_Tripod_Bag",
	"rhs_Tow_Gun_Bag",
	"rhs_TOW_Tripod_Bag"
];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];