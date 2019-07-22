/*
    Needed Mods:
    - Project OPFOR

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
    "LOP_RACS_Infantry_MG",
    "LOP_RACS_Infantry_Engineer",
    "LOP_RACS_Infantry_TL",
    "LOP_RACS_Infantry_Corpsman",
    "LOP_RACS_Infantry_Rifleman",
    "LOP_RACS_Infantry_AT",
    "LOP_RACS_Infantry_Marksman",
    "LOP_RACS_Infantry_SL"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "LOP_RACS_Landrover_M2",
    "LOP_RACS_Offroad_M2"
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
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
];

KP_liberation_guerilla_uniforms_2 = [
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
];

KP_liberation_guerilla_uniforms_3 = [
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
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
    "LOP_H_6B27M_RACS",
    "LOP_H_6B27M_ess_RACS"

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
    "rhsgref_fieldcap_ttsko_urban",
    "",
    "",
    "",
    "",
    "LOP_H_6B27M_RACS",
    "LOP_H_6B27M_ess_RACS"
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
    "H_Watchcap_khk",
    "",
    "",
    "",
    "",
    "LOP_H_6B27M_RACS",
    "LOP_H_6B27M_ess_RACS"
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
