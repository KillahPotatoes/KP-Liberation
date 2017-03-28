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

// Large storage area placement positions
KP_liberation_large_storage_positions = [
	[6.65679,302.734],
	[5.38119,311.984],
	[4.32601,326.314],
	[3.68739,347.473],
	[3.68761,12.542],
	[4.32655,33.6972],
	[5.38119,48.0159],
	[6.65761,57.2703],
	[5.88204,287.827],
	[4.38666,294.237],
	[3,306.889],
	[1.97041,336.052],
	[1.9708,23.974],
	[3.00078,53.1226],
	[4.38666,65.7629],
	[5.88297,72.1756],
	[5.59961,270],
	[4,270],
	[2.39941,270],
	[0.799805,270],
	[0.800781,90],
	[2.40039,90],
	[4,90],
	[5.60059,90],
	[5.88145,252.191],
	[4.38586,245.786],
	[2.99883,233.141],
	[1.96862,203.971],
	[1.96902,156.003],
	[2.99961,126.848],
	[4.38586,114.214],
	[5.88238,107.806],
	[6.65679,237.266],
	[5.38119,228.016],
	[4.32601,213.686],
	[3.68739,192.527],
	[3.68761,167.458],
	[4.32655,146.303],
	[5.38119,131.984],
	[6.65761,122.73]
];

// Small storage area placement positions
KP_liberation_small_storage_positions = [
	[3.03961,306.285],
	[1.98979,334.693],
	[1.94892,22.6331],
	[2.95913,52.5628],
	[2.4502,270],
	[0.850586,270],
	[0.75,90],
	[2.34961,90],
	[3.04077,233.686],
	[1.99156,205.283],
	[1.95072,157.389],
	[2.96032,127.467]
];
