/*
    KP Liberation Middle Eastern resistance preset

    File: apex.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-15
    Last Update: 2018-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Middle Eastern preset file for resistance units.
    The resistance faction is friendly or hostile, depending on the civil reputation.

    Needed Mods:
    - RHSUSAF
    - RHSAFRF
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
    "LOP_AM_Infantry_SL",
    "LOP_AM_Infantry_Rifleman",
    "LOP_AM_Infantry_Rifleman_2",
    "LOP_AM_Infantry_Rifleman_3",
    "LOP_AM_Infantry_AT",
    "LOP_AM_Infantry_AR",
    "LOP_AM_Infantry_Corpsman",
    "LOP_AM_Infantry_Engineer"
];

// Armed resistance vehicles
KPLIB_preset_rVehicles = [
    "LOP_AM_UAZ_DshKM"
];

// Resistance transport vehicles (should be able to transport at least 10 soldiers)
KPLIB_preset_rTransports = [
    "LOP_AM_Truck"
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
    ["rhs_weap_ak74","rhs_30rnd_545x39_AK",4,"",""],
    ["rhs_weap_aks74u","rhs_30rnd_545x39_AK",4,"",""],
    ["LOP_Weap_LeeEnfield","LOP_10rnd_77mm_mag",3,"",""]
];

// Resistance weapons tier 2
KPLIB_preset_rWeapons2 =[
    ["rhs_weap_ak74","rhs_30rnd_545x39_AK",4,"",""],
    ["rhs_weap_akm","rhs_30rnd_762x39mm",4,"",""],
    ["rhs_weap_akms","rhs_30rnd_762x39mm",4,"",""],
    ["rhs_weap_aks74u","rhs_30rnd_545x39_AK",4,"",""],
    ["rhs_weap_pp2000","rhs_mag_9x19mm_7n21_20",5,"optic_ACO_grn_smg",""],
    ["LOP_Weap_LeeEnfield_railed","LOP_10rnd_77mm_mag",3,"optic_ACO_grn",""]
];

// Resistance weapons tier 3
KPLIB_preset_rWeapons3 =[
    ["rhs_weap_ak103","rhs_30rnd_762x39mm",4,"",""],
    ["rhs_weap_ak104","rhs_30rnd_762x39mm",4,"",""],
    ["rhs_weap_ak105","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp1",""],
    ["rhs_weap_pkm","rhs_100Rnd_762x54mmR",2,"",""],
    ["rhs_weap_aks74un","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp8_02",""],
    ["LOP_Weap_LeeEnfield_railed","LOP_10rnd_77mm_mag",3,"optic_MRCO",""]
];

// Resistance uniforms tier 1
KPLIB_preset_rUniforms1 = [
    "LOP_U_TAK_Civ_Fatigue_01",
    "LOP_U_TAK_Civ_Fatigue_02",
    "LOP_U_TAK_Civ_Fatigue_04",
    "LOP_U_TAK_Civ_Fatigue_05",
    "LOP_U_TAK_Civ_Fatigue_06",
    "LOP_U_TAK_Civ_Fatigue_07",
    "LOP_U_TAK_Civ_Fatigue_08",
    "LOP_U_TAK_Civ_Fatigue_09",
    "LOP_U_TAK_Civ_Fatigue_10",
    "LOP_U_TAK_Civ_Fatigue_11",
    "LOP_U_TAK_Civ_Fatigue_12",
    "LOP_U_TAK_Civ_Fatigue_13",
    "LOP_U_TAK_Civ_Fatigue_14",
    "LOP_U_TAK_Civ_Fatigue_15",
    "LOP_U_TAK_Civ_Fatigue_16"
];

// Resistance uniforms tier 2
KPLIB_preset_rUniforms2 = [
    "LOP_U_TAK_Civ_Fatigue_01",
    "LOP_U_TAK_Civ_Fatigue_02",
    "LOP_U_TAK_Civ_Fatigue_04",
    "LOP_U_TAK_Civ_Fatigue_05",
    "LOP_U_TAK_Civ_Fatigue_06",
    "LOP_U_TAK_Civ_Fatigue_07",
    "LOP_U_TAK_Civ_Fatigue_08",
    "LOP_U_TAK_Civ_Fatigue_09",
    "LOP_U_TAK_Civ_Fatigue_10",
    "LOP_U_TAK_Civ_Fatigue_11",
    "LOP_U_TAK_Civ_Fatigue_12",
    "LOP_U_TAK_Civ_Fatigue_13",
    "LOP_U_TAK_Civ_Fatigue_14",
    "LOP_U_TAK_Civ_Fatigue_15",
    "LOP_U_TAK_Civ_Fatigue_16"
];

// Resistance uniforms tier 3
KPLIB_preset_rUniforms3 = [
    "LOP_U_TAK_Civ_Fatigue_01",
    "LOP_U_TAK_Civ_Fatigue_02",
    "LOP_U_TAK_Civ_Fatigue_04",
    "LOP_U_TAK_Civ_Fatigue_05",
    "LOP_U_TAK_Civ_Fatigue_06",
    "LOP_U_TAK_Civ_Fatigue_07",
    "LOP_U_TAK_Civ_Fatigue_08",
    "LOP_U_TAK_Civ_Fatigue_09",
    "LOP_U_TAK_Civ_Fatigue_10",
    "LOP_U_TAK_Civ_Fatigue_11",
    "LOP_U_TAK_Civ_Fatigue_12",
    "LOP_U_TAK_Civ_Fatigue_13",
    "LOP_U_TAK_Civ_Fatigue_14",
    "LOP_U_TAK_Civ_Fatigue_15",
    "LOP_U_TAK_Civ_Fatigue_16"
];

// Resistance vests tier 1
KPLIB_preset_rVests1 = [
    ""
];

// Resistance vests tier 2
KPLIB_preset_rVests2 = [
    "",
    "V_LegStrapBag_black_F",
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "LOP_6sh46"
];

// Resistance vests tier 3
KPLIB_preset_rVests3 = [
    "",
    "V_LegStrapBag_black_F",
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_olive_F",
    "LOP_6sh46",
    "LOP_V_CarrierLite_BLK",
    "LOP_V_CarrierLite_TAN",
    "LOP_V_CarrierLite_OLV"
];

// Resistance headgear tier 1
KPLIB_preset_rHeadgear1 = [
    "",
    "",
    "H_HeadBandage_clean_F",
    "H_HeadBandage_stained_F",
    "H_Bandanna_gry",
    "H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "H_Bandanna_camo"
];

// Resistance headgear tier 2
KPLIB_preset_rHeadgear2 = [
    "",
    "H_HeadBandage_clean_F",
    "H_HeadBandage_stained_F",
    "H_Bandanna_gry",
    "H_Bandanna_cbr",
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "H_Bandanna_camo",
    "LOP_H_Turban",
    "LOP_H_Turban_mask"
];

// Resistance headgear tier 3
KPLIB_preset_rHeadgear3 = [
    "LOP_H_Turban",
    "LOP_H_Turban_mask",
    "H_Shemag_olive",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk",
    "LOP_H_Shemag_BLK",
    "LOP_H_Shemag_BLU",
    "LOP_H_Shemag_GRE",
    "LOP_H_Shemag_OLV",
    "LOP_H_Shemag_RED1",
    "LOP_H_Shemag_TAN",
    "LOP_H_6B27M_wz93"
];

// Resistance facegear. Applies for tier 2 and 3.
KPLIB_preset_rFacegear = [
    ""
];
