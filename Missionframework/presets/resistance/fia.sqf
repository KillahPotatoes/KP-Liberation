#include "../script_component.hpp"
/*
    KP Liberation FIA Resistance Preset

    File: fia.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        FIA resistance preset file which contains only vanilla assets.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/


/*------------------------------------------------------------
    --- RESISTANCE UNIT AND VEHICLE CLASSNAMES ---
    Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn.
------------------------------------------------------------*/

// Infantry units (KPLIB_preset_unitsPlR)
KPLIB_PRST_CAT_BEGIN("unitsPlR");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_Soldier_AR_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_engineer_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_officer_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_medic_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_Soldier_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_Soldier_LAT_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_Soldier_M_F");
KPLIB_PRST_CAT_ADD("unitsPlR", "I_G_Soldier_SL_F");

// Armed vehicles (KPLIB_preset_vehLightArmedPlR)
KPLIB_PRST_CAT_BEGIN("vehLightArmedPlR");
KPLIB_PRST_CAT_ADD("vehLightArmedPlR", "I_G_Offroad_01_armed_F");
KPLIB_PRST_CAT_ADD("vehLightArmedPlR", "I_G_Offroad_01_AT_F");

// Transport vehicles (KPLIB_preset_vehTransPlR)
KPLIB_PRST_CAT_BEGIN("vehTransPlR");
KPLIB_PRST_CAT_ADD("vehTransPlR", "I_G_Van_01_transport_F");
KPLIB_PRST_CAT_ADD("vehTransPlR", "I_G_Van_02_transport_F");


/*------------------------------------------------------------
    --- RESISTANCE EQUIPMENT ---
    There are 3 tiers for every category. If the strength of the resistance will increase, they'll have higher tier equipment.

    Important for weapons:
    You've to add the weapons as array like
    ["Weaponclassname", "Magazineclassname", "magazine amount", "optic", "tripod"]
    You can leave optic and tripod empty with ""

    NOTE: This system may change during the development of the resistance module
------------------------------------------------------------*/

// Weapons tier 1 (KPLIB_preset_weaponsR1)
KPLIB_PRST_CAT_BEGIN("weaponsR1");
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["arifle_AKM_F",                  "30Rnd_762x39_Mag_F",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["arifle_AKM_F",                  "30Rnd_762x39_Mag_F",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["arifle_AKS_F",                  "30Rnd_545x39_Mag_F",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["hgun_PDW2000_F",                    "30Rnd_9x21_Mag",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["SMG_01_F",                  "30Rnd_45ACP_Mag_SMG_01",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["SMG_02_F",                   "30Rnd_9x21_Mag_SMG_02",  4,                "",                  ""];
(KPLIB_PRST_GETVAR("weaponsR1")) pushBack ["SMG_05_F",                   "30Rnd_9x21_Mag_SMG_02",  4,                "",                  ""];

// Weapons tier 2 (KPLIB_preset_weaponsR2)
KPLIB_PRST_CAT_BEGIN("weaponsR2");
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["arifle_Katiba_F",       "30Rnd_65x39_caseless_green",  4,   "optic_ACO_grn",                  ""];
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["arifle_Mk20_plain_F",          "30Rnd_556x45_Stanag",  4,   "optic_ACO_grn",                  ""];
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["arifle_TRG21_F",               "30Rnd_556x45_Stanag",  4,   "optic_ACO_grn",                  ""];
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["arifle_CTAR_blk_F",             "30Rnd_580x42_Mag_F",  4,   "optic_ACO_grn",                  ""];
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["arifle_MX_SW_F",         "100Rnd_65x39_caseless_mag",  3,   "optic_ACO_grn",    "bipod_01_F_blk"];
(KPLIB_PRST_GETVAR("weaponsR2")) pushBack ["srifle_DMR_06_olive_F",           "20Rnd_762x51_Mag",  5,      "optic_Hamr",    "bipod_01_F_blk"];

// Weapons tier 3 (KPLIB_preset_weaponsR3)
KPLIB_PRST_CAT_BEGIN("weaponsR3");
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["arifle_CTAR_blk_F",             "30Rnd_580x42_Mag_F",  4,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["arifle_SPAR_01_blk_F",         "30Rnd_556x45_Stanag",  4,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["arifle_SPAR_03_blk_F",            "20Rnd_762x51_Mag",  5,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["arifle_ARX_blk_F",      "30Rnd_65x39_caseless_green",  4,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["srifle_DMR_03_F",                 "20Rnd_762x51_Mag",  5,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["srifle_EBR_F",                    "20Rnd_762x51_Mag",  5,      "optic_MRCO",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["srifle_DMR_07_blk_F",     "20Rnd_650x39_Cased_Mag_F",  5,       "optic_DMS",                  ""];
(KPLIB_PRST_GETVAR("weaponsR3")) pushBack ["LMG_Mk200_F",               "200Rnd_65x39_cased_Box",  2,      "optic_MRCO",    "bipod_01_F_blk"];

// Uniforms tier 1 (KPLIB_preset_uniformsPlR1)
KPLIB_PRST_CAT_BEGIN("uniformsPlR1");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_blue");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_burgundy");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_salmon");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_redwhite");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_stripped");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poloshirt_tricolour");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Poor_1");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_1_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_2_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_3_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_4_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_5_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_C_Man_casual_6_F");
KPLIB_PRST_CAT_ADD("uniformsPlR1", "U_Marshal");

// Uniforms tier 2 (KPLIB_preset_uniformsPlR2)
KPLIB_PRST_CAT_BEGIN("uniformsPlR2");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Bandit_1_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Bandit_2_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Bandit_3_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Bandit_4_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Bandit_5_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_BG_Guerilla2_1");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_BG_Guerilla2_2");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_BG_Guerilla2_3");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_BG_Guerilla3_1");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_C_HunterBody_grn");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_C_Mechanic_01_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_C_Soldier_Para_5_F");
KPLIB_PRST_CAT_ADD("uniformsPlR2", "U_I_G_resistanceLeader_F");

// Uniforms tier 3 (KPLIB_preset_uniformsPlR3)
KPLIB_PRST_CAT_BEGIN("uniformsPlR3");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_BG_Guerilla1_1");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_BG_Guerilla1_2_F");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_BG_Guerrilla_6_1");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_BG_leader");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_I_C_Soldier_Para_1_F");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_I_C_Soldier_Para_2_F");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_I_C_Soldier_Para_3_F");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_I_C_Soldier_Para_4_F");
KPLIB_PRST_CAT_ADD("uniformsPlR3", "U_I_C_Soldier_Camo_F");

