/*
    KP LIBERATION CONFIG FILE

    File: KPLIB_config.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Contains all settings which are meant to be adjustable by players but aren't implemented in the mission settings.
*/

/*------------------------------------------------------------
    --- BLACKLIST SETTINGS ---
    Array for the general blacklist and for items which are blocked and shouldn't be blocked (mostly generated classnames).
    Useless if you're using anything other than the "Blacklist Method" arsenal preset.
    A whitelisted arsenal is always more performance friendly than a blacklisted arsenal.
    REMEMBER: All static turret and UAV bags should be defined here, to stop players from exploiting free resources via the virtual arsenal.
------------------------------------------------------------*/

// Items which should be added as allowed Items. For items which get blacklisted, even if they are not in the KPLIB_arsenal_generalBlacklist array.
KPLIB_arsenal_addToWhitelist = [
    "ItemRadioAcreFlagged",
    "rhs_acc_ekp8_18b",
    "rhs_acc_ekp8_18c",
    "rhs_acc_ekp8_18d",
    "rhsusf_acc_g33_T1_flip",
    "rhsusf_acc_g33_xps3_flip",
    "rhsusf_acc_g33_xps3_tan_flip",
    "rhsusf_acc_anpeq15_bk_light_h",
    "rhs_m136_mag",
    "rhs_m136_hedp_mag",
    "rhs_m136_hp_mag",
    "rhs_weap_M136_used",
    "rhs_m72a7_mag",
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
    "UK3CB_BAF_AT4_CS_AP_Mag",
    "UK3CB_BAF_Javelin_Launcher",
    "sma_spitfire_03_rds_low_ard_red",
    "ACE_Chemlight_Shield_Orange",
    "ACE_Chemlight_Shield_White",
    "ACE_Chemlight_Shield_Blue",
    "ACE_Chemlight_Shield_Yellow",
    "ACE_Chemlight_Shield_Green",
    "ACE_Chemlight_Shield_Red",
    "ACE_ReserveParachute"
];
// Array of blacklisted item classnames.
KPLIB_arsenal_generalBlacklist = [
    "I_HMG_01_weapon_F",
    "B_HMG_01_weapon_F",
    "O_HMG_01_weapon_F",
    "I_HMG_01_A_weapon_F",
    "B_HMG_01_A_weapon_F",
    "O_HMG_01_A_weapon_F",
    "I_HMG_01_high_weapon_F",
    "B_HMG_01_high_weapon_F",
    "O_HMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "B_GMG_01_weapon_F",
    "O_GMG_01_weapon_F",
    "I_GMG_01_A_weapon_F",
    "B_GMG_01_A_weapon_F",
    "O_GMG_01_A_weapon_F",
    "I_GMG_01_high_weapon_F",
    "B_GMG_01_high_weapon_F",
    "O_GMG_01_high_weapon_F",
    "I_Mortar_01_support_F",
    "B_Mortar_01_support_F",
    "O_Mortar_01_support_F",
    "I_Mortar_01_weapon_F",
    "B_Mortar_01_weapon_F",
    "O_Mortar_01_weapon_F",
    "I_HMG_01_support_F",
    "B_HMG_01_support_F",
    "O_HMG_01_support_F",
    "I_HMG_01_support_high_F",
    "B_HMG_01_support_high_F",
    "O_HMG_01_support_high_F",
    "I_AA_01_weapon_F",
    "B_AA_01_weapon_F",
    "O_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "B_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "I_UAV_01_backpack_F",
    "B_UAV_01_backpack_F",
    "O_UAV_01_backpack_F",
    "I_UAV_06_backpack_F",
    "B_UAV_06_backpack_F",
    "O_UAV_06_backpack_F",
    "I_UAV_06_medical_backpack_F",
    "B_UAV_06_medical_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "C_UAV_06_backpack_F",
    "C_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_01_backpack_F",
    "C_IDAP_UAV_06_backpack_F",
    "C_IDAP_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_06_antimine_backpack_F",
    "B_Respawn_Sleeping_bag_blue_F",
    "B_Respawn_Sleeping_bag_brown_F",
    "B_Respawn_TentDome_F",
    "B_Respawn_Sleeping_bag_F",
    "B_Respawn_TentA_F",
    "RHS_M2_Gun_Bag",
    "RHS_M2_Tripod_Bag",
    "rhs_M252_Gun_Bag",
    "rhs_M252_Bipod_Bag",
    "RHS_M2_MiniTripod_Bag",
    "RHS_Mk19_Gun_Bag",
    "RHS_Mk19_Tripod_Bag",
    "rhs_Tow_Gun_Bag",
    "rhs_TOW_Tripod_Bag",
    "RHS_Podnos_Bipod_Bag",
    "RHS_Podnos_Gun_Bag",
    "RHS_Metis_Gun_Bag",
    "RHS_Metis_Tripod_Bag",
    "RHS_Kornet_Gun_Bag",
    "RHS_Kornet_Tripod_Bag",
    "RHS_AGS30_Tripod_Bag",
    "RHS_AGS30_Gun_Bag",
    "RHS_DShkM_Gun_Bag",
    "RHS_DShkM_TripodHigh_Bag",
    "RHS_DShkM_TripodLow_Bag",
    "RHS_Kord_Tripod_Bag",
    "RHS_Kord_Gun_Bag",
    "RHS_NSV_Tripod_Bag",
    "RHS_NSV_Gun_Bag",
    "RHS_SPG9_Gun_Bag",
    "RHS_SPG9_Tripod_Bag",
    "UK3CB_BAF_L16",
    "UK3CB_BAF_L16_Tripod",
    "UK3CB_BAF_M6",
    "UK3CB_BAF_L111A1",
    "UK3CB_BAF_L134A1",
    "UK3CB_BAF_Tripod",
    "optic_Nightstalker",
    "optic_tws",
    "optic_tws_mg"
];

