/*
CONFIG FILE FOR KP LIBERATION
*/

// Use ACE? (true or false).
KP_liberation_ace = false;

// Vehicle classnames which should be a medical vehicle (for ACE users only).
KP_liberation_medical_vehicles = [
	"B_Truck_01_medical_F",
	"B_T_Truck_01_medical_F",
	"rhsusf_m113d_usarmy_medical",
	"RHS_UH60M_MEV2"
];

// Classnames of ACE 3 crates (these need to be defined in the unit preset to be available).
KP_liberation_ace_crates = [
	"ACE_Box_82mm_Mo_HE",
	"ACE_Box_82mm_Mo_Smoke",
	"ACE_Box_82mm_Mo_Illum",
	"ACE_medicalSupplyCrate_advanced"
];

/* Which units preset should be used?
0 = Default (edit the custom.sqf in the presets folder to change things).
1 = RHS and Project OPFOR Takistan Setting
2 = RHS Setting
3 = RHS with BW Mod Setting
4 = Vanilla Apex	*/
KP_liberation_preset = 0;

/* Which arsenal preset should be used?
0 = Uses the blacklist found below only.
1 = Custom (edit the custom.sqf in the arsenal_presets folder to change things).
2 = Killah Potatoes Gaming Community
3 = RHS United States Armed Forces Arsenal Preset
4 = RHS United States Armed Forces Arsenal with ACE Preset
5 = RHS United States Armed Forces Arsenal with ACE and ACRE Preset	*/
KP_liberation_arsenal = 0;

// Fuel Consumption
KP_liberation_fuel_neutral = 180;				// Time (in minutes) until a full tank depletes, where the vehicle is standing still with a running engine.
KP_liberation_fuel_normal = 90;					// Time (in minutes) until a full tank depletes, where the vehicle is driving below max speed.
KP_liberation_fuel_max = 45;					// Time (in minutes) until a full tank depletes, where the vehicle is driving at max speed.

// Gameplay Constants
GRLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME";	// Name of the savegame namespace inside the [ServerProfileName].vars.Arma3Profile.

GRLIB_side_friendly = WEST;						// Friendly side.
GRLIB_side_enemy = EAST;						// Enemy side.
GRLIB_side_resistance = RESISTANCE;				// Resistance/Militia side.
GRLIB_side_civilian = CIVILIAN;					// Civilian side.
GRLIB_respawn_marker = "respawn_west";			// Respawn marker name.
GRLIB_color_friendly = "ColorBLUFOR";			// Friendly side marker color.
GRLIB_color_enemy = "ColorOPFOR";				// Enemy sector marker color.
GRLIB_color_enemy_bright = "ColorRED";			// Enemy sector marker color (while activated).
GRLIB_sector_size = 1000;						// Range to activate a sector
GRLIB_capture_size = 175;						// Range to capture a sector
GRLIB_radiotower_size = 2500;					// Range of Radio Tower scanning range
GRLIB_recycling_percentage = 0.5;				// Percentage of resources you get back from recycling
GRLIB_vulnerability_timer = 1200;				// Time in seconds how long a captured sector is vulnerable to enemy troops
GRLIB_defended_buildingpos_part = 0.4;			// Multiplier for defenders in buildings
GRLIB_sector_capture_value = 3;					// Multiplier for supply crate spawning
GRLIB_sector_military_value = 3;				// Multiplier for ammo crate spawning
GRLIB_sector_fuel_value = 3;					// Multiplier for fuel crate spawning
GRLIB_secondary_objective_impact = 0.6;			// Impact percentage at combat readiness for FOB hunting

// Caps (limit) for BLUFOR, sector defenders, enemy battlegroups and patrols.
GRLIB_blufor_cap = 100							* GRLIB_unitcap;
GRLIB_sector_cap = 180							* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150						* GRLIB_unitcap;
GRLIB_patrol_cap = 150							* GRLIB_unitcap;
// Size of enemy battlegroups.
GRLIB_battlegroup_size = 6						* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
// Civilian count multiplier.
GRLIB_civilians_amount = 10 					* GRLIB_civilian_activity;

