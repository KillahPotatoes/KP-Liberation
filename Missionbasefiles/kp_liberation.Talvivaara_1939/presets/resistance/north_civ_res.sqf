/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "C_NORTH_NOR_CIV_Fisherman_1",
    "C_NORTH_NOR_CIV_Fisherman_2",
    "C_NORTH_NOR_CIV_Fancy_1",
    "C_NORTH_NOR_CIV_Fancy_2",
    "C_NORTH_NOR_CIV_Fancy_3",
    "C_NORTH_NOR_CIV_Farmer_1",
    "C_NORTH_NOR_CIV_Farmer_2",
    "C_NORTH_NOR_CIV_Farmer_3",
    "C_NORTH_NOR_CIV_Civilian_1",
    "C_NORTH_NOR_CIV_Civilian_2",
    "C_NORTH_NOR_CIV_Civilian_3",
    "C_NORTH_NOR_CIV_Civilian_Jacket_1",
    "C_NORTH_NOR_CIV_Civilian_Jacket_2",
    "C_NORTH_NOR_CIV_Civilian_Jacket_3",
    "C_NORTH_NOR_CIV_Worker_1",
    "C_NORTH_NOR_CIV_Worker_2",
    "C_NORTH_NOR_CIV_Worker_3",
    "C_NORTH_NOR_CIV_Worker_Jacket_1",
    "C_NORTH_NOR_CIV_Worker_Jacket_2",
    "C_NORTH_NOR_CIV_Worker_Jacket_3"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
	"LIB_GazM1",
	"LIB_GazM1_dirty"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["NORTH_m1895","NORTH_6Rnd_m1895_mag",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["NORTH_sov_M9130","NORTH_5Rnd_m39_mag",4,""]
];

KP_liberation_guerilla_weapons_3 = [
	["NORTH_sov_M9130","NORTH_5Rnd_m39_mag",8,""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "U_NORTH_CIV_Wool_1",
    "U_NORTH_CIV_Wool_2",
    "U_NORTH_CIV_Wool_3",
    "U_NORTH_CIV_Wool_4",
    "U_NORTH_CIV_Wool_5",
    "U_NORTH_CIV_Wool_6",
    "U_NORTH_CIV_Wool_7",
    "U_NORTH_CIV_Suit_1",
    "U_NORTH_CIV_Suit_2",
    "U_NORTH_CIV_Suit_3",
    "U_NORTH_CIV_Suit_4",
    "U_NORTH_CIV_Suit_5",
    "U_NORTH_CIV_Suit_6",
    "U_NORTH_CIV_Suit_7",
    "U_NORTH_CIV_Suit_8",
    "U_NORTH_CIV_Suit_9",
    "U_NORTH_CIV_Suit_10",
    "U_NORTH_CIV_Suit_11",
    "U_NORTH_CIV_Suit_12",
    "U_NORTH_CIV_Jacket_1",
    "U_NORTH_CIV_Jacket_2",
    "U_NORTH_CIV_Jacket_3",
    "U_NORTH_CIV_Jacket_4",
    "U_NORTH_CIV_Jacket_5",
    "U_NORTH_CIV_Jacket_6",
    "U_NORTH_CIV_Jacket_7",
    "U_NORTH_CIV_Jacket_8",
    "U_NORTH_CIV_Jacket_9",
    "U_NORTH_CIV_Jacket_10",
    "U_NORTH_CIV_Jacket_11",
    "U_NORTH_CIV_Jacket_12"
];

KP_liberation_guerilla_uniforms_2 = [
    "U_NORTH_CIV_Wool_1",
    "U_NORTH_CIV_Wool_2",
    "U_NORTH_CIV_Wool_3",
    "U_NORTH_CIV_Wool_4",
    "U_NORTH_CIV_Wool_5",
    "U_NORTH_CIV_Wool_6",
    "U_NORTH_CIV_Wool_7",
    "U_NORTH_CIV_Suit_1",
    "U_NORTH_CIV_Suit_2",
    "U_NORTH_CIV_Suit_3",
    "U_NORTH_CIV_Suit_4",
    "U_NORTH_CIV_Suit_5",
    "U_NORTH_CIV_Suit_6",
    "U_NORTH_CIV_Suit_7",
    "U_NORTH_CIV_Suit_8",
    "U_NORTH_CIV_Suit_9",
    "U_NORTH_CIV_Suit_10",
    "U_NORTH_CIV_Suit_11",
    "U_NORTH_CIV_Suit_12",
    "U_NORTH_CIV_Jacket_1",
    "U_NORTH_CIV_Jacket_2",
    "U_NORTH_CIV_Jacket_3",
    "U_NORTH_CIV_Jacket_4",
    "U_NORTH_CIV_Jacket_5",
    "U_NORTH_CIV_Jacket_6",
    "U_NORTH_CIV_Jacket_7",
    "U_NORTH_CIV_Jacket_8",
    "U_NORTH_CIV_Jacket_9",
    "U_NORTH_CIV_Jacket_10",
    "U_NORTH_CIV_Jacket_11",
    "U_NORTH_CIV_Jacket_12"
];

KP_liberation_guerilla_uniforms_3 = [
    "U_NORTH_CIV_Wool_1",
    "U_NORTH_CIV_Wool_2",
    "U_NORTH_CIV_Wool_3",
    "U_NORTH_CIV_Wool_4",
    "U_NORTH_CIV_Wool_5",
    "U_NORTH_CIV_Wool_6",
    "U_NORTH_CIV_Wool_7",
    "U_NORTH_CIV_Suit_1",
    "U_NORTH_CIV_Suit_2",
    "U_NORTH_CIV_Suit_3",
    "U_NORTH_CIV_Suit_4",
    "U_NORTH_CIV_Suit_5",
    "U_NORTH_CIV_Suit_6",
    "U_NORTH_CIV_Suit_7",
    "U_NORTH_CIV_Suit_8",
    "U_NORTH_CIV_Suit_9",
    "U_NORTH_CIV_Suit_10",
    "U_NORTH_CIV_Suit_11",
    "U_NORTH_CIV_Suit_12",
    "U_NORTH_CIV_Jacket_1",
    "U_NORTH_CIV_Jacket_2",
    "U_NORTH_CIV_Jacket_3",
    "U_NORTH_CIV_Jacket_4",
    "U_NORTH_CIV_Jacket_5",
    "U_NORTH_CIV_Jacket_6",
    "U_NORTH_CIV_Jacket_7",
    "U_NORTH_CIV_Jacket_8",
    "U_NORTH_CIV_Jacket_9",
    "U_NORTH_CIV_Jacket_10",
    "U_NORTH_CIV_Jacket_11",
    "U_NORTH_CIV_Jacket_12"
];

// Vests
KP_liberation_guerilla_vests_1 = [

];

KP_liberation_guerilla_vests_2 = [

];

KP_liberation_guerilla_vests_3 = [

];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "H_NORTH_Fedora",
    "H_NORTH_Fedora_B1",
    "H_NORTH_Fedora_B2",
    "H_NORTH_Fedora_B",
    "H_NORTH_Fedora_Br",
    "H_NORTH_Fedora_W",
    "H_NORTH_Fedora_O",
    "H_NORTH_Homburg",
    "H_NORTH_Homburg_Bl",
    "H_NORTH_Homburg_Br",
    "H_NORTH_Homburg_B",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_G",
    "H_NORTH_Workercap_R",
    "H_NORTH_Flatcap",
    "H_NORTH_Flatcap_Be",
    "H_NORTH_Flatcap_Bl",
    "H_NORTH_Flatcap_B",
    "H_NORTH_Flatcap_G",
    "H_NORTH_Flatcap_Gr"
];

