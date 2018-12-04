/*
Needed Mods:
- None

Optional Mods:
- None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation 
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn */
KP_liberation_guerilla_units = [
	"GELIB_POL_CitizenAK01SzM38",
	"GELIB_POL_WoodlanderAKStSz02RKMwz28",
	"LIB_POL_rifleman_bvbpKplK98",
	"LIB_WP_Medic",
	"LIB_POL_rifleman_nvfpbcSz2K98",
	"LIB_WP_AT_grenadier",
	"LIB_POL_rifleman_gvbpbcSz2SmLE",
	"GELIB_POL_CitizenAK01SzM38"
];

// Armed vehicles
KP_liberation_guerilla_vehicles = [
	"LIB_Kfz1_MG42",
	"LIB_pol_opelblitz_open_Tarn_Czata",
	"LIB_pol_opelblitz_tentB_Tarn_Czata",
	"LIB_SdKfz251_FFV",
	"LIB_SdKfz251",
	"LIB_FRA_CitC4"
];

// Transport vehicles (should be able to transport at least 10 soldiers)
KP_liberation_guerilla_transports = [
	"LIB_pol_opelblitz_open_Tarn_Czata",
	"LIB_pol_opelblitz_tentB_Tarn_Czata"
];

/* Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. */

/* Weapons - You've to add the weapons as array like
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"]
You can leave optic and tripod empty with "" */
KP_liberation_guerilla_weapons_1 =[
	["LIB_M9130","LIB_5Rnd_762x54",5,"",""],
	["LIB_K98","LIB_5Rnd_792x57",5,"",""]
];

KP_liberation_guerilla_weapons_2 =[
	["LIB_K98","LIB_5Rnd_792x57",5,"",""],
	["LIB_M9130","LIB_5Rnd_762x54",5,"",""],
	["LIB_G41","LIB_10Rnd_792x57_clip",5,"",""],
	["LIB_SVT_40","LIB_10Rnd_762x54",5,"",""]
];

KP_liberation_guerilla_weapons_3 =[
	["LIB_K98","LIB_5Rnd_792x57",5,"",""],
	["LIB_M9130","LIB_5Rnd_762x54",5,"",""],
	["LIB_G41","LIB_10Rnd_792x57_clip",5,"",""],
	["LIB_SVT_40","LIB_10Rnd_762x54",5,"",""],
	["LIB_MP38","LIB_32Rnd_9x19",5,"",""],
	["LIB_PPSh41_m","LIB_35Rnd_762x25",5,"",""],
	["fow_w_pzfaust_30_klein","fow_1Rnd_pzfaust_30_klein",1,"",""]
];

// Uniforms
KP_liberation_guerilla_uniforms_1 = [
	"U_GELIB_POL_CitizenAK03PckSten",
	"U_GELIB_POL_VillagerAK01SzM9130",
	"U_GELIB_POL_WoodlanderAK01SzM9130",
	"U_LIB_POL_rifleman_nvfpbcSz2K98"
	
];

KP_liberation_guerilla_uniforms_2 = [
	"U_LIB_POL_rifleman_vvgpbcStKpl2Sten",
	"U_LIB_POL_rifleman_bvvprcStSz2RKMwz28",
	"U_LIB_POL_rifleman_gvbpbcSz2SmLE",
	"U_LIB_POL_soldier_bcvmpbcSzt3Mp40"
];

KP_liberation_guerilla_uniforms_3 = [
	"U_LIB_POL_rifleman_bvbpKplK98",
	"U_LIB_POL_Soldier_camo_luftvnpgcbcStSzM9130",
	"U_LIB_POL_Soldier_camo_09vfpbcbcSzK98",
	"U_LIB_POL_Soldier_camo_15vbpbcgcSztMp40",
	"U_LIB_POL_Soldier_camo_00vmpbcbcSzm9130",
	"U_LIB_POL_Soldier_camo_21vnpbcgcStSzPpsch41m"
];

// Vests
KP_liberation_guerilla_vests_1 = [
	"V_LIB_SOV_RA_MosinBelt",
	"V_LIB_SOV_RA_SVTBelt",
	"V_LIB_SOV_RA_PPShBelt",
	"fow_v_fall_bandoleer",
	"fow_v_heer_k98",
	"fow_v_heer_k98_light",
	"fow_v_heer_mp40",
	"V_LIB_DAK_PioneerVest"
];

KP_liberation_guerilla_vests_2 = [
	"V_LIB_SOV_RA_MosinBelt",
	"V_LIB_SOV_RA_SVTBelt",
	"V_LIB_SOV_RA_PPShBelt",
	"fow_v_fall_bandoleer",
	"fow_v_heer_k98",
	"fow_v_heer_k98_light",
	"fow_v_heer_mp40",
	"V_LIB_DAK_PioneerVest"
];

KP_liberation_guerilla_vests_3 = [
	"V_LIB_SOV_RA_MosinBelt",
	"V_LIB_SOV_RA_SVTBelt",
	"V_LIB_SOV_RA_PPShBelt",
	"fow_v_fall_bandoleer",
	"fow_v_heer_k98",
	"fow_v_heer_k98_light",
	"fow_v_heer_mp40",
	"V_LIB_DAK_PioneerVest"
];

// Headgear
KP_liberation_guerilla_headgear_1 = [
	"",
	"",
	"",
	"",
	"H_LIB_CIV_Worker_Cap_2",
	"H_LIB_GER_Ushanka",
	"GEH_Chapeau_MarronClair",
	"GERDS_Beret1",
	"GEH_ShemagOpen_khk"
];

KP_liberation_guerilla_headgear_2 = [
	"H_LIB_POL_Calot_BeigeBR",
	"H_LIB_POL_Calot_BrunBR",
	"H_LIB_POL_Cap_BrA1BR",
	"H_LIB_POL_Cap_FgA1BR",
	"H_LIB_POL_Cap_WH41A1BR",
	"H_LIB_POL_Cap_WH00A2BR"
];

KP_liberation_guerilla_headgear_3 = [
	"H_LIB_POL_HelmetCamo_03",
	"H_LIB_POL_HelmetCamo_15",
	"H_LIB_POL_HelmetCamo_41",
	"H_LIB_POL_Helmet_BRWSS",
	"H_LIB_POL_RA_HelmetK3_A01",
	"H_LIB_POL_HelmetCamo_WSS",
	"H_LIB_POL_HelmetCamo_WHT"
];

// Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
	"",
	"",
	"",
	"murshun_cigs_cig1",
	"G_LIB_Scarf2_G",
	"G_LIB_Headwrap_gloves",
	"fow_g_glasses1",
	"fow_g_gloves3",
	"G_LIB_Scarf2_B"
];
