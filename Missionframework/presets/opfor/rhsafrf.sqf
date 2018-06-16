/*
    KP Liberation RHSAFRF opfor preset

    File: rhsafrf.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-17
    Last Update: 2018-06-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    RHSAFRF preset file for OPFOR units.

    Needed Mods:
    - RHSAFRF

    Optional Mods:
    - None

    --- NOTE
    Adding a value to the arrays below will add them to a one out of however many in the array, random pick chance.
    Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
    --- ENDNOTE
*/

// Side for this preset
KPLIB_preset_sideEnemy = east;
// Color for this side
KPLIB_preset_colorEnemy = "ColorEAST";
// Color for this side (active)
KPLIB_preset_colorEnemyAct = "ColorRed";


/*------------------------------------------------------------
    --- ENEMY REGULAR ARMY CLASSNAMES ---
    Classnames for the regular armed forces of the enemy.
------------------------------------------------------------*/

// Officer
KPLIB_preset_oOfficer = "rhs_msv_emr_officer";
// Squad Leader
KPLIB_preset_oSquadLeader = "rhs_msv_emr_sergeant";
// Team Leader
KPLIB_preset_oTeamLeader = "rhs_msv_emr_efreitor";
// Rifleman (Lite)
KPLIB_preset_oSentry = "rhs_msv_emr_rifleman";
// Rifleman
KPLIB_preset_oRifleman = "rhs_msv_emr_rifleman";
// Rifleman (LAT)
KPLIB_preset_oRpg = "rhs_msv_emr_LAT";
// Grenadier
KPLIB_preset_oGrenadier = "rhs_msv_emr_grenadier";
// Autorifleman
KPLIB_preset_oMachinegunner = "rhs_msv_emr_arifleman";
// Heavy Gunner
KPLIB_preset_oHeavygunner = "rhs_msv_emr_machinegunner";
// Marksman
KPLIB_preset_oMarksman = "rhs_msv_emr_marksman";
// Sharpshooter
KPLIB_preset_oSharpshooter = "rhs_msv_emr_marksman";
// Sniper
KPLIB_preset_oSniper = "rhs_msv_emr_marksman";
// AT Specialist
KPLIB_preset_oAt = "rhs_msv_emr_at";
// AA Specialist
KPLIB_preset_oAa = "rhs_msv_emr_aa";
// Combat Life Saver
KPLIB_preset_oMedic = "rhs_msv_emr_medic";
// Engineer
KPLIB_preset_oEngineer = "rhs_msv_emr_engineer";
//Paratrooper
KPLIB_preset_oParatrooper = "rhs_msv_emr_RShG2";

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_preset_oVehicles = [
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_bmp2d_msv",                                                    //BMP-2D
    "rhs_bmp2k_msv",                                                    //BMP-2K
    "rhs_brm1k_msv",                                                    //BRM-1K
    "rhs_zsu234_aa",                                                    //ZSU-23-4V
    "rhs_zsu234_aa",                                                    //ZSU-23-4V
    "rhs_t80",                                                          //T80
    "rhs_t80",                                                          //T80
    "rhs_t90a_tv"                                                       //T90A
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_preset_oVehiclesLow = [
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_btr80_msv",                                                    //BTR-80
    "rhs_btr80a_msv"                                                    //BTR-80A
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_preset_oChoppers = [
    "RHS_Mi8mt_Cargo_vvsc",                                             //Mi-8MT (Cargo)
    "RHS_Mi24P_AT_vvsc",                                                //Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                //Mi-24V (AT)
    "RHS_Ka52_vvsc"                                                     //Ka-52
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_preset_oJets = [
    "RHS_Su25SM_vvsc",                                                  //Su-25
    "RHS_Su25SM_KH29_vvsc"                                              //Su-25 (KH29)
];

/*------------------------------------------------------------
    --- ENEMY MILITIA CLASSNAMES ---
    Lightweight soldier classnames the game will pick from randomly as sector defenders.
    Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies.
------------------------------------------------------------*/

// Militia soldiers
KPLIB_preset_oMilUnits = [
    "rhs_msv_emr_rifleman",                                             //Rifleman
    "rhs_msv_emr_rifleman",                                             //Rifleman
    "rhs_msv_emr_rifleman",                                             //Rifleman
    "rhs_msv_emr_LAT",                                                  //Rifleman (AT)
    "rhs_msv_emr_arifleman",                                            //Autorifleman
    "rhs_msv_emr_marksman",                                             //Marksman
    "rhs_msv_emr_medic",                                                //Medic
    "rhs_msv_emr_engineer"                                              //Engineer
];

// Militia vehicles
KPLIB_preset_oMilVeh = [
    "rhs_tigr_sts_msv"                                                  //GAZ-233014 (Armed)
];

/*------------------------------------------------------------
    --- ENEMY BATTLEGROUPS CLASSNAMES ---
    All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements.
------------------------------------------------------------*/

// Vehicles for high enemy combat readiness (aggression level).
KPLIB_preset_oBattleVeh = [
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "RHS_Ural_Open_MSV_01",                                             //Ural-4320 Transport
    "RHS_Ural_MSV_01",                                                  //Ural-4320 Transport (Covered)
    "rhs_bmp2d_msv",                                                    //BMP-2D
    "rhs_bmp2k_msv",                                                    //BMP-2K
    "rhs_brm1k_msv",                                                    //BRM-1K
    "rhs_zsu234_aa",                                                    //ZSU-23-4V
    "rhs_zsu234_aa",                                                    //ZSU-23-4V
    "rhs_t80",                                                          //T80
    "rhs_t80",                                                          //T80
    "rhs_t90a_tv",                                                      //T90A
    "RHS_Mi24P_AT_vvsc",                                                //Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                //Mi-24V (AT)
    "RHS_Mi8mt_Cargo_vvsc",                                             //Mi-8MT (Cargo)
    "RHS_Ka52_vvsc"                                                     //Ka-52
];

// Vehicles for lower enemy combat readiness (aggression levels).
KPLIB_preset_oBattleVehLow = [
    "rhs_tigr_msv",                                                     //GAZ-233011
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 //GAZ-233014 (Armed)
    "RHS_Ural_Open_MSV_01",                                             //Ural-4320 Transport
    "rhs_btr80_msv",                                                    //BTR-80
    "rhs_btr80a_msv",                                                   //BTR-80A
    "rhs_zsu234_aa",                                                    //ZSU-23-4V
    "RHS_Mi24P_AT_vvsc",                                                //Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                //Mi-24V (AT)
    "RHS_Mi8mt_Cargo_vvsc"                                              //Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also able to hold at least 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_preset_oBattleTransports = [
    "RHS_Ural_Open_MSV_01",                                             //Ural-4320 Transport
    "RHS_Ural_MSV_01",                                                  //Ural-4320 Transport (Covered)
    "rhs_btr80_msv",                                                    //BTR-80
    "rhs_btr80a_msv",                                                   //BTR-80A
    "rhs_bmp2d_msv",                                                    //BMP-2D
    "RHS_Mi8mt_Cargo_vvsc",                                             //Mi-8MT (Cargo)
    "RHS_Mi24P_AT_vvsc",                                                //Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc"                                                 //Mi-24V (AT)
];

/*------------------------------------------------------------
    --- ENEMY SECONDARY OBJECTIVE CLASSNAMES ---
    Classnames which are used by the creation of secondary objectives.
------------------------------------------------------------*/

// Unarmed MRAP
KPLIB_preset_oMrap = "rhs_tigr_msv";                                    //GAZ-233011
// Armed MRAP
KPLIB_preset_oMrapArmed = "rhs_tigr_sts_msv";                           //GAZ-233014 (Armed)
// Transport helicopter
KPLIB_preset_oTransportHeli = "RHS_Mi8mt_Cargo_vvsc";                   //Mi-8MT (Cargo)
// Transport truck
KPLIB_preset_oTransportTruck = "RHS_Ural_MSV_01";                       //Ural-4320 Transport (Covered)
// Logistic truck (has to be able to transport reouce crates)
KPLIB_preset_oLogiTruck = "RHS_Ural_Open_MSV_01";                       //Ural-4320 Transport (Open)
// Fuel truck
KPLIB_preset_oFuelTruck = "RHS_Ural_Fuel_MSV_01";                       //Ural-4320 Fuel
// Ammo truck
KPLIB_preset_oAmmoTruck = "rhs_gaz66_ammo_msv";                         //GAZ-66 Ammo
// Fuel container
KPLIB_preset_oFuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";      //Taru Fuel Pod
// Ammo container
KPLIB_preset_oAmmoContainer = "Land_Pod_Heli_Transport_04_ammo_F";      //Taru Ammo Pod
// Enemy flag
KPLIB_preset_oFlag = "rhs_Flag_Russia_F";                                       //Russian Flag