GRLIB_fob_range = 125;							// Build range around the FOB building.
GRLIB_cleanup_delay = 1200;						// Time in seconds until bodies of dead soldiers get cleaned up.
GRLIB_surrender_chance = 80;					// Chance that enemies will surrender when heavy losses are encountered.
GRLIB_secondary_missions_costs = [15, 10, 8];	// Intel price for the secondary missions [FOB hunting, Convoy ambush, SAR].
GRLIB_halo_altitude = 2200;						// Altitude in meters for the HALO jump.
GRLIB_civ_killing_penalty = 100;				// Penalty for killing civilians.

/* Blacklisted arsenal items such as OP scopes or broken mod content maybe.
IMPORTANT: All deployable weapons that should be bought and not created through the VArsenal should be defined here when this blacklist is in use ("KP_liberation_arsenal = 0;").
Again, this blacklist is not used if you're using a predefined arsenal via the "KP_liberation_arsenal =" line at the top of this file.
REMEMBER: A whitelisted arsenal is always more performance friendly than a blacklisted arsenal.	*/
blacklisted_from_arsenal = [
	"B_Respawn_Sleeping_bag_blue_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Respawn_TentA_F",
	"I_GMG_01_A_weapon_F",
	"O_GMG_01_A_weapon_F",
	"B_GMG_01_A_weapon_F",
	"I_HMG_01_A_weapon_F",
	"B_HMG_01_A_weapon_F",
	"O_HMG_01_A_weapon_F",
	"O_HMG_01_weapon_F",
	"B_HMG_01_weapon_F",
	"I_HMG_01_weapon_F",
	"I_HMG_01_high_weapon_F",
	"O_HMG_01_high_weapon_F",
	"B_HMG_01_high_weapon_F",
	"O_GMG_01_weapon_F",
	"I_GMG_01_weapon_F",
	"B_GMG_01_weapon_F",
	"B_GMG_01_high_weapon_F",
	"I_GMG_01_high_weapon_F",
	"O_GMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"O_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"O_Mortar_01_weapon_F",
	"I_Mortar_01_weapon_F",
	"B_HMG_01_support_F",
	"O_HMG_01_support_F",
	"I_HMG_01_support_F",
	"B_HMG_01_support_high_F",
	"O_HMG_01_support_high_F",
	"I_HMG_01_support_high_F",
	"B_AA_01_weapon_F",
	"O_AA_01_weapon_F",
	"I_AA_01_weapon_F",
	"B_AT_01_weapon_F",
	"O_AT_01_weapon_F",
	"I_AT_01_weapon_F",
	"I_UAV_01_backpack_F",
	"B_UAV_01_backpack_F",
	"O_UAV_01_backpack_F",
	//...add all Apex variant UAV and static bags here maybe, for Apex players using blacklist only.
	"optic_Nightstalker",
	"optic_tws",
	"optic_tws_mg"
];

