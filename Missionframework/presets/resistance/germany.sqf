/*
    Needed Mods:
    - Global Mobilization

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "I_G_Soldier_AR_F",
    "I_G_engineer_F",
    "I_G_officer_F",
    "I_G_medic_F",
    "I_G_Soldier_F",
    "I_G_Soldier_LAT_F",
    "I_G_Soldier_M_F",
    "I_G_Soldier_SL_F"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["gm_mp2a1_blk","gm_32Rnd_9x19mm_B_DM51_mp2_blk",4,"",""],
    ["gm_mp2a1_blk","gm_32Rnd_9x19mm_B_DM51_mp2_blk",4,"",""],
    ["gm_mpiaks74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["gm_mpiaks74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_g3a3_blk","gm_20Rnd_762x51mm_B_T_DM21_g3_blk",4,"",""],
    ["gm_g3a3_blk","gm_20Rnd_762x51mm_B_T_DM21_g3_blk",4,"",""],
    ["gm_lmgrpk_brn","gm_75Rnd_762x39mm_B_M43_ak47_blk",4,"",""],
    ["gm_lmgrpk_brn","gm_75Rnd_762x39mm_B_M43_ak47_blk",4,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_01_80_blk",
    "U_C_Mechanic_01_F"
];

KP_liberation_guerilla_uniforms_2 = [
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_01_80_blk",
    "U_C_Mechanic_01_F",
    "U_C_WorkerCoveralls",
    "U_C_WorkerCoveralls"
];

KP_liberation_guerilla_uniforms_3 = [
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_01_80_blk",
    "U_C_Mechanic_01_F",
    "U_C_WorkerCoveralls",
    "U_C_WorkerCoveralls",
    "U_BG_Guerilla3_1",
    "U_BG_Guerilla3_1",
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerrilla_6_1",
    "U_B_GEN_Commander_F",
    "U_B_GEN_Commander_F"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_olive_F",
    "V_Pocketed_black_F",
    "V_BandollierB_blk"
];

KP_liberation_guerilla_vests_2 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_Pocketed_olive_F",
    "V_Pocketed_black_F",
    "V_BandollierB_blk",
    "gm_ge_bgs_vest_80_rifleman"
];

KP_liberation_guerilla_vests_3 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_BandollierB_blk",
    "gm_ge_bgs_vest_80_rifleman"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "",
    "",
    "",
    "",
    "H_Hat_brown",
    "H_Hat_grey",
    "H_Hat_tan",
    "H_Hat_checker",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F"
];

KP_liberation_guerilla_headgear_2 = [
    "",
    "",
    "",
    "",
    "H_Hat_brown",
    "H_Hat_grey",
    "H_Hat_tan",
    "H_Hat_checker",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F",
    "H_Bandanna_blu",
    "H_Bandanna_sand",
    "H_Bandanna_gry",
    "H_Bandanna_cbr",
    "H_Bandanna_sgg",
    "H_Bandanna_khk"
];

KP_liberation_guerilla_headgear_3 = [
    "",
    "",
    "",
    "",
    "H_Hat_brown",
    "H_Hat_grey",
    "H_Hat_tan",
    "H_Hat_checker",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F",
    "H_Bandanna_blu",
    "H_Bandanna_sand",
    "H_Bandanna_gry",
    "H_Bandanna_cbr",
    "H_Bandanna_sgg",
    "H_Bandanna_khk",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
    "",
    "",
    "",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_blk"
];
