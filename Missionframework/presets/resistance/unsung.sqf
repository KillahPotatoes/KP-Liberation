/*
    Needed Mods:
    - The Unsung Vietnam War Mod

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "uns_men_ARVNci_HMG",
    "uns_men_ARVNci_S2",
    "uns_men_ARVNci_SL",
    "uns_men_CIDG_COM",
    "uns_men_CIDG_ENG",
    "uns_men_CIDG_MED",
    "uns_men_CIDG_MRK2",
    "uns_men_CIDG_S1"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["uns_ak47","uns_ak47mag_T",4,"",""],
    ["uns_PPS52","uns_ppshmag_T",4,"",""],
    ["uns_owen","uns_owenmag_T",4,"",""],
    ["uns_mas36","uns_mas36mag_T",4,"",""],
    ["uns_RPD","uns_rpdmag",4,"",""],
    ["uns_m1carbine_pouch_bayo","uns_m1carbinemag_T",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["uns_m2carbine_bayo","uns_m2carbinemag",4,"",""],
    ["uns_akm_bayo","uns_ak47mag_T",4,"",""],
    ["uns_DP28","uns_47Rnd_DP28",4,"",""],
    ["uns_type50","uns_k50mag_T",4,"",""],
    ["uns_M16_bayo","uns_20Rnd_556x45_Stanag_T",4,"",""],
    ["uns_mas36_gl","uns_mas36mag_T","Uns_1Rnd_22mm_FRAG",4,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["uns_akm_drum","uns_75Rnd_akdr",4,"",""],
    ["uns_sa58p","uns_sa58mag_T",4,"",""],
    ["uns_PK","uns_ppkmag",4,"",""],
    ["uns_m1garand_gl","uns_m1garandmag_T",4,"",""],
    ["uns_M63a_AR_base","uns_40Rnd_556x45_Stanag_T",4,"",""],
    ["uns_Sterling","uns_mk4mag_T",4,"",""],
    ["uns_m2carbine_gl","uns_m2carbinemag_T",4,"",""],
    ["uns_m3a1","uns_m3a1mag_T",4,"",""],
    ["uns_SVD_CAMO_base","uns_svdmag_T",4,"uns_o_PSO1_camo",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poor_1",
    "U_C_Man_casual_1_F",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_Marshal"
];

KP_liberation_guerilla_uniforms_2 = [
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
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
    "V_BandollierB_ghex_F"
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
    "V_HarnessOGL_ghex_F"
];

KP_liberation_guerilla_vests_3 = [
    "V_TacVest_brn",
    "V_TacVest_khk",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_I_G_resistanceLeader_F",
    "V_TacVest_camo",
    "V_TacChestrig_grn_F",
    "V_TacChestrig_cbr_F",
    "V_TacChestrig_oli_F"
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
    "H_Hat_camo",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_grn",
    "H_Bandanna_surfer_blk",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F",
    "H_Construction_basic_black_F",
    "H_Helmet_Skate",
    "H_Cap_blu",
    "H_Cap_grn",
    "H_Cap_tan",
    "H_Cap_oli",
    "H_Cap_red",
    "H_Cap_blk"
];

KP_liberation_guerilla_headgear_2 = [
    "H_Bandanna_blu",
    "H_Bandanna_sand",
    "H_Bandanna_gry",
    "H_Bandanna_camo",
    "H_Bandanna_cbr",
    "H_Bandanna_sgg",
    "H_Bandanna_khk",
    "H_Cap_blu",
    "H_Cap_grn",
    "H_Cap_tan",
    "H_Cap_oli",
    "H_Cap_red",
    "H_Cap_blk",
    "H_Cap_blk_Raven",
    "H_MilCap_dgtl"
];

KP_liberation_guerilla_headgear_3 = [
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "H_Booniehat_tan",
    "H_Booniehat_dgtl",
    "H_Booniehat_tna_F",
    "H_PASGT_basic_olive_F",
    "H_PASGT_basic_white_F"
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
