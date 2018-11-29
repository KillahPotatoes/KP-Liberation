/*
    KP Liberation custom whitelist preset

    File: whitelist.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-27
    Last Update: 2018-11-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Whitelist file for the virtual arsenal.
    With this file you can create a custom whitelist for weapons etc.

    Needed Mods:
    - None
*/

KPLIB_preset_arsenal_whitelist = [
// Weapons which should be available in the arsenal.
    "UK3CB_BAF_Javelin_Launcher",
    "rhs_weap_M136_used",
// Magazines which should be available in the arsenal.
    "rhs_m136_mag",
    "rhs_m136_hedp_mag",
    "rhs_m136_hp_mag",
    "rhs_m72a7_mag",
    "UK3CB_BAF_AT4_CS_AP_Mag",
// Items, Uniforms, Headgear, etc. which should be available in the arsenal.
    "BWA3_optic_ZO4x30_NSV",
    "BWA3_optic_ZO4x30_IRV",
    "BWA3_optic_ZO4x30_Single_NSV",
    "BWA3_optic_ZO4x30_Single_IRV",
    "BWA3_optic_EOTech_Mag_On",
    "BWA3_optic_EOTech_Mag_Off",
    "BWA3_optic_EOTech_tan_Mag_On",
    "BWA3_optic_EOTech_tan_Mag_Off",
    "BWA3_optic_20x50_NSV",
    "BWA3_optic_24x72_NSV",
    "BWA3_acc_VarioRay_flash",
    "BWA3_acc_VarioRay_laser",
    "BWA3_acc_LLM01_flash",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_LLM01_flash_underbarrel",
    "BWA3_acc_LLM01_laser_underberrel",
    "BWA3_acc_LLM01_laser_underbarrel",
    "rhs_acc_ekp8_18b",
    "rhs_acc_ekp8_18c",
    "rhs_acc_ekp8_18d",
    "rhsusf_acc_g33_T1_flip",
    "rhsusf_acc_g33_xps3_flip",
    "rhsusf_acc_g33_xps3_tan_flip",
    "rhsusf_acc_anpeq15_bk_light_h",
    "ItemRadioAcreFlagged",
    "ACE_Chemlight_Shield_Orange",
    "ACE_Chemlight_Shield_White",
    "ACE_Chemlight_Shield_Blue",
    "ACE_Chemlight_Shield_Yellow",
    "ACE_Chemlight_Shield_Green",
    "ACE_Chemlight_Shield_Red",
// Backpacks which should be available in the arsenal.
    "sma_spitfire_03_rds_low_ard_red",
    "ACE_ReserveParachute"
];

/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// If this is not set player will be informed about errors
KPLIB_validationNamespace setVariable ["arsenal", true];
