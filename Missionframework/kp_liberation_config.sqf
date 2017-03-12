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
// 0 = Vanilla
// 1 = custom (edit the custom.sqf in the presets folder to your likings)
// 2 = RHS and Project OPFOR Takistan Setting
// 3 = RHS Setting
// 4 = RHS with BW Mod Setting
KP_liberation_preset = 0;

// Little Bird starting helicopters on LHD
KP_liberation_little_bird_classname = "B_Heli_Light_01_F";
KP_liberation_little_bird_positions = [
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 116, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 97, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) + 83, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 56, 16.75],
	[(getpos lhd select 0) + 9, (getpos lhd select 1) - 71, 16.75]
];

// Fuel Consumption
// Time in Minutes till a full tank depletes when the vehicle is standing with running engine
KP_liberation_fuel_neutral = 180;
// Time in Minutes till a full tank depletes when the vehicle is driving
KP_liberation_fuel_normal = 90;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
KP_liberation_fuel_max = 45;
