/*
    KP Liberation RECS resistance preset

    File: racs.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-15
    Last Update: 2018-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    RACS preset file for resistance units.
    The resistance faction is friendly or hostile, depending on the civil reputation.

    Needed Mods:
    - Project OPFOR

    Optional Mods:
    - None
*/

// Side for this preset
KPLIB_preset_sideResistance = resistance;
// Color for this side
KPLIB_preset_colorResistance = "ColorGUER";

/*------------------------------------------------------------
    --- RESISTANCE UNIT AND VEHICLE CLASSNAMES ---
    Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn.
------------------------------------------------------------*/

// Resistance units
KPLIB_preset_rUnits = [
    "LOP_RACS_Infantry_MG",
    "LOP_RACS_Infantry_Engineer",
    "LOP_RACS_Infantry_TL",
    "LOP_RACS_Infantry_Corpsman",
    "LOP_RACS_Infantry_Rifleman",
    "LOP_RACS_Infantry_AT",
    "LOP_RACS_Infantry_Marksman",
    "LOP_RACS_Infantry_SL"
];

// Armed resistance vehicles
KPLIB_preset_rVehicles = [
    "LOP_RACS_Landrover_M2",
    "LOP_RACS_Offroad_M2"
];

// Resistance transport vehicles (should be able to transport at least 10 soldiers)
KPLIB_preset_rTransports = [
    "LOP_RACS_Truck"
];

/*------------------------------------------------------------
    --- RESISTANCE EQUIPMENT ---
    There are 3 tiers for every category. If the strength of the resistance will increase, they'll have higher tier equipment.

    Important for weapons:
    You've to add the weapons as array like
    ["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
    You can leave optic and tripod empty with ""
------------------------------------------------------------*/

// Resistance weapons tier 1
KPLIB_preset_rWeapons1 =[
    ["rhs_weap_Izh","rhsgref_1Rnd_00Buck",20,"",""],
    ["rhs_weap_m38","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_m38_rail","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_kar98k","rhsgref_5rnd_792x57_kar98k",6,"",""],
    ["rhs_weap_mosin_sbr","rhsgref_5rnd_762x54_m38",6,"",""],
    ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S",5,"",""]
];

// Resistance weapons tier 2
KPLIB_preset_rWeapons2 =[
    ["rhs_weap_ak74","rhs_30rnd_545x39_AK",3,"",""],
    ["rhs_weap_akm","rhs_30rnd_762x39mm",3,"",""],
    ["rhs_weap_akms","rhs_30rnd_762x39mm",3,"",""],
    ["rhs_weap_aks74u","rhs_30rnd_545x39_AK",3,"",""],
    ["rhs_weap_pp2000","rhs_mag_9x19mm_7n21_20",4,"",""],
    ["rhs_weap_svds","rhs_10rnd_762x54mmR_7N1",3,"rhs_acc_pso1m2",""]
];

// Resistance weapons tier 3
KPLIB_preset_rWeapons3 =[
    ["rhs_weap_ak103","rhs_30rnd_762x39mm",4,"rhs_acc_pkas",""],
    ["rhs_weap_ak104","rhs_30rnd_762x39mm",4,"rhs_acc_ekp8_02",""],
    ["rhs_weap_ak105","rhs_30rnd_545x39_AK",4,"rhs_acc_pkas",""],
    ["rhs_weap_asval_grip","rhs_20rnd_9x39mm_SP5",5,"rhs_acc_pkas",""],
    ["rhs_weap_pkm","rhs_100Rnd_762x54mmR",2,"",""],
    ["rhs_weap_pkp","rhs_100Rnd_762x54mmR",2,"rhs_acc_pkas",""],
    ["rhs_weap_svdp","rhs_10rnd_762x54mmR_7N1",5,"rhs_acc_pso1m21",""],
    ["rhs_weap_aks74un","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp8_02",""]
];

// Resistance uniforms tier 1
KPLIB_preset_rUniforms1 = [
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
];

// Resistance uniforms tier 2
KPLIB_preset_rUniforms2 = [
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
];

// Resistance uniforms tier 3
KPLIB_preset_rUniforms3 = [
    "LOP_U_RACS_Fatigue_01",
    "LOP_U_RACS_Fatigue_01_slv"
];

// Resistance vests tier 1
KPLIB_preset_rVests1 = [
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

// Resistance vests tier 2
KPLIB_preset_rVests2 = [
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

// Resistance vests tier 3
KPLIB_preset_rVests3 = [
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

// Resistance headgear tier 1
KPLIB_preset_rHeadgear1 = [
    "",
    "",
    "",
    "",
    "LOP_H_6B27M_RACS",
    "LOP_H_6B27M_ess_RACS"
];

// Resistance headgear tier 2
KPLIB_preset_rHeadgear2 = [
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

// Resistance headgear tier 3
KPLIB_preset_rHeadgear3 = [
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

// Resistance facegear. Applies for tier 2 and 3.
KPLIB_preset_rFacegear = [
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