/*------------------------------------------------------------
    --- SAVE SETTINGS ---
    Settings concerning the internal save system.
------------------------------------------------------------*/

// Name of the save key inside of the [ServerProfileName].vars.Arma3Profile file.
KPLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME_REWRITE";

/*------------------------------------------------------------
    --- RANGES AND HEIGHTS ---
    All values in meters.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- SECONDARY MISSION SETTINGS ---
    Settings which are connected to the available secondary missions which can be started by players via the secondary mission dialog.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- FUEL CONSUMPTION SETTINGS ---
    Values for the KP Fuel Consumption Script.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- CAP SETTINGS ---
    Caps for different groups/mechanics.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- CIVIL REPUTATION SETTINGS ---
    Values connected to the civil reputation system.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- ASYMMETRIC WARFARE SETTINGS ---
    Values connected to the asymmetric warfare / resistance system.
------------------------------------------------------------*/



/*------------------------------------------------------------
    --- ACE RELATED SETTINGS ---
    Special settings which are only affect the game if you run ACE.
------------------------------------------------------------*/

// Vehicle classnames which also function as ACE medical vehicles.
KPLIB_ace_medVehicles = [
    "B_Truck_01_medical_F",
    "B_T_Truck_01_medical_F",
    "rhsusf_m113_usarmy_medical",
    "rhsusf_m113d_usarmy_medical",
    "RHS_UH60M_MEV2",
    "RHS_UH60M_MEV2_d",
    "rhsusf_M1230a1_usarmy_d",
    "rhsusf_M1230a1_usarmy_wd"
];

// Classnames of ACE3 crates (which have to be in the unit preset as well).
KPLIB_ace_crates = [
    "ACE_Box_82mm_Mo_HE",
    "ACE_Box_82mm_Mo_Smoke",
    "ACE_Box_82mm_Mo_Illum",
    "ACE_medicalSupplyCrate_advanced"
];

/*------------------------------------------------------------
    --- TRANSPORT AND STORAGE SETTINGS ---
    Transport vehicle and storage area offset configurations.
------------------------------------------------------------*/

