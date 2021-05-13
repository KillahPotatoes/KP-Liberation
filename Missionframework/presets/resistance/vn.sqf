/*
    Needed Mods:
    - S.O.G. Prairie Fire CDLC

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "vn_i_men_army_01",
    "vn_i_men_army_03",
    "vn_i_men_army_04",
    "vn_i_men_army_08",
    "vn_i_men_army_15",
    "vn_i_men_army_19",
    "vn_i_men_army_21",
    "vn_i_men_army_22"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "vn_i_wheeled_m151_mg_01_mp"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["vn_m1carbine","vn_carbine_15_t_mag",8,"",""],
    ["vn_m1897","vn_m1897_buck_mag",20,"",""],
    ["vn_m1895","vn_m1895_mag",4,"",""],
    ["vn_m45","vn_m45_t_mag",4,"",""],
    ["vn_m3a1","vn_m3a1_t_mag",4,"",""],
    ["vn_mc10","vn_mc10_t_mag",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["vn_m2carbine","vn_carbine_30_t_mag",4,"vn_o_3x_m84",""],
    ["vn_m2carbine","vn_carbine_30_t_mag",4,"",""],
    ["vn_m16","vn_m16_20_t_mag",6,"",""],
    ["vn_m16","vn_m16_20_t_mag",6,"",""],
    ["vn_m16","vn_m16_20_t_mag",6,"",""],
    ["vn_m14","vn_m14_t_mag",6,"",""],
    ["vn_m3a1","vn_m3a1_t_mag",4,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["vn_m16","vn_m16_30_t_mag",6,"vn_o_4x_m16",""],
    ["vn_m16","vn_m16_30_t_mag",6,"vn_o_4x_m16",""],
    ["vn_m14","vn_m14_t_mag",6,"",""],
    ["vn_m14","vn_m14_t_mag",6,"vn_o_9x_m14",""],
    ["vn_m60","vn_m60_100_mag",2,"",""],
    ["vn_m79","vn_40mm_m381_he_mag",15,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_05_04",
    "vn_o_uniform_vc_05_03",
    "vn_o_uniform_vc_05_02"
];

KP_liberation_guerilla_uniforms_2 = [
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_01_07",
    "vn_o_uniform_vc_01_03",
    "vn_o_uniform_vc_reg_12_08",
    "vn_o_uniform_vc_01_06",
    "vn_o_uniform_vc_reg_12_09"
];

KP_liberation_guerilla_uniforms_3 = [
    "vn_o_uniform_vc_mf_04_07",
    "vn_o_uniform_vc_mf_03_07",
    "vn_o_uniform_vc_mf_02_07"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "vn_o_vest_04",
    "vn_o_vest_05"
];

KP_liberation_guerilla_vests_2 = [
    "vn_o_vest_04",
    "vn_o_vest_05",
    "vn_o_vest_vc_01",
    "vn_o_vest_vc_03"
];

KP_liberation_guerilla_vests_3 = [
    "vn_o_vest_vc_01",
    "vn_o_vest_vc_05",
    "vn_o_vest_vc_04",
    "vn_o_vest_vc_03",
    "vn_o_vest_vc_02"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "vn_c_conehat_02",
    "vn_c_conehat_01",
    "vn_c_headband_01",
    "vn_c_headband_02",
    "vn_c_headband_03",
    "vn_b_headband_03",
    "vn_b_bandana_03",
    "vn_b_bandana_01"
];

KP_liberation_guerilla_headgear_2 = [
    "vn_b_boonie_03_03",
    "vn_b_boonie_04_03",
    "vn_b_boonie_04_01",
    "vn_b_boonie_05_01",
    "vn_o_boonie_vc_01_01",
    "vn_o_boonie_vc_01_02"
];

KP_liberation_guerilla_headgear_3 = [
    "vn_b_helmet_m1_01_01",
    "vn_b_helmet_m1_02_02",
    "vn_o_helmet_vc_01",
    "vn_o_helmet_vc_03",
    "vn_b_helmet_sog_01"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
    "",
    "",
    "",
    "vn_b_scarf_01_01",
    "vn_b_scarf_01_03",
    "vn_b_aviator"
];
