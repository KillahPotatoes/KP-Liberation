/*
    Needed Mods:
    - RHS: AFRF
    - RHS: GREF

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
KP_liberation_guerilla_vehicles = [
    "rhsgref_ins_g_uaz_dshkm_chdkz"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["rhs_weap_Izh","rhsgref_1Rnd_00Buck",20,"",""],
    ["rhs_weap_m38","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_m38_rail","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_kar98k","rhsgref_5rnd_792x57_kar98k",6,"",""],
    ["rhs_weap_mosin_sbr","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S",5,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["rhs_weap_ak74","rhs_30rnd_545x39_AK",3,"",""],
    ["rhs_weap_akm","rhs_30rnd_762x39mm",3,"",""],
    ["rhs_weap_akms","rhs_30rnd_762x39mm",3,"",""],
    ["rhs_weap_aks74u","rhs_30rnd_545x39_AK",3,"",""],
    ["rhs_weap_pp2000","rhs_mag_9x19mm_7n21_20",4,"",""],
    ["rhs_weap_svds","rhs_10rnd_762x54mmR_7N1",3,"rhs_acc_pso1m2",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["rhs_weap_ak103","rhs_30rnd_762x39mm",4,"rhs_acc_pkas",""],
    ["rhs_weap_ak104","rhs_30rnd_762x39mm",4,"rhs_acc_ekp8_02",""],
    ["rhs_weap_ak105","rhs_30rnd_545x39_AK",4,"rhs_acc_pkas",""],
    ["rhs_weap_asval_grip","rhs_20rnd_9x39mm_SP5",5,"rhs_acc_pkas",""],
    ["rhs_weap_pkm","rhs_100Rnd_762x54mmR",2,"",""],
    ["rhs_weap_pkp","rhs_100Rnd_762x54mmR",2,"rhs_acc_pkas",""],
    ["rhs_weap_svdp","rhs_10rnd_762x54mmR_7N1",5,"rhs_acc_pso1m21",""],
    ["rhs_weap_aks74un","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp8_02",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_C_Poor_1",
    "U_C_Man_casual_1_F",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3"
];

KP_liberation_guerilla_uniforms_2 = [
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerilla1_1",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_4_F",
    "U_BG_Guerilla3_1",
    "U_C_HunterBody_grn",
    "U_C_Mechanic_01_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_G_resistanceLeader_F"
];

KP_liberation_guerilla_uniforms_3 = [
    "rhsgref_uniform_reed",
    "rhsgref_uniform_woodland_olive",
    "rhsgref_uniform_flecktarn",
    "rhsgref_uniform_altis_lizard_olive",
    "rhsgref_uniform_dpm_olive"
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
    "rhs_vest_commander",
    "rhs_vest_pistol_holder",
    "V_Rangemaster_belt",
    "rhs_6sh46"
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
    "V_HarnessOGL_ghex_F",
    "rhsgref_alice_webbing",
    "V_TacChestrig_grn_F",
    "V_TacChestrig_cbr_F",
    "V_TacChestrig_oli_F"
];

KP_liberation_guerilla_vests_3 = [
    "V_TacVest_brn",
    "V_TacVest_khk",
    "V_TacVest_oli",
    "V_TacVest_blk",
    "V_I_G_resistanceLeader_F",
    "V_TacVest_camo",
    "rhs_vydra_3m",
    "rhsgref_6b23_khaki_medic",
    "rhsgref_6b23_khaki_nco",
    "rhsgref_6b23_khaki_officer",
    "rhsgref_6b23_khaki_rifleman",
    "rhsgref_6b23_khaki_sniper",
    "rhsgref_6b23_khaki"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "",
    "",
    "",
    "",
    "",
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
    "rhsgref_fieldcap_ttsko_digi",
    "rhsgref_fieldcap_ttsko_forest",
    "rhsgref_fieldcap_ttsko_mountain",
    "rhsgref_fieldcap_ttsko_urban"
];

KP_liberation_guerilla_headgear_3 = [
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "rhsgref_M56",
    "H_Watchcap_blk",
    "rhs_ssh68",
    "rhsgref_ssh68_emr",
    "rhs_tsh4",
    "H_Beret_blk",
    "H_Watchcap_camo",
    "H_Watchcap_khk"
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
    "G_Bandanna_blk",
    "rhs_balaclava",
    "rhs_balaclava1_olive",
    "rhs_scarf"
];
