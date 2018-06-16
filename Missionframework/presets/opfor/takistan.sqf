/*
    KP Liberation Takistan opfor preset

    File: takistan.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-17
    Last Update: 2018-06-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Takistan preset file for OPFOR units.

    Needed Mods:
    - RHSUSAF
    - RHSAFRF
    - Project OPFOR

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
KPLIB_preset_oOfficer = "LOP_TKA_Infantry_Officer";
// Squad Leader
KPLIB_preset_oSquadLeader = "LOP_TKA_Infantry_SL";
// Team Leader
KPLIB_preset_oTeamLeader = "LOP_TKA_Infantry_TL";
// Rifleman (Lite)
KPLIB_preset_oSentry = "LOP_TKA_Infantry_Rifleman";
// Rifleman
KPLIB_preset_oRifleman = "LOP_TKA_Infantry_Rifleman_2";
// Rifleman (LAT)
KPLIB_preset_oRpg = "LOP_TKA_Infantry_Rifleman_3";
// Grenadier
KPLIB_preset_oGrenadier = "LOP_TKA_Infantry_GL";
// Autorifleman
KPLIB_preset_oMachinegunner = "LOP_TKA_Infantry_MG";
// Heavy Gunner
KPLIB_preset_oHeavygunner = "LOP_TKA_Infantry_MG";
// Marksman
KPLIB_preset_oMarksman = "LOP_TKA_Infantry_Marksman";
// Sharpshooter
KPLIB_preset_oSharpshooter = "LOP_TKA_Infantry_Marksman";
// Sniper
KPLIB_preset_oSniper = "LOP_TKA_Infantry_Marksman";
// AT Specialist
KPLIB_preset_oAt = "LOP_TKA_Infantry_AT";
// AA Specialist
KPLIB_preset_oAa = "LOP_TKA_Infantry_AA";
// Combat Life Saver
KPLIB_preset_oMedic = "LOP_TKA_Infantry_Corpsman";
// Engineer
KPLIB_preset_oEngineer = "LOP_TKA_Infantry_Engineer";
//Paratrooper
KPLIB_preset_oParatrooper = "LOP_TKA_Infantry_Rifleman";

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_preset_oVehicles = [
    "LOP_TKA_UAZ_DshKM",                                                //UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  //UAZ-3151 (AGS-30)
    "LOP_TKA_UAZ_SPG",                                                  //UAZ-3151 (SPG-9)
    "LOP_TKA_BMP2",                                                     //BMP-2
    "LOP_TKA_BMP2D",                                                    //BMP-2D
    "LOP_TKA_BTR70",                                                    //BTR-70
    "LOP_TKA_ZSU234",                                                   //ZSU-23-4V
    "LOP_TKA_ZSU234",                                                   //ZSU-23-4V
    "LOP_TKA_T55",                                                      //T-55A
    "LOP_TKA_T72BB",                                                    //T-72B
    "LOP_TKA_T72BB"                                                     //T-72B];
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_preset_oVehiclesLow = [
    "LOP_TKA_UAZ_DshKM",                                                //UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  //UAZ-3151 (AGS-30)
    "LOP_TKA_BMP1",                                                     //BMP-1
    "LOP_TKA_BMP1D",                                                    //BMP-1D
    "LOP_TKA_BTR60"                                                     //BTR-60PB
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_preset_oChoppers = [
    "LOP_TKA_Mi8MT_Cargo",                                              //Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23"                                               //Mi-24V (UPK)
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
    "LOP_TKA_Infantry_Rifleman",                                        //Rifleman (Lite)
    "LOP_TKA_Infantry_Rifleman",                                        //Rifleman (Lite)
    "LOP_TKA_Infantry_Rifleman_2",                                      //Rifleman
    "LOP_TKA_Infantry_Rifleman_2",                                      //Rifleman
    "LOP_TKA_Infantry_Rifleman_3",                                      //Rifleman (AT)
    "LOP_TKA_Infantry_MG",                                              //Autorifleman
    "LOP_TKA_Infantry_Marksman",                                        //Marksman
    "LOP_TKA_Infantry_Corpsman",                                        //Medic
    "LOP_TKA_Infantry_Engineer"                                         //Engineer
];

// Militia vehicles
KPLIB_preset_oMilVeh = [
    "LOP_TKA_UAZ_DshKM"                                                 //UAZ-3151 (DShKM)
];

/*------------------------------------------------------------
    --- ENEMY BATTLEGROUPS CLASSNAMES ---
    All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements.
------------------------------------------------------------*/

