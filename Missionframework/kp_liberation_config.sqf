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
