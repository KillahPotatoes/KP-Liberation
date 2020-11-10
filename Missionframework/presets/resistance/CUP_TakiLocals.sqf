/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - Project Infinite AIO
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "CUP_I_TK_GUE_Soldier_MG",
    "CUP_I_TK_GUE_Mechanic",
    "CUP_I_TK_GUE_Commander",
    "CUP_I_TK_GUE_Guerilla_Medic",
    "CUP_I_TK_GUE_Soldier",
    "CUP_I_TK_GUE_Soldier_AT",
    "CUP_I_TK_GUE_Sniper",
    "CUP_I_TK_GUE_Soldier_TL"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "CUP_I_Datsun_PK_TK",
    "CUP_I_Hilux_AGS30_TK",
    "CUP_I_Hilux_DSHKM_TK",
    "CUP_I_Hilux_M2_TK",
    "CUP_I_Hilux_SPG9_TK",
    "CUP_I_Hilux_armored_BMP1_TK",
    "CUP_I_Hilux_armored_BTR60_TK",
    "CUP_I_Hilux_armored_zu23_TK",
    "CUP_I_BTR40_MG_TKG",
    "CUP_I_BTR40_MG_TKG",
    "CUP_I_BMP1_TK_GUE",
    "CUP_I_BRDM2_TK_GUE",
    "CUP_I_T34_TK_GUE",
    "CUP_I_T55_TK_GUE",
    "CUP_I_Datsun_PK_TK_Random"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["bnae_mk1_virtual","10Rnd_303_Magazine",8,"",""],
    ["bnae_mk1_t_virtual","10Rnd_303_Magazine",8,"bnae_scope_v3_virtual",""],
    ["bnae_m97_virtual","6Rnd_Slug_Magazine",10,"",""],
    ["bnae_spr220_virtual","2Rnd_Slug_Magazine",20,"",""],
    ["bnae_spr220_so_virtual","2Rnd_Slug_Magazine",20,"",""],
    ["CUP_srifle_LeeEnfield","CUP_10x_303_M",8,"",""],
    ["CUP_srifle_LeeEnfield_rail","CUP_10x_303_M",8,"cup_optic_leupoldmk4",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["bnae_mk1_t_virtual","10Rnd_303_Magazine",8,"bnae_scope_v3_virtual",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"cup_optic_kobra",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"cup_optic_pso_1",""],
    ["CUP_arifle_Sa58V_camo","CUP_30Rnd_Sa58_M_TracerG",6,"",""],
    ["CUP_arifle_RPK74","CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",3,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["CUP_arifle_FNFAL","CUP_20Rnd_762x51_FNFAL_M",5,"",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"cup_optic_kobra",""],
    ["CUP_arifle_AK47","CUP_30Rnd_762x39_AK47_M",6,"cup_optic_pso_1",""],
    ["CUP_srifle_SVD","CUP_10Rnd_762x54_SVD_M",10,"cup_optic_pso_3",""],
    ["CUP_lmg_PKM","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,"",""],
    ["CUP_arifle_FNFAL_railed","CUP_20Rnd_762x51_FNFAL_M",5,"cup_optic_leupold_vx3",""],
    ["CUP_arifle_FNFAL","CUP_20Rnd_762x51_FNFAL_M",5,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "CUP_O_TKI_Khet_Jeans_04",
    "CUP_O_TKI_Khet_Jeans_03",
    "CUP_O_TKI_Khet_Jeans_02",
    "CUP_O_TKI_Khet_Jeans_01",
    "CUP_O_TKI_Khet_Jeans_01",
    "CUP_O_TKI_Khet_Partug_02",
    "CUP_O_TKI_Khet_Partug_03",
    "CUP_O_TKI_Khet_Partug_04",
    "CUP_O_TKI_Khet_Partug_05",
    "CUP_O_TKI_Khet_Partug_06",
    "CUP_O_TKI_Khet_Partug_07",
    "CUP_O_TKI_Khet_Partug_08",
    "CUP_O_TKI_Khet_Partug_08",
    "U_BG_Guerilla3_1"

];

KP_liberation_guerilla_uniforms_2 = [
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_1",
    "U_BG_Guerrilla_6_1",
    "CUP_U_C_Citizen_03",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_C_HunterBody_grn",
    "U_C_Mechanic_01_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_G_resistanceLeader_F"
];

KP_liberation_guerilla_uniforms_3 = [
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla1_2_F",
    "U_BG_Guerrilla_6_1",
    "U_BG_leader",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Camo_F"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_LegStrapBag_black_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_olive_F",
    "V_Pocketed_black_F",
    "V_BandollierB_cbr",
    "V_BandollierB_rgr",
    "V_BandollierB_khk",
    "V_BandollierB_oli",
    "V_BandollierB_blk",
    "V_BandollierB_ghex_F",
    "CUP_V_RUS_Smersh_1",
    "CUP_V_RUS_Smersh_2",
    "CUP_V_O_TK_CrewBelt",
    "CUP_V_OI_TKI_Jacket1_04",
    "CUP_V_OI_TKI_Jacket1_06",
    "CUP_V_OI_TKI_Jacket1_01",
    "CUP_V_OI_TKI_Jacket1_05",
    "CUP_V_OI_TKI_Jacket1_02",
    "CUP_V_OI_TKI_Jacket1_03",
    "CUP_V_OI_TKI_Jacket4_04",
    "CUP_V_OI_TKI_Jacket4_05",
    "CUP_V_OI_TKI_Jacket4_02",
    "CUP_V_OI_TKI_Jacket4_06",
    "CUP_V_OI_TKI_Jacket4_03",
    "CUP_V_OI_TKI_Jacket4_01",
    "CUP_V_OI_TKI_Jacket5_04"
];

KP_liberation_guerilla_vests_2 = [
    "V_Chestrig_rgr",
    "V_Chestrig_khk",
    "V_Chestrig_oli",
    "V_Chestrig_blk",
    "V_HarnessO_brn",
    "V_HarnessO_gry",
    "V_HarnessO_ghex_F",
    "V_HarnessOGL_brn",
    "V_HarnessOGL_gry",
    "CUP_V_CDF_6B3_4_Green",
    "CUP_V_CDF_6B3_4_DST",
    "V_HarnessOGL_ghex_F"
];

KP_liberation_guerilla_vests_3 = [
    "V_TacVest_brn",
    "V_TacVest_khk",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_I_G_resistanceLeader_F",
    "V_TacVest_camo",
    "CUP_V_O_Ins_Carrier_Rig_Com",
    "CUP_V_O_Ins_Carrier_Rig_Light",
    "CUP_V_O_Ins_Carrier_Rig_MG",
    "CUP_V_CDF_6B3_4_Green",
    "CUP_V_CDF_6B3_4_DST",
    "V_TacChestrig_grn_F",
    "V_TacChestrig_cbr_F",
    "V_TacChestrig_oli_F"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TK_Lungee",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
    "CUP_H_TKI_Lungee_01",
    "CUP_H_TKI_Lungee_02",
    "CUP_H_TKI_Lungee_03",
    "CUP_H_TKI_Lungee_04",
    "CUP_H_TKI_Lungee_05",
    "CUP_H_TKI_Lungee_06",
    "CUP_H_TKI_Pakol_1_01",
    "CUP_H_TKI_Pakol_2_04",
    "CUP_H_TKI_Pakol_2_05",
    "CUP_H_TKI_Pakol_2_06",
    "CUP_H_TKI_Pakol_1_02",
    "CUP_H_TKI_Pakol_1_03",
    "CUP_H_TKI_Pakol_1_04",
    "CUP_H_TKI_Pakol_1_05",
    "CUP_H_TKI_Pakol_1_06",
    "CUP_H_TKI_Pakol_2_01",
    "CUP_H_TKI_Pakol_2_02",
    "CUP_H_TKI_Pakol_2_03",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06"
];

KP_liberation_guerilla_headgear_2 = [
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TK_Lungee",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
    "CUP_H_TKI_Lungee_01",
    "CUP_H_TKI_Lungee_02",
    "CUP_H_TKI_Lungee_03",
    "CUP_H_TKI_Lungee_04",
    "CUP_H_TKI_Lungee_05",
    "CUP_H_TKI_Lungee_06",
    "CUP_H_TKI_Pakol_1_01",
    "CUP_H_TKI_Pakol_2_04",
    "CUP_H_TKI_Pakol_2_05",
    "CUP_H_TKI_Pakol_2_06",
    "CUP_H_TKI_Pakol_1_02",
    "CUP_H_TKI_Pakol_1_03",
    "CUP_H_TKI_Pakol_1_04",
    "CUP_H_TKI_Pakol_1_05",
    "CUP_H_TKI_Pakol_1_06",
    "CUP_H_TKI_Pakol_2_01",
    "CUP_H_TKI_Pakol_2_02",
    "CUP_H_TKI_Pakol_2_03",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06"
];

KP_liberation_guerilla_headgear_3 = [
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TK_Lungee",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
    "CUP_H_TKI_Lungee_01",
    "CUP_H_TKI_Lungee_02",
    "CUP_H_TKI_Lungee_03",
    "CUP_H_TKI_Lungee_04",
    "CUP_H_TKI_Lungee_05",
    "CUP_H_TKI_Lungee_06",
    "CUP_H_TKI_Pakol_1_01",
    "CUP_H_TKI_Pakol_2_04",
    "CUP_H_TKI_Pakol_2_05",
    "CUP_H_TKI_Pakol_2_06",
    "CUP_H_TKI_Pakol_1_02",
    "CUP_H_TKI_Pakol_1_03",
    "CUP_H_TKI_Pakol_1_04",
    "CUP_H_TKI_Pakol_1_05",
    "CUP_H_TKI_Pakol_1_06",
    "CUP_H_TKI_Pakol_2_01",
    "CUP_H_TKI_Pakol_2_02",
    "CUP_H_TKI_Pakol_2_03",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
    "",
    "",
    "",
    "G_Bandanna_shades",
    "G_Bandanna_beast",
    "G_Bandanna_tan",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_aviator",
    "G_Bandanna_blk"
];
