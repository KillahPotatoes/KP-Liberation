/*
    KP Liberation Islamic State opfor preset

    File: islamic_state.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-15
    Last Update: 2018-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Islamic State preset file for OPFOR units.

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
KPLIB_preset_oOfficer = "LOP_ISTS_OPF_Infantry_SL";
// Squad Leader
KPLIB_preset_oSquadLeader = "LOP_ISTS_OPF_Infantry_SL";
// Team Leader
KPLIB_preset_oTeamLeader = "LOP_ISTS_OPF_Infantry_TL";
// Rifleman (Lite)
KPLIB_preset_oSentry = "LOP_ISTS_OPF_Infantry_Rifleman";
// Rifleman
KPLIB_preset_oRifleman = "LOP_ISTS_OPF_Infantry_Rifleman_5";
// Rifleman (LAT)
KPLIB_preset_oRpg = "LOP_ISTS_OPF_Infantry_AT";
// Grenadier
KPLIB_preset_oGrenadier = "LOP_ISTS_OPF_Infantry_GL";
// Autorifleman
KPLIB_preset_oMachinegunner = "LOP_ISTS_OPF_Infantry_AR_Asst";
// Heavy Gunner
KPLIB_preset_oHeavygunner = "LOP_ISTS_OPF_Infantry_AR";
// Marksman
KPLIB_preset_oMarksman = "LOP_ISTS_OPF_Infantry_Rifleman_2";
// Sharpshooter
KPLIB_preset_oSharpshooter = "LOP_ISTS_OPF_Infantry_Marksman";
// Sniper
KPLIB_preset_oSniper = "LOP_ISTS_OPF_Infantry_Marksman";
// AT Specialist
KPLIB_preset_oAt = "LOP_ISTS_OPF_Infantry_AT";
// AA Specialist
KPLIB_preset_oAa = "LOP_ISTS_OPF_Infantry_AT";
// Combat Life Saver
KPLIB_preset_oMedic = "LOP_ISTS_OPF_Infantry_Corpsman";
// Engineer
KPLIB_preset_oEngineer = "LOP_ISTS_OPF_Infantry_Engineer";
//Paratrooper
KPLIB_preset_oParatrooper = "LOP_ISTS_OPF_Infantry_Rifleman_6";

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_preset_oVehicles = [
    "LOP_ISTS_OPF_Landrover_M2",                                        //Land Rover (M2)
    "LOP_ISTS_OPF_Landrover_SPG9",                                      //Land Rover (SPG)
    "LOP_ISTS_OPF_M1025_W_M2",                                          //M10252 (M2)
    "LOP_ISTS_OPF_M1025_W_Mk19",                                        //M1025A2 (Mk19)
    "LOP_ISTS_OPF_Offroad_M2",                                          //Offroad (M2)
    "LOP_ISTS_OPF_BMP2",                                                //BMP-2
    "LOP_ISTS_OPF_BTR60",                                               //BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 //T-34-85M
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_ZSU234",                                              //ZSU-23-4V
    "LOP_ISTS_OPF_ZSU234"                                               //ZSU-23-4V
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_preset_oVehiclesLow = [
    "LOP_ISTS_OPF_Landrover_M2",                                        //Land Rover (M2)
    "LOP_ISTS_OPF_Landrover_SPG9",                                      //Land Rover (SPG)
    "LOP_ISTS_OPF_M1025_W_M2",                                          //M10252 (M2)
    "LOP_ISTS_OPF_M1025_W_Mk19",                                        //M1025A2 (Mk19)
    "LOP_ISTS_OPF_Offroad_M2",                                          //Offroad (M2)
    "LOP_ISTS_OPF_BMP2",                                                //BMP-2
    "LOP_ISTS_OPF_BTR60",                                               //BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 //T-34-85M
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_ZSU234",                                              //ZSU-23-4V
    "LOP_ISTS_OPF_ZSU234"                                               //ZSU-23-4V
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_preset_oChoppers = [
    "LOP_TKA_Mi8MT_Cargo",                                              //Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                //Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               //Mi-24V (UPK)];
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
    "LOP_AM_OPF_Infantry_Rifleman",                                     //Rifleman (AKM)
    "LOP_AM_OPF_Infantry_Rifleman",                                     //Rifleman (AKM)
    "LOP_AM_OPF_Infantry_Rifleman_5",                                   //Rifleman (AKM-74)
    "LOP_AM_OPF_Infantry_Rifleman_5",                                   //Rifleman (AKM-74)
    "LOP_AM_OPF_Infantry_AT",                                           //Rifleman (RPG-7)
    "LOP_AM_OPF_Infantry_AR",                                           //Autorifleman (PKM)
    "LOP_AM_OPF_Infantry_Rifleman_3",                                   //Marksman (Lee Enfield)
    "LOP_AM_OPF_Infantry_Corpsman",                                     //Medic (Bonesetter)
    "LOP_AM_OPF_Infantry_Engineer"                                      //Engineer (Bomber)
];

// Militia vehicles
KPLIB_preset_oMilVeh = [
    "LOP_AM_OPF_UAZ_DshKM"                                              //UAZ-3151 (DShKM)
];

/*------------------------------------------------------------
    --- ENEMY BATTLEGROUPS CLASSNAMES ---
    All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements.
------------------------------------------------------------*/