// Large storage area placement position offsets.
KPLIB_storage_largeOffsets = [
    [-5.59961,3.60938,0.6],
    [-3.99902,3.60938,0.6],
    [-2.39941,3.60938,0.6],
    [-0.799805,3.60938,0.6],
    [0.800781,3.60938,0.6],
    [2.40039,3.60938,0.6],
    [4.00098,3.60938,0.6],
    [5.60059,3.60938,0.6],
    [-5.59961,1.80859,0.6],
    [-3.99902,1.80859,0.6],
    [-2.39941,1.80859,0.6],
    [-0.799805,1.80859,0.6],
    [0.800781,1.80859,0.6],
    [2.40039,1.80859,0.6],
    [4.00098,1.80859,0.6],
    [5.60059,1.80859,0.6],
    [-5.59961,0.00976563,0.6],
    [-3.99902,0.00976563,0.6],
    [-2.39941,0.00976563,0.6],
    [-0.799805,0.00976563,0.6],
    [0.800781,0.00976563,0.6],
    [2.40039,0.00976563,0.6],
    [4.00098,0.00976563,0.6],
    [5.60059,0.00976563,0.6],
    [-5.59961,-1.79102,0.6],
    [-3.99902,-1.79102,0.6],
    [-2.39941,-1.79102,0.6],
    [-0.799805,-1.79102,0.6],
    [0.800781,-1.79102,0.6],
    [2.40039,-1.79102,0.6],
    [4.00098,-1.79102,0.6],
    [5.60059,-1.79102,0.6],
    [-5.59961,-3.58984,0.6],
    [-3.99902,-3.58984,0.6],
    [-2.39941,-3.58984,0.6],
    [-0.799805,-3.58984,0.6],
    [0.800781,-3.58984,0.6],
    [2.40039,-3.58984,0.6],
    [4.00098,-3.58984,0.6],
    [5.60059,-3.58984,0.6]
];
// Small storage area placement position offsets.
KPLIB_storage_smallOffsets = [
    [-2.34961,1.80078,0.6],
    [-0.75,1.80078,0.6],
    [0.850586,1.80078,0.6],
    [2.4502,1.80078,0.6],
    [-2.34961,0,0.6],
    [-0.75,0,0.6],
    [0.850586,0,0.6],
    [2.4502,0,0.6],
    [-2.34961,-1.79883,0.6],
    [-0.75,-1.79883,0.6],
    [0.850586,-1.79883,0.6],
    [2.4502,-1.79883,0.6]
];
// Configuration settings for crates transported by vehicles ["classname", distance behind vehicle to unload crate, attachTo positions for each box].
KPLIB_transport_config = [
    ["C_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["I_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["O_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["O_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["C_Truck_02_transport_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["C_Truck_02_covered_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["RHS_Ural_Open_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Open_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["LOP_TAK_Civ_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["LOP_TAK_Civ_Ural", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["rhsusf_M977A4_BKIT_usarmy_d", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_d", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["rhsusf_M977A4_BKIT_usarmy_wd", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["I_Heli_Transport_02_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["BW_AW101_Trans_Heer_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["B_Heli_Transport_03_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_Heli_Transport_03_unarmed_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_T_VTOL_01_infantry_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
    ["B_T_VTOL_01_vehicle_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
    ["RHS_CH_47F_10", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F_light", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["UK3CB_BAF_Merlin_HC3_18_DPMT", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_32_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_CSAR_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["O_Truck_03_transport_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["BW_LKW7T_Trans_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_Truck_03_covered_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_T_Truck_03_transport_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_T_Truck_03_covered_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["greuh_eh101_gr", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["CUP_B_Wolfhound_GMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_HMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_LMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["rhsusf_m998_w_2dr_halftop", -4.5, [0,-0.9,-0.2]],
    ["rhsusf_m998_d_2dr_halftop", -4.5, [0,-0.9,-0.2]],
    ["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]]
];

/*------------------------------------------------------------
    --- RESUPPLY SETTINGS ---
    Arrays with classnames for the Liberation resupply script.
------------------------------------------------------------*/

// Everything the AI troops should be able to resupply from.
KPLIB_resupply_aiSource = [
    "B_Truck_01_ammo_F",
    "B_T_Truck_01_ammo_F",
    "B_Slingload_01_Ammo_F",
    "B_APC_Tracked_01_CRV_F",
    "B_T_APC_Tracked_01_CRV_F",
    "rhsusf_M977A4_AMMO_usarmy_d",
    "rhsusf_M977A4_AMMO_usarmy_wd",
    "rhsusf_M977A4_AMMO_BKIT_usarmy_d",
    "rhsusf_M977A4_AMMO_BKIT_usarmy_wd",
    "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
    "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
    "BW_LKW15T_Ammo_F",
    "rhs_gaz66_ammo_msv"
];

// Vehicles which should be able to repair other vehicles.
KPLIB_resupply_repairSource = [
    "C_Offroad_01_repair_F",
    "B_Truck_01_Repair_F",
    "B_T_Truck_01_Repair_F",
    "B_Slingload_01_Repair_F",
    "B_APC_Tracked_01_CRV_F",
    "B_T_APC_Tracked_01_CRV_F",
    "rhsusf_M977A4_REPAIR_usarmy_d",
    "rhsusf_M977A4_REPAIR_usarmy_wd",
    "rhsusf_M977A4_REPAIR_BKIT_usarmy_d",
    "rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",
    "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d",
    "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",
    "BW_LKW15T_Repair_F"
];

// Vehicles which should be able to rearm other vehicles.
KPLIB_resupply_rearmSource = [
    "B_Truck_01_ammo_F",
    "B_T_Truck_01_ammo_F",
    "B_Slingload_01_Ammo_F",
    "B_APC_Tracked_01_CRV_F",
    "B_T_APC_Tracked_01_CRV_F",
    "rhsusf_M977A4_AMMO_usarmy_d",
    "rhsusf_M977A4_AMMO_usarmy_wd",
    "rhsusf_M977A4_AMMO_BKIT_usarmy_d",
    "rhsusf_M977A4_AMMO_BKIT_usarmy_wd",
    "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
    "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",
    "BW_LKW15T_Ammo_F"
];

// Vehicles which should be able to refuel other vehicles.
KPLIB_resupply_refuelSource = [
    "C_Van_01_fuel_F",
    "C_Truck_02_fuel_F",
    "B_Truck_01_fuel_F",
    "B_T_Truck_01_fuel_F",
    "B_Slingload_01_Fuel_F",
    "B_APC_Tracked_01_CRV_F",
    "B_T_APC_Tracked_01_CRV_F",
    "rhsusf_M978A4_usarmy_d",
    "rhsusf_M978A4_usarmy_wd",
    "rhsusf_M978A4_BKIT_usarmy_d",
    "rhsusf_M978A4_BKIT_usarmy_wd",
    "BW_LKW15T_Fuel_F"
];

/*------------------------------------------------------------
    --- MISC SETTINGS ---
    Single values, so they aren't grouped in a category.
------------------------------------------------------------*/



// Config was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable ["config", true];
