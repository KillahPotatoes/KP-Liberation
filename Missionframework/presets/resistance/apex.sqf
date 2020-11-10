/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "I_C_Soldier_Bandit_1_F",
    "I_C_Soldier_Bandit_2_F",
    "I_C_Soldier_Bandit_3_F",
    "I_C_Soldier_Bandit_4_F",
    "I_C_Soldier_Bandit_5_F",
    "I_C_Soldier_Bandit_6_F",
    "I_C_Soldier_Bandit_7_F",
    "I_C_Soldier_Bandit_8_F"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "I_C_Offroad_02_LMG_F",
    "I_C_Offroad_02_AT_F"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["arifle_AKM_F","30Rnd_762x39_Mag_F",4,"",""],
    ["arifle_AKS_F","30Rnd_545x39_Mag_F",4,"",""],
    ["hgun_PDW2000_F","30Rnd_9x21_Mag",4,"",""],
    ["SMG_01_F","30Rnd_45ACP_Mag_SMG_01",4,"",""],
    ["SMG_02_F","30Rnd_9x21_Mag_SMG_02",4,"",""],
    ["SMG_05_F","30Rnd_9x21_Mag_SMG_02",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["arifle_Katiba_F","30Rnd_65x39_caseless_green",4,"optic_ACO_grn",""],
    ["arifle_Mk20_plain_F","30Rnd_556x45_Stanag",4,"optic_ACO_grn",""],
    ["arifle_TRG21_F","30Rnd_556x45_Stanag",4,"optic_ACO_grn",""],
    ["arifle_CTAR_blk_F","30Rnd_580x42_Mag_F",4,"optic_ACO_grn",""],
    ["arifle_MX_SW_F","100Rnd_65x39_caseless_mag",3,"optic_ACO_grn","bipod_01_F_blk"],
    ["srifle_DMR_06_olive_F","20Rnd_762x51_Mag",5,"optic_Hamr","bipod_01_F_blk"]
];

KP_liberation_guerilla_weapons_3 = [
    ["arifle_CTAR_blk_F","30Rnd_580x42_Mag_F",4,"optic_MRCO",""],
    ["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag",4,"optic_MRCO",""],
    ["arifle_SPAR_03_blk_F","20Rnd_762x51_Mag",5,"optic_MRCO",""],
    ["arifle_ARX_blk_F","30Rnd_65x39_caseless_green",4,"optic_MRCO",""],
    ["srifle_DMR_03_F","20Rnd_762x51_Mag",5,"optic_MRCO",""],
    ["srifle_EBR_F","20Rnd_762x51_Mag",5,"optic_MRCO",""],
    ["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F",5,"optic_DMS",""],
    ["LMG_Mk200_F","200Rnd_65x39_cased_Box",2,"optic_MRCO","bipod_01_F_blk"]
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