// Vests tier 1 (KPLIB_preset_vestsPlR1)
KPLIB_PRST_CAT_BEGIN("vestsPlR1");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_LegStrapBag_coyote_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_LegStrapBag_olive_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_LegStrapBag_black_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_Pocketed_coyote_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_Pocketed_olive_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_Pocketed_black_F");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_cbr");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_rgr");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_khk");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_oli");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_blk");
KPLIB_PRST_CAT_ADD("vestsPlR1", "V_BandollierB_ghex_F");

// Vests tier 2 (KPLIB_preset_vestsPlR2)
KPLIB_PRST_CAT_BEGIN("vestsPlR2");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_Chestrig_rgr");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_Chestrig_khk");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_Chestrig_oli");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_Chestrig_blk");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessO_brn");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessO_gry");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessO_ghex_F");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessOGL_brn");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessOGL_gry");
KPLIB_PRST_CAT_ADD("vestsPlR2", "V_HarnessOGL_ghex_F");

// Vests tier 3 (KPLIB_preset_vestsPlR3)
KPLIB_PRST_CAT_BEGIN("vestsPlR3");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacVest_brn");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacVest_khk");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacVest_oli");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacVest_blk");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_I_G_resistanceLeader_F");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacVest_camo");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacChestrig_grn_F");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacChestrig_cbr_F");
KPLIB_PRST_CAT_ADD("vestsPlR3", "V_TacChestrig_oli_F");

// Headgear tier 1 (KPLIB_preset_headgearPlR1)
KPLIB_PRST_CAT_BEGIN("headgearPlR1");
KPLIB_PRST_CAT_ADD("headgearPlR1", "");
KPLIB_PRST_CAT_ADD("headgearPlR1", "");
KPLIB_PRST_CAT_ADD("headgearPlR1", "");
KPLIB_PRST_CAT_ADD("headgearPlR1", "");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_brown");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_grey");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_tan");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_checker");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_camo");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Bandanna_surfer");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Bandanna_surfer_grn");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Bandanna_surfer_blk");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_Safari_olive_F");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Hat_Safari_sand_F");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Construction_basic_black_F");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Helmet_Skate");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_blu");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_grn");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_tan");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_oli");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_red");
KPLIB_PRST_CAT_ADD("headgearPlR1", "H_Cap_blk");

// Headgear tier 2 (KPLIB_preset_headgearPlR2)
KPLIB_PRST_CAT_BEGIN("headgearPlR2");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_blu");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_sand");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_gry");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_camo");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_cbr");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_sgg");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Bandanna_khk");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_blu");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_grn");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_tan");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_oli");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_red");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_blk");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_Cap_blk_Raven");
KPLIB_PRST_CAT_ADD("headgearPlR2", "H_MilCap_dgtl");

// Headgear tier 3 (KPLIB_preset_headgearPlR3)
KPLIB_PRST_CAT_BEGIN("headgearPlR3");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_ShemagOpen_khk");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_ShemagOpen_tan");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Shemag_olive");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Booniehat_khk");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Booniehat_oli");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Booniehat_tan");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Booniehat_dgtl");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_Booniehat_tna_F");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_PASGT_basic_olive_F");
KPLIB_PRST_CAT_ADD("headgearPlR3", "H_PASGT_basic_white_F");

// Facegear. Applies for tier 2 and 3. (KPLIB_preset_facegearPlR)
KPLIB_PRST_CAT_BEGIN("facegearPlR");
KPLIB_PRST_CAT_ADD("facegearPlR", "");
KPLIB_PRST_CAT_ADD("facegearPlR", "");
KPLIB_PRST_CAT_ADD("facegearPlR", "");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_shades");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_beast");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_tan");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_khk");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_oli");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_aviator");
KPLIB_PRST_CAT_ADD("facegearPlR", "G_Bandanna_blk");


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checkedR"), true];
