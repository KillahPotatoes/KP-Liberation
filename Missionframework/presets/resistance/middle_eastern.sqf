/*
Needed Mods:
- RHS USAF
- RHS AFRF
- Project OPFOR

Optional Mods:
- None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation 
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
	"LOP_AM_Infantry_SL",
	"LOP_AM_Infantry_Rifleman",
	"LOP_AM_Infantry_Rifleman_2",
	"LOP_AM_Infantry_Rifleman_3",
	"LOP_AM_Infantry_AT",
	"LOP_AM_Infantry_AR",
	"LOP_AM_Infantry_Corpsman",
	"LOP_AM_Infantry_Engineer"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
	"LOP_AM_UAZ_DshKM"
];

// transport vehicles (should be able to transport at least 10 soldiers)
KP_liberation_guerilla_transports = [
	"LOP_AM_Truck"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 =[
	["rhs_weap_ak74","rhs_30rnd_545x39_AK",4,"",""],
	["rhs_weap_aks74u","rhs_30rnd_545x39_AK",4,"",""],
	["LOP_Weap_LeeEnfield","LOP_10rnd_77mm_mag",3,"",""]
];

KP_liberation_guerilla_weapons_2 =[
	["rhs_weap_ak74","rhs_30rnd_545x39_AK",4,"",""],
	["rhs_weap_akm","rhs_30rnd_762x39mm",4,"",""],
	["rhs_weap_akms","rhs_30rnd_762x39mm",4,"",""],
	["rhs_weap_aks74u","rhs_30rnd_545x39_AK",4,"",""],
	["rhs_weap_pp2000","rhs_mag_9x19mm_7n21_20",5,"optic_ACO_grn_smg",""],
	["LOP_Weap_LeeEnfield_railed","LOP_10rnd_77mm_mag",3,"optic_ACO_grn",""]
];

KP_liberation_guerilla_weapons_3 =[
	["rhs_weap_ak103","rhs_30rnd_762x39mm",4,"",""],
	["rhs_weap_ak104","rhs_30rnd_762x39mm",4,"",""],
	["rhs_weap_ak105","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp1",""],
	["rhs_weap_pkm","rhs_100Rnd_762x54mmR",2,"",""],
	["rhs_weap_aks74un","rhs_30rnd_545x39_AK",4,"rhs_acc_ekp8_02",""],
	["LOP_Weap_LeeEnfield_railed","LOP_10rnd_77mm_mag",3,"optic_MRCO",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
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
	
KP_liberation_guerilla_uniforms_2 = [
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

KP_liberation_guerilla_uniforms_3 = [
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

// Vests
KP_liberation_guerilla_vests_1 = [
	""
];

KP_liberation_guerilla_vests_2 = [
	"",
	"V_LegStrapBag_black_F",
	"V_LegStrapBag_coyote_F",
	"V_LegStrapBag_olive_F",
	"LOP_6sh46"
];

KP_liberation_guerilla_vests_3 = [
	"",
	"V_LegStrapBag_black_F",
	"V_LegStrapBag_coyote_F",
	"V_LegStrapBag_olive_F",
	"LOP_6sh46",
	"LOP_V_CarrierLite_BLK",
	"LOP_V_CarrierLite_TAN",
	"LOP_V_CarrierLite_OLV"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
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

KP_liberation_guerilla_headgear_2 = [
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

KP_liberation_guerilla_headgear_3 = [
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

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
	""
];