/* Configuration for resource crate transport.
The format = ["classname", distance behind vehicle to unload crate, attachTo positions for each box].
For example: ["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]], = NATO open transport truck, able to carry 3 boxes.	*/
box_transport_config = [
	["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_T_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_T_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
	["B_Heli_Transport_03_F", -7.5, [0,2.2,-1], [0,0.8,-1], [0-1.0,-1]],
	["B_Heli_Transport_03_unarmed_F", -7.5, [0,2.2,-1], [0,0.8,-1], [0-1.0,-1]],
	["I_Heli_Transport_02_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
	["O_Truck_03_transport_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_Truck_03_covered_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_T_Truck_03_transport_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["O_T_Truck_03_covered_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
	["greuh_eh101_gr", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]]
];

// Everything the AI troups should be able to resupply from.
ai_resupply_sources = [
	"B_Truck_01_ammo_F",
	"B_T_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_AMMO_usarmy_wd",
	"rhsusf_M977A4_AMMO_usarmy_d"
];

// Everything that can repair/rearm/refuel other vehicles.
vehicle_repair_sources = [
	"C_Offroad_01_repair_F",
	"B_Truck_01_Repair_F",
	"B_T_Truck_01_Repair_F",
	"B_Slingload_01_Repair_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_REPAIR_usarmy_wd",
	"rhsusf_M977A4_REPAIR_usarmy_d"
];

vehicle_rearm_sources = [
	"B_Truck_01_ammo_F",
	"B_T_Truck_01_ammo_F",
	"B_Slingload_01_Ammo_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M977A4_AMMO_usarmy_wd",
	"rhsusf_M977A4_AMMO_usarmy_d"
];

vehicle_refuel_sources = [
	"C_Van_01_fuel_F",
	"B_Truck_01_fuel_F",
	"B_T_Truck_01_fuel_F",
	"B_Slingload_01_Fuel_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"rhsusf_M978A4_usarmy_wd",
	"rhsusf_M978A4_usarmy_d"
];

// Classnames of boats, so they can be built on water.
boats_names = [
	"B_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"B_T_Boat_Transport_01_F",
	"B_T_Boat_Armed_01_minigun_F",
	"O_Boat_Transport_01_F",
	"O_Boat_Armed_01_hmg_F",
	"O_T_Boat_Transport_01_F",
	"O_T_Boat_Armed_01_hmg_F",
	"rhsusf_mkvsoc"
];

// Little Bird placement positions on LHD.
KP_liberation_little_bird_positions = [
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 116, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 97, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 83, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 56, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 71, 16.75]
];

// Large storage area placement position offsets.
KP_liberation_large_storage_positions = [
	[-5.59961,3.60938,0.6],
	[-3.99902,3.60938,0.6],
	[-2.39941,3.60938,0.6],
	[-0.799805,3.60938,0.6],
	[0.800781,3.60938,0.6],
	[2.40039,3.60938,0.6],
	[4.00098,3.60938,0.6],
	[5.60059,3.60938,0.6],
	[-5.59961,1.80859,0.6],
	[-3.99902,1.80859,0.6],
	[-2.39941,1.80859,0.6],
	[-0.799805,1.80859,0.6],
	[0.800781,1.80859,0.6],
	[2.40039,1.80859,0.6],
	[4.00098,1.80859,0.6],
	[5.60059,1.80859,0.6],
	[-5.59961,0.00976563,0.6],
	[-3.99902,0.00976563,0.6],
	[-2.39941,0.00976563,0.6],
	[-0.799805,0.00976563,0.6],
	[0.800781,0.00976563,0.6],
	[2.40039,0.00976563,0.6],
	[4.00098,0.00976563,0.6],
	[5.60059,0.00976563,0.6],
	[-5.59961,-1.79102,0.6],
	[-3.99902,-1.79102,0.6],
	[-2.39941,-1.79102,0.6],
	[-0.799805,-1.79102,0.6],
	[0.800781,-1.79102,0.6],
	[2.40039,-1.79102,0.6],
	[4.00098,-1.79102,0.6],
	[5.60059,-1.79102,0.6],
	[-5.59961,-3.58984,0.6],
	[-3.99902,-3.58984,0.6],
	[-2.39941,-3.58984,0.6],
	[-0.799805,-3.58984,0.6],
	[0.800781,-3.58984,0.6],
	[2.40039,-3.58984,0.6],
	[4.00098,-3.58984,0.6],
	[5.60059,-3.58984,0.6]
];

// Small storage area placement position offsets.
KP_liberation_small_storage_positions = [
	[-2.34961,1.80078,0.6],
	[-0.75,1.80078,0.6],
	[0.850586,1.80078,0.6],
	[2.4502,1.80078,0.6],
	[-2.34961,0,0.6],
	[-0.75,0,0.6],
	[0.850586,0,0.6],
	[2.4502,0,0.6],
	[-2.34961,-1.79883,0.6],
	[-0.75,-1.79883,0.6],
	[0.850586,-1.79883,0.6],
	[2.4502,-1.79883,0.6]
];

// DO NOT CHANGE (only if you really know what you're doing!).
GRLIB_endgame = 0;
if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 };
GRLIB_offload_diag = false;
