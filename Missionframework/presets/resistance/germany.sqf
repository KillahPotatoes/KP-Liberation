/*
    File: custom.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-09
    Last Update: 2020-05-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        German resistance preset.

    Needed Mods:
        - Global Mobilization

    Optional Mods:
        - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KPLIB_r_units = [
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
KPLIB_r_vehicles = [];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KPLIB_r_weapons_1 = [
    ["gm_mp2a1_blk","gm_32Rnd_9x19mm_B_DM51_mp2_blk",4,"",""],
    ["gm_mp2a1_blk","gm_32Rnd_9x19mm_B_DM51_mp2_blk",4,"",""],
    ["gm_mpiaks74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""]
];

KPLIB_r_weapons_2 = [
    ["gm_mpiaks74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""]
];

KPLIB_r_weapons_3 = [
    ["gm_mpiak74n_prp","gm_30Rnd_545x39mm_B_7N6_ak74_prp",4,"",""],
    ["gm_g3a3_blk","gm_20Rnd_762x51mm_B_T_DM21_g3_blk",4,"",""],
    ["gm_g3a3_blk","gm_20Rnd_762x51mm_B_T_DM21_g3_blk",4,"",""],
    ["gm_lmgrpk_brn","gm_75Rnd_762x39mm_B_M43_ak47_blk",4,"",""],
    ["gm_lmgrpk_brn","gm_75Rnd_762x39mm_B_M43_ak47_blk",4,"",""]
];

// Uniforms
KPLIB_r_uniforms_1 = [
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_01_80_blk",
    "U_C_Mechanic_01_F"
];

KPLIB_r_uniforms_2 = [
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_01_80_blk",
    "U_C_Mechanic_01_F",
    "U_C_WorkerCoveralls",
    "U_C_WorkerCoveralls"
];

KPLIB_r_uniforms_3 = [
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
KPLIB_r_vests_1 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_olive_F",
    "V_Pocketed_black_F",
    "V_BandollierB_blk"
];

KPLIB_r_vests_2 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_Pocketed_olive_F",
    "V_Pocketed_black_F",
    "V_BandollierB_blk",
    "gm_ge_bgs_vest_80_rifleman"
];

KPLIB_r_vests_3 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_BandollierB_blk",
    "gm_ge_bgs_vest_80_rifleman"
];

// Headgear
KPLIB_r_headgear_1 = [
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

KPLIB_r_headgear_2 = [
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

KPLIB_r_headgear_3 = [
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
KPLIB_r_facegear = [
    "",
    "",
    "",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_blk"
];