// Vehicles for high enemy combat readiness (aggression level).
KPLIB_preset_oBattleVeh = [
    "LOP_TKA_UAZ",                                                      //UAZ-3151 (Covered)
    "LOP_TKA_UAZ_DshKM",                                                //UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  //UAZ-3151 (AGS-30)
    "LOP_TKA_UAZ_SPG",                                                  //UAZ-3151 (SPG-9)
    "LOP_TKA_Ural_open",                                                //Ural-4320 Transport
    "LOP_TKA_Ural",                                                     //Ural-4320 Transport (Covered)
    "LOP_TKA_BMP2",                                                     //BMP-2
    "LOP_TKA_BMP2D",                                                    //BMP-2D
    "LOP_TKA_BTR70",                                                    //BTR-70
    "LOP_TKA_ZSU234",                                                   //ZSU-23-4V
    "LOP_TKA_ZSU234",                                                   //ZSU-23-4V
    "LOP_TKA_T55",                                                      //T-55A
    "LOP_TKA_T72BB",                                                    //T-72B
    "LOP_TKA_T72BB",                                                    //T-72B
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23",                                              //Mi-24V (UPK)
    "LOP_TKA_Mi8MT_Cargo"                                               //Mi-8MT (Cargo)
];

// Vehicles for lower enemy combat readiness (aggression levels).
KPLIB_preset_oBattleVehLow = [
    "LOP_TKA_UAZ_Open",                                                 //UAZ-3151
    "LOP_TKA_UAZ_DshKM",                                                //UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  //UAZ-3151 (AGS-30)
    "LOP_TKA_Ural_open",                                                //Ural-4320 Transport
    "LOP_TKA_BMP1",                                                     //BMP-1
    "LOP_TKA_BMP1D",                                                    //BMP-1D
    "LOP_TKA_BTR60",                                                    //BTR-60PB
    "LOP_TKA_ZSU234",                                                   //ZSU-23-4V
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23",                                              //Mi-24V (UPK)
    "LOP_TKA_Mi8MT_Cargo"                                               //Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also able to hold at least 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_preset_oBattleTransports = [
    "LOP_TKA_Ural_open",                                                //Ural-4320 Transport
    "LOP_TKA_Ural",                                                     //Ural-4320 Transport (Covered)
    "LOP_TKA_BTR70",                                                    //BTR-70
    "LOP_TKA_BMP1D",                                                    //BMP-1D
    "LOP_TKA_BMP2D",                                                    //BMP-2D
    "LOP_TKA_Mi8MT_Cargo",                                              //Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23"                                               //Mi-24V (UPK)
];

/*------------------------------------------------------------
    --- ENEMY SECONDARY OBJECTIVE CLASSNAMES ---
    Classnames which are used by the creation of secondary objectives.
------------------------------------------------------------*/

// Unarmed MRAP
KPLIB_preset_oMrap = "LOP_TKA_UAZ";                                     //UAZ-3151
// Armed MRAP
KPLIB_preset_oMrapArmed = "LOP_TKA_UAZ_AGS";                            //UAZ-3151 (AGS-30)
// Transport helicopter
KPLIB_preset_oTransportHeli = "LOP_TKA_Mi8MT_Cargo";                    //Mi-8MT (Cargo)
// Transport truck
KPLIB_preset_oTransportTruck = "LOP_TKA_Ural";                          //Ural-4320 (Covered)
// Logistic truck (has to be able to transport reouce crates)
KPLIB_preset_oLogiTruck = "LOP_TKA_Ural_open";                          //Ural-4320 (Open)
// Fuel truck
KPLIB_preset_oFuelTruck = "RHS_Ural_Fuel_MSV_01";                       //Ural-4320 (Fuel)
// Ammo truck
KPLIB_preset_oAmmoTruck = "rhs_gaz66_ammo_msv";                         //GAZ-66 (Ammo)
// Fuel container
KPLIB_preset_oFuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";      //Taru Fuel Pod
// Ammo container
KPLIB_preset_oAmmoContainer = "Land_Pod_Heli_Transport_04_ammo_F";      //Taru Ammo Pod
// Enemy flag
KPLIB_preset_oFlag = "lop_Flag_tak_F";                                  //Takistan Flag