KP_liberation_guerilla_headgear_2 = [
    "H_NORTH_Fedora",
    "H_NORTH_Fedora_B1",
    "H_NORTH_Fedora_B2",
    "H_NORTH_Fedora_B",
    "H_NORTH_Fedora_Br",
    "H_NORTH_Fedora_W",
    "H_NORTH_Fedora_O",
    "H_NORTH_Homburg",
    "H_NORTH_Homburg_Bl",
    "H_NORTH_Homburg_Br",
    "H_NORTH_Homburg_B",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_G",
    "H_NORTH_Workercap_R",
    "H_NORTH_Flatcap",
    "H_NORTH_Flatcap_Be",
    "H_NORTH_Flatcap_Bl",
    "H_NORTH_Flatcap_B",
    "H_NORTH_Flatcap_G",
    "H_NORTH_Flatcap_Gr"
];

KP_liberation_guerilla_headgear_3 = [
    "H_NORTH_Fedora",
    "H_NORTH_Fedora_B1",
    "H_NORTH_Fedora_B2",
    "H_NORTH_Fedora_B",
    "H_NORTH_Fedora_Br",
    "H_NORTH_Fedora_W",
    "H_NORTH_Fedora_O",
    "H_NORTH_Homburg",
    "H_NORTH_Homburg_Bl",
    "H_NORTH_Homburg_Br",
    "H_NORTH_Homburg_B",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_G",
    "H_NORTH_Workercap_R",
    "H_NORTH_Flatcap",
    "H_NORTH_Flatcap_Be",
    "H_NORTH_Flatcap_Bl",
    "H_NORTH_Flatcap_B",
    "H_NORTH_Flatcap_G",
    "H_NORTH_Flatcap_Gr"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
	"G_NORTH_FIN_Glasses_2",
	"G_NORTH_FIN_Glasses",
	"G_NORTH_SOV_Glasses",
	"G_NORTH_FIN_Sunglasses",
	"G_NORTH_FIN_Sunglasses_2",
	"G_NORTH_FIN_Scarf",
    "G_NORTH_FIN_Scarf_2",
    "G_NORTH_FIN_Scarf_3",
    "G_NORTH_FIN_Scarf_4",
    "G_NORTH_FIN_Scarf_5",
    "G_NORTH_FIN_Scarf_Small",
    "G_NORTH_FIN_Scarf_Small_2",
    "G_NORTH_FIN_Scarf_Small_3",
    "G_NORTH_FIN_Scarf_Small_4"
];
