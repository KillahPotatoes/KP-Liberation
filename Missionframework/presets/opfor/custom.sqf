/*
    KP Liberation custom opfor preset

    File: custom.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Custom preset file for OPFOR units which contains only vanilla assets by default.

    Needed Mods:
    - None

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
KPLIB_preset_oOfficer = "O_officer_F";
// Squad Leader
KPLIB_preset_oSquadLeader = "O_Soldier_SL_F";
// Team Leader
KPLIB_preset_oTeamLeader = "O_Soldier_TL_F";
// Rifleman (Lite)
KPLIB_preset_oSentry = "O_Soldier_lite_F";
// Rifleman
KPLIB_preset_oRifleman = "O_Soldier_F";
// Rifleman (LAT)
KPLIB_preset_oRpg = "O_Soldier_LAT_F";
// Grenadier
KPLIB_preset_oGrenadier = "O_Soldier_GL_F";
// Autorifleman
KPLIB_preset_oMachinegunner = "O_Soldier_AR_F";
// Heavy Gunner
KPLIB_preset_oHeavygunner = "O_HeavyGunner_F";
// Marksman
KPLIB_preset_oMarksman = "O_soldier_M_F";
// Sharpshooter
KPLIB_preset_oSharpshooter = "O_Sharpshooter_F";
// Sniper
KPLIB_preset_oSniper = "O_sniper_F";
// AT Specialist
KPLIB_preset_oAt = "O_Soldier_AT_F";
// AA Specialist
KPLIB_preset_oAa = "O_Soldier_AA_F";
// Combat Life Saver
KPLIB_preset_oMedic = "O_medic_F";
// Engineer
KPLIB_preset_oEngineer = "O_engineer_F";
//Paratrooper
KPLIB_preset_oParatrooper = "O_soldier_PG_F";

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_preset_oVehicles = [
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  //Ifrit (GMG)
    "O_MRAP_02_gmg_F",                                                  //Ifrit (GMG)
    "O_APC_Tracked_02_cannon_F",                                        //BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            //ZSU-39 Tigris
    "O_APC_Tracked_02_AA_F",                                            //ZSU-39 Tigris
    "O_MBT_02_cannon_F",                                                //T-100 Varsuk
    "O_MBT_02_cannon_F"                                                 //T-100 Varsuk
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_preset_oVehiclesLow = [
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_APC_Wheeled_02_rcws_F",                                          //MSE-3 Marid
    "O_APC_Tracked_02_cannon_F"                                         //BTR-K Kamysh
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_preset_oChoppers = [
    "O_Heli_Transport_04_bench_F",                                      //Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 //Po-30 Orca (Armed)
    "O_Heli_Attack_02_dynamicLoadout_F"                                 //Mi-48 Kajman
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_preset_oJets = [
    "O_Plane_CAS_02_dynamicLoadout_F",                                  //To-199 Neophron (CAS)
    "O_Plane_Fighter_02_F"                                              //To-201 Shikra
];

/*------------------------------------------------------------
    --- ENEMY MILITIA CLASSNAMES ---
    Lightweight soldier classnames the game will pick from randomly as sector defenders.
    Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies.
------------------------------------------------------------*/

// Militia soldiers
KPLIB_preset_oMilUnits = [
    "O_soldierU_F",                                                     //Rifleman (Lite)
    "O_soldierU_F",                                                     //Rifleman (Lite)
    "O_soldierU_F",                                                     //Rifleman
    "O_soldierU_F",                                                     //Rifleman
    "O_soldierU_LAT_F",                                                 //Rifleman (AT)
    "O_soldierU_AR_F",                                                  //Autorifleman
    "O_soldierU_M_F",                                                   //Marksman
    "O_soldierU_medic_F",                                               //Medic
    "O_engineer_U_F"                                                    //Engineer
];

// Militia vehicles
KPLIB_preset_oMilVeh = [
    "O_LSV_02_armed_F"                                                  //Qilin (armed)
];

/*------------------------------------------------------------
    --- ENEMY BATTLEGROUPS CLASSNAMES ---
    All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements.
------------------------------------------------------------*/

// Vehicles for high enemy combat readiness (aggression level).
KPLIB_preset_oBattleVeh = [
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_MRAP_02_gmg_F",                                                  //Ifrit (GMG)
    "O_MRAP_02_gmg_F",                                                  //Ifrit (GMG)
    "O_Truck_03_transport_F",                                           //Tempest Transport
    "O_Truck_03_covered_F",                                             //Tempest Transport (Covered)
    "O_APC_Tracked_02_cannon_F",                                        //BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            //ZSU-39 Tigris
    "O_APC_Tracked_02_AA_F",                                            //ZSU-39 Tigris
    "O_MBT_02_cannon_F",                                                //T-100 Varsuk
    "O_MBT_02_cannon_F",                                                //T-100 Varsuk
    "O_Heli_Light_02_dynamicLoadout_F",                                 //Po-30 Orca (Armed)
    "O_Heli_Light_02_dynamicLoadout_F",                                 //Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F",                                      //Mi-290 Taru (Bench)
    "O_Heli_Attack_02_dynamicLoadout_F"                                 //Mi-48 Kajman
];

// Vehicles for lower enemy combat readiness (aggression levels).
KPLIB_preset_oBattleVehLow = [
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  //Ifrit (HMG)
    "O_Truck_03_transport_F",                                           //Tempest Transport
    "O_APC_Wheeled_02_rcws_F",                                          //MSE-3 Marid
    "O_APC_Tracked_02_cannon_F",                                        //BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            //ZSU-39 Tigris
    "O_Heli_Light_02_dynamicLoadout_F",                                 //Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F"                                       //Mi-290 Taru (Bench)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also able to hold at least 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_preset_oBattleTransports = [
    "O_Truck_03_transport_F",                                           //Tempest Transport
    "O_Truck_03_covered_F",                                             //Tempest Transport (Covered)
    "O_APC_Wheeled_02_rcws_F",                                          //MSE-3 Marid
    "O_Heli_Transport_04_bench_F",                                      //Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F"                                  //Po-30 Orca (Armed)
];

/*------------------------------------------------------------
    --- ENEMY SECONDARY OBJECTIVE CLASSNAMES ---
    Classnames which are used by the creation of secondary objectives.
------------------------------------------------------------*/

// Unarmed MRAP
KPLIB_preset_oMrap = "O_MRAP_02_F";                                     //Ifrit
// Armed MRAP
KPLIB_preset_oMrapArmed = "O_MRAP_02_hmg_F";                            //Ifrit (HMG)
// Transport helicopter
KPLIB_preset_oTransportHeli = "O_Heli_Transport_04_bench_F";            //Mi-290 Taru (Bench)
// Transport truck
KPLIB_preset_oTransportTruck = "O_Truck_03_covered_F";                  //Tempest Transport (Covered)
// Logistic truck (has to be able to transport reouce crates)
KPLIB_preset_oLogiTruck = "O_Truck_03_transport_F";                     //Tempest Transport (Open)
// Fuel truck
KPLIB_preset_oFuelTruck = "O_Truck_03_fuel_F";                          //Tempest Fuel
// Ammo truck
KPLIB_preset_oAmmoTruck = "O_Truck_03_ammo_F";                          //Tempest Ammo
// Fuel container
KPLIB_preset_oFuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";      //Taru Fuel Pod
// Ammo container
KPLIB_preset_oAmmoContainer = "Land_Pod_Heli_Transport_04_ammo_F";      //Taru Ammo Pod
// Enemy flag
KPLIB_preset_oFlag = "Flag_CSAT_F";                                     //CSAT Flag