// Vehicles for high enemy combat readiness (aggression level).
KPLIB_preset_oBattleVeh = [
    "LOP_ISTS_OPF_Landrover_M2",                                        //Land Rover (M2)
    "LOP_ISTS_OPF_Landrover_SPG9",                                      //Land Rover (SPG)
    "LOP_ISTS_OPF_M1025_W_M2",                                          //M10252 (M2)
    "LOP_ISTS_OPF_M1025_W_Mk19",                                        //M1025A2 (Mk19)
    "LOP_ISTS_OPF_Offroad_M2",                                          //Offroad (M2)
    "LOP_ISTS_OPF_Truck",                                               //Truck (Cargo)
    "LOP_ISTS_OPF_Truck",                                               //Truck (Cargo)
    "LOP_ISTS_OPF_BMP2",                                                //BMP-2
    "LOP_ISTS_OPF_BTR60",                                               //BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 //T-34-85M
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T55",                                                 //T55A
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_T72BA",                                               //T72B
    "LOP_ISTS_OPF_ZSU234",                                              //ZSU-23-4V
    "LOP_ISTS_OPF_ZSU234",                                              //ZSU-23-4V
    "LOP_TKA_Mi8MT_Cargo",                                              //Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                //Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               //Mi-24V (UPK)
];

// Vehicles for lower enemy combat readiness (aggression levels).
KPLIB_preset_oBattleVehLow = [
    "LOP_ISTS_OPF_Landrover_M2",                                        //Land Rover (M2)
    "LOP_ISTS_OPF_Nissan_PKM",                                          //Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          //Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          //Nissan (PKM)
    "LOP_ISTS_OPF_Truck",                                               //Truck (Cargo)
    "LOP_ISTS_OPF_Truck",                                               //Truck (Cargo)
    "LOP_ISTS_OPF_BMP1",                                                //BMP-1
    "LOP_ISTS_OPF_BMP1",                                                //BMP-1
    "LOP_ISTS_OPF_BMP2",                                                //BMP-2
    "LOP_ISTS_OPF_BTR60",                                               //BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 //T-34-85M
    "LOP_ISTS_OPF_ZSU234",                                              //ZSU-23-4V
    "LOP_TKA_Mi8MT_Cargo",                                              //Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 //Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                //Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               //Mi-24V (UPK)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also able to hold at least 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_preset_oBattleTransports = [
    "LOP_ISTS_OPF_Truck",                                               //Truck (Cargo)
    "LOP_ISTS_OPF_BMP1",                                                //BMP-1
    "LOP_ISTS_OPF_BMP2",                                                //BMP-2
    "LOP_ISTS_OPF_BTR60",                                               //BTR-60PB
    "LOP_TKA_Mi8MT_Cargo"                                               //Mi-8MT (Cargo)
];

/*------------------------------------------------------------
    --- ENEMY SECONDARY OBJECTIVE CLASSNAMES ---
    Classnames which are used by the creation of secondary objectives.
------------------------------------------------------------*/

// Unarmed MRAP
KPLIB_preset_oMrap = "LOP_ISTS_OPF_Offroad";                            //Offroad
// Armed MRAP
KPLIB_preset_oMrapArmed = "LOP_ISTS_OPF_Offroad_M2";                    //Offroad (M2)
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
