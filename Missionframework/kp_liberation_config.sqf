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
// 0 = Vanilla (a zbug legacy preset)
// 1 = default (edit the custom.sqf in the presets folder to change things)
// 2 = RHS and Project OPFOR Takistan Setting
// 3 = RHS Setting
// 4 = RHS with BW Mod Setting
// 5 = Vanilla Apex Tanoa
KP_liberation_preset = 1;

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

// Little Bird placement positions on LHD
KP_liberation_little_bird_positions = [
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 116, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 97, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 83, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 56, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 71, 16.75]
];
