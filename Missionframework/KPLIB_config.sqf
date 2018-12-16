/*
    KP LIBERATION CONFIG FILE

    File: KPLIB_config.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Contains all settings which are meant to be adjustable by players but aren't implemented in the mission settings.
*/

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
    ["BW_AW101_Trans_Heer_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["BW_LKW7T_Trans_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["B_Heli_Transport_03_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_Heli_Transport_03_unarmed_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_T_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_VTOL_01_infantry_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
    ["B_T_VTOL_01_vehicle_F", -7.5,[0,4.7,-4.88],[0,3,-4.88],[0,1.3,-4.88],[0,-0.4,-4.88],[0,-2.1,-4.88]],
    ["B_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["CUP_B_Wolfhound_GMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_HMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_LMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["C_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["C_Truck_02_covered_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["C_Truck_02_transport_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["I_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_Heli_Transport_02_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["LOP_TAK_Civ_Ural", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["LOP_TAK_Civ_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["O_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["O_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["O_T_Truck_03_covered_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_T_Truck_03_transport_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_Truck_03_covered_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_Truck_03_transport_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["RHS_CH_47F", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F_10", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F_light", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_Ural_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Open_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Open_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["UK3CB_BAF_Merlin_HC3_18_DPMT", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_32_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_CSAR_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["greuh_eh101_gr", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_d", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["rhsusf_M977A4_BKIT_usarmy_d", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_M977A4_BKIT_usarmy_wd", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_m998_d_2dr_halftop", -4.5, [0,-0.9,-0.2]],
    ["rhsusf_m998_w_2dr_halftop", -4.5, [0,-0.9,-0.2]]
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
