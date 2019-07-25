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
    ["uns_ak47","uns_ak47mag",4,"",""],
    ["uns_PPS52","uns_k50mag",4,"",""],
    ["uns_owen","uns_owenmag",4,"",""],
    ["uns_mas36","uns_mas36mag",4,"",""],
    ["uns_RPD","uns_rpdmag",1,"",""],
    ["uns_m1carbine","uns_m1carbinemag",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["uns_m2carbine","uns_m2carbinemag",4,"",""],
    ["uns_akm","uns_ak47mag",4,"",""],
    ["uns_DP28_base","uns_47Rnd_DP28",4,"",""],
    ["uns_type50","uns_k50mag",4,"",""],
    ["uns_m16","uns_20Rnd_556x45_Stanag",4,"",""],
    ["uns_mas36","uns_mas36mag",4,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["uns_akm_drum","uns_75Rnd_akdr",4,"",""],
    ["uns_sa58p","uns_sa58mag",4,"",""],
    ["uns_PK","uns_100Rnd_762x54_PK",1,"",""],
    ["uns_m1garand","uns_m1garandmag",4,"",""],
    ["uns_M63a_AR_base","uns_30Rnd_556x45_Stanag",4,"",""],
    ["uns_Sterling","uns_mk4mag",4,"",""],
    ["uns_m2carbine_gl","uns_m2carbinemag",4,"",""],
    ["uns_m3a1","uns_m3a1mag",4,"",""],
    ["uns_SVD_CAMO_base","uns_svdmag",4,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_I_C_Soldier_Bandit_5_F",
    "UNS_CIV_B",
    "UNS_CIV_U",
    "UNS_VC_B",
    "UNS_VC_K",
    "UNS_VC_S",
    "UNS_VC_U"
];

KP_liberation_guerilla_uniforms_2 = [
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_C_HunterBody_grn",
    "U_C_Mechanic_01_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Para_5_F"
];

KP_liberation_guerilla_uniforms_3 = [
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla1_2_F",
    "U_BG_leader",
    "U_I_C_Soldier_Camo_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_4_F",
    "UNS_DCCR_BBS",
    "UNS_DCCR_GTS"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "UNS_VC_B1",
    "UNS_VC_S2",
    "V_BandollierB_blk",
    "V_BandollierB_cbr",
    "V_BandollierB_ghex_F",
    "V_BandollierB_khk",
    "V_BandollierB_oli",
    "V_BandollierB_rgr",
    "V_LegStrapBag_black_F",
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "V_Pocketed_black_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_olive_F"
];

KP_liberation_guerilla_vests_2 = [
    "UNS_ANZAC_VEST_C",
    "UNS_ANZAC_VEST",
    "UNS_M1956_M14",
    "UNS_NVA_A1",
    "UNS_NVA_MG",
    "uns_vc_chestrig",
    "UNS_VC_SP",
    "V_Chestrig_blk",
    "V_Chestrig_khk",
    "V_Chestrig_oli",
    "V_Chestrig_rgr",
    "V_HarnessO_brn",
    "V_HarnessO_ghex_F",
    "V_HarnessO_gry",
    "V_HarnessOGL_brn",
    "V_HarnessOGL_ghex_F",
    "V_HarnessOGL_gry"
];

KP_liberation_guerilla_vests_3 = [
    "UNS_M1956_M1",
    "UNS_M1956_M2",
    "UNS_M1956_M3",
    "UNS_M1956_S3",
    "UNS_NVA_SP",
    "V_I_G_resistanceLeader_F",
    "V_TacChestrig_cbr_F",
    "V_TacChestrig_grn_F",
    "V_TacChestrig_oli_F",
    "V_TacVest_blk",
    "V_TacVest_brn",
    "V_TacVest_camo",
    "V_TacVest_khk",
    "V_TacVest_oli"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "",
    "",
    "",
    "",
    "H_StrawHat_dark",
    "UNS_Boonie3_VC",
    "UNS_Conehat_VC"
];

KP_liberation_guerilla_headgear_2 = [
    "H_Bandanna_khk",
    "UNS_Boonie_VC",
    "UNS_Headband_BK",
    "UNS_Headband_ED",
    "UNS_Headband_OD",
    "UNS_Headband_OD2",
    "UNS_Headband_VC",
    "uns_sas_bandana_erdl",
    "uns_sas_booniehat_vc_tan",
    "uns_sas_booniehat_vc",
    "uns_sas_headband_green",
    "uns_vc_headband_blue"
];

KP_liberation_guerilla_headgear_3 = [
    "UNS_Boonie_6",
    "UNS_Boonie_ERDL",
    "UNS_Boonie_ERDL3",
    "UNS_Boonie_OD",
    "UNS_Boonie_OD2",
    "UNS_Boonie_ODF",
    "UNS_Boonie_ODP",
    "UNS_Field_Cap",
    "UNS_M1_1",
    "UNS_M1_AFT",
    "UNS_PAVN_HG",
    "UNS_PAVN_HN",
    "uns_sas_booniehat_erdl2",
    "uns_sas_booniehat_green2"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
    "",
    "",
    "",
    "G_Bandanna_blk",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_shades",
    "G_Bandanna_tan",
    "UNS_Peace",
    "UNS_Scarf_1stCav",
    "UNS_Scarf_ARVN",
    "UNS_Scarf_BK_W",
    "UNS_Scarf_BK",
    "UNS_Scarf_Blue",
    "UNS_Scarf_GR",
    "UNS_Scarf_OD",
    "UNS_Scarf_PL",
    "UNS_Scarf_Red"
];
