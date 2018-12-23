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
