/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "CUP_I_GUE_Soldier_AR",
    "CUP_I_GUE_Engineer",
    "CUP_I_GUE_Commander",
    "CUP_I_GUE_Medic",
    "CUP_I_GUE_Soldier_AKS74",
    "CUP_I_GUE_Soldier_LAT",
    "CUP_I_GUE_Sniper",
    "CUP_I_GUE_Officer"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "CUP_I_Datsun_PK_Random",
    "CUP_I_Datsun_PK_Random",
    "CUP_I_Datsun_PK_Random",
    "CUP_I_BMP2_NAPA",
    "CUP_I_BRDM2_NAPA",
    "CUP_I_BRDM2_NAPA",
    "CUP_I_MTLB_pk_NAPA",
    "CUP_I_MTLB_pk_NAPA",
    "CUP_I_T34_NAPA",
    "CUP_I_T34_NAPA",
    "CUP_I_T55_NAPA",
    "CUP_I_T72_NAPA"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 = [
    ["CUP_srifle_CZ550","CUP_5x_22_LR_17_HMR_M",10,"",""],
    ["CUP_srifle_CZ550_rail","CUP_5x_22_LR_17_HMR_M",10,"optic_mrco",""],
    ["CUP_srifle_LeeEnfield","CUP_10x_303_M",10,"",""],
    ["CUP_srifle_LeeEnfield_rail","CUP_10x_303_M",10,"cup_optic_sb_11_4x20_pm","cup_bipod_harris_1a2_I"],
    ["CUP_glaunch_M79","CUP_1Rnd_HEDP_M203",16,"",""],
    ["CUP_arifle_AK47_Early","CUP_30Rnd_762x39_AK47_M",4,"",""]
];

KP_liberation_guerilla_weapons_2 = [
    ["CUP_arifle_AK47_Early","CUP_30Rnd_762x39_AK47_M",4,"",""],
    ["CUP_arifle_AK47_Early","CUP_30Rnd_762x39_AK47_M",4,"",""],
    ["CUP_arifle_AKM","CUP_30Rnd_762x39_AK47_M",4,"cup_optic_pso_1_ak_open",""],
    ["CUP_arifle_AK47_GL_Early","CUP_30Rnd_762x39_AK47_M",4,"",""],
    ["CUP_arifle_RPK74","CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",3,"optic_ACO_grn","bipod_01_F_blk"],
    ["CUP_smg_SA61","CUP_50Rnd_B_765x17_Ball_M",5,"",""]
];

KP_liberation_guerilla_weapons_3 = [
    ["CUP_arifle_AK47_Early","CUP_30Rnd_762x39_AK47_M",4,"",""],
    ["CUP_arifle_AK74M","CUP_30Rnd_545x39_AK74M_M",4,"cup_optic_kobra",""],
    ["CUP_arifle_AK74M_GL","CUP_30Rnd_545x39_AK74M_M",4,"cup_optic_kobra",""],
    ["CUP_arifle_RPK74M_railed","CUP_60Rnd_545x39_AK74M_M",3,"cup_optic_zddot",""],
    ["CUP_arifle_AK47_Early","CUP_30Rnd_762x39_AK47_M",4,"",""],
    ["CUP_lmg_Pecheneg","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",2,"optic_MRCO",""],
    ["CUP_srifle_SVD","CUP_10Rnd_762x54_SVD_M",12,"cup_optic_pso_3_open",""],
    ["CUP_srifle_SVD_wdl","CUP_10Rnd_762x54_SVD_M",12,"cup_optic_pso_3_open",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
    "CUP_U_I_Villager_03",
    "CUP_U_I_Woodlander03",
    "CUP_U_I_Woodlander_02",
    "CUP_U_I_Worker_02",
    "CUP_U_I_Villager_04",
    "CUP_U_I_Woodlander_01",
    "CUP_U_C_Woodlander_04",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_01"

];

KP_liberation_guerilla_uniforms_2 = [
    "CUP_I_B_PMC_Unit_20",
    "CUP_I_B_PMC_Unit_19",
    "CUP_I_B_PMC_Unit_11",
    "CUP_I_B_PMC_Unit_10",
    "CUP_I_B_PMC_Unit_9",
    "CUP_I_B_PMC_Unit_12",
    "CUP_I_B_PMC_Unit_16",
    "CUP_I_B_PMC_Unit_22"
];

KP_liberation_guerilla_uniforms_3 = [
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn3",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_Gillie_Top",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Camo_F"
];

// Vests
KP_liberation_guerilla_vests_1 = [
    "CUP_V_I_Guerilla_Jacket",
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
    "V_TacVestIR_blk",
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
    "V_TacVest_oli",
    "CUP_V_RUS_Smersh_2",
    "CUP_V_I_Carrier_Belt",
    "CUP_V_B_PASGT_OD",
    "CUP_V_B_GER_Carrier_Rig",
    "CUP_V_B_GER_Carrier_Vest_2",
    "V_TacChestrig_oli_F"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
    "",
    "",
    "",
    "",
    "CUP_H_C_Ushanka_02",
    "CUP_H_C_Ushanka_03",
    "CUP_H_C_Ushanka_04",
    "CUP_H_C_Ushanka_01",
    "CUP_H_C_Beret_03",
    "CUP_H_C_Beret_02",
    "CUP_H_C_Beret_01",
    "CUP_H_C_Beret_04",
    "CUP_H_C_Beanie_01",
    "CUP_H_C_Beanie_02",
    "CUP_H_C_Beanie_03",
    "CUP_H_C_Beanie_04"
];

KP_liberation_guerilla_headgear_2 = [
    "H_Bandanna_blu",
    "H_Bandanna_sand",
    "H_Bandanna_gry",
    "H_Bandanna_camo",
    "H_Bandanna_cbr",
    "H_Bandanna_sgg",
    "H_Bandanna_khk",
    "CUP_H_C_Ushanka_02",
    "CUP_H_C_Ushanka_03",
    "CUP_H_C_Ushanka_04",
    "CUP_H_C_Ushanka_01",
    "H_PASGT_basic_black_F",
    "H_PASGT_basic_olive_F",
    "H_Cap_blk_Raven",
    "H_MilCap_dgtl"
];

KP_liberation_guerilla_headgear_3 = [
    "H_Shemag_olive",
    "H_Shemag_olive_hs",
    "H_Shemag_olive",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "CUP_H_Ger_Boonie_Flecktarn",
    "H_PASGT_basic_olive_F",
    "CUP_H_GER_LWH_Flecktarn"
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
