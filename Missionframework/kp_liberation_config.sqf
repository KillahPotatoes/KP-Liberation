/*
CONFIG FILE FOR KP LIBERATION
TO ADJUST THE ARSENAL WHITELIST OPEN: arsenal.sqf
*/

// Use ACE?
// true or false
KP_liberation_ace = false;


// Vehicle classnames which should be a medical vehicle (for ACE only)
KP_liberation_medical_vehicles = [
	"B_Truck_01_medical_F",
	"rhsusf_m113d_usarmy_medical",
	"RHS_UH60M_MEV2"
];


// Which units preset should be used?
// 0 = default (edit the custom.sqf in the presets folder to change things)
// 1 = RHS and Project OPFOR Takistan Setting
// 2 = RHS Setting
// 3 = RHS with BW Mod Setting
// 4 = Vanilla Apex Tanoa
KP_liberation_preset = 0;


// Which arsenal preset should be used?
// 0 = use blacklist method from units preset
// 1 = custom (edit the custom.sqf in the arsenal_presets folder to change things)
// 2 = Killah Potatoes Gaming Community
// 3 = RHS United States Armed Forces Arsenal Preset
// 4 = RHS United States Armed Forces Arsenal with ACE Preset
// 5 = RHS United States Armed Forces Arsenal with ACE and ACRE Preset
KP_liberation_arsenal = 0;


// Fuel Consumption
// Time in Minutes till a full tank depletes when the vehicle is standing with running engine
KP_liberation_fuel_neutral = 180;
// Time in Minutes till a full tank depletes when the vehicle is driving
KP_liberation_fuel_normal = 90;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
KP_liberation_fuel_max = 45;


// Gameplay Constants
// Name of the savegame namespace inside the [ServerProfileName].vars.Arma3Profile
GRLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME";

// Friendly side
GRLIB_side_friendly = WEST;
// Enemy side
GRLIB_side_enemy = EAST;
// Resistance / Militia side
GRLIB_side_resistance = RESISTANCE;
// Civil Side
GRLIB_side_civilian = CIVILIAN;
// Respawn marker name
GRLIB_respawn_marker = "respawn_west";
// Friendly side marker color
GRLIB_color_friendly = "ColorBLUFOR";
// Enemy side marker color
GRLIB_color_enemy = "ColorOPFOR";
// Enemy side marker color (activated)
GRLIB_color_enemy_bright = "ColorRED";

// Range to activate a sector
GRLIB_sector_size = 1000;
// Range to capture a sector
GRLIB_capture_size = 175;
// Range of Radio Tower scanning range
GRLIB_radiotower_size = 2500;
// Percentage of resources you get back from recycling
GRLIB_recycling_percentage = 0.25;
// Time in seconds how long a captured sector is vulnerable to enemy troops
GRLIB_vulnerability_timer = 1200;
// Multiplier for defenders in buildings
GRLIB_defended_buildingpos_part = 0.4;
// Multiplier for supply crate spawning
GRLIB_sector_capture_value = 3;
// Multiplier for ammo crate spawning
GRLIB_sector_military_value = 3;
// Multiplier for fuel crate spawning
GRLIB_sector_fuel_value = 3;
// Impact percentage at combat readiness for FOB hunting
GRLIB_secondary_objective_impact = 0.6;
// Caps for BLUFOR, sector defenders, enemy battlegroups and patrols
GRLIB_blufor_cap = 100								* GRLIB_unitcap;
GRLIB_sector_cap = 180								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150							* GRLIB_unitcap;
GRLIB_patrol_cap = 150								* GRLIB_unitcap;
// Size of enemy battlegroups
GRLIB_battlegroup_size = 6							* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
// Civilian count multiplier
GRLIB_civilians_amount = 10 						* GRLIB_civilian_activity;
// Build range around the FOB building
GRLIB_fob_range = 125;
// Time in seconds until bodies of dead soldiers get cleaned up
GRLIB_cleanup_delay = 1200;
// Chance that enemies will surrender when heavy losses are encountered
GRLIB_surrender_chance = 80;
// Intel price for the secondary missions [FOB hunting, Convoy ambush, SAR]
GRLIB_secondary_missions_costs = [10, 10, 10];
// Altitude in meters for the HALO jump
GRLIB_halo_altitude = 4000;
// Penalty for killing civilians
GRLIB_civ_killing_penalty = 100;


// Little Bird placement positions on LHD
KP_liberation_little_bird_positions = [
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 116, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 97, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 83, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 56, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 71, 16.75]
];


// Large storage area placement position offsets
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


// Small storage area placement position offsets
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


// DONT CHANGE (only if you really know what you're doing)
GRLIB_endgame = 0;

if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 };

GRLIB_offload_diag = false;
