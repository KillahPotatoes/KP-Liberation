/*
    KP Liberation SLA opfor preset

    File: sla.sqf
    Author: Dubjunk - https://github.com/Dubjunk
    Date: 2018-06-17
    Last Update: 2018-06-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    SLA preset file for OPFOR units.

    Needed Mods:
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
KPLIB_preset_oOfficer = "LOP_SLA_Infantry_Officer";
// Squad Leader
KPLIB_preset_oSquadLeader = "LOP_SLA_Infantry_SL";
// Team Leader
KPLIB_preset_oTeamLeader = "LOP_SLA_Infantry_TL";
// Rifleman (Lite)
KPLIB_preset_oSentry = "LOP_SLA_Infantry_Rifleman";
// Rifleman
KPLIB_preset_oRifleman = "LOP_SLA_Infantry_Rifleman_2";
// Rifleman (LAT)
KPLIB_preset_oRpg = "LOP_SLA_Infantry_AT";
// Grenadier
KPLIB_preset_oGrenadier = "LOP_SLA_Infantry_GL";
// Autorifleman
KPLIB_preset_oMachinegunner = "LOP_SLA_Infantry_MG";
// Heavy Gunner
KPLIB_preset_oHeavygunner = "LOP_SLA_Infantry_MG";
// Marksman
KPLIB_preset_oMarksman = "LOP_SLA_Infantry_Marksman";
// Sharpshooter
KPLIB_preset_oSharpshooter = "LOP_SLA_Infantry_Marksman";
// Sniper
KPLIB_preset_oSniper = "LOP_SLA_Infantry_Marksman";
// AT Specialist
KPLIB_preset_oAt = "LOP_SLA_Infantry_AT";
// AA Specialist
KPLIB_preset_oAa = "LOP_SLA_Infantry_AA";
// Combat Life Saver
KPLIB_preset_oMedic = "LOP_SLA_Infantry_Corpsman";
// Engineer
KPLIB_preset_oEngineer = "LOP_SLA_Infantry_Engineer";
//Paratrooper
KPLIB_preset_oParatrooper = "LOP_SLA_Infantry_Rifleman";

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_preset_oVehicles = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_BMP2D",
    "LOP_SLA_BMP2",
    "LOP_SLA_BMP1D",
    "LOP_SLA_BMP1",
    "LOP_SLA_BTR60",
    "LOP_SLA_BTR70",
    "LOP_SLA_ZSU234",
    "LOP_SLA_T72BB",
    "LOP_SLA_T72BA"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_preset_oVehiclesLow = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_BTR60",
    "LOP_SLA_BMP2"
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_preset_oChoppers = [
    "LOP_SLA_Mi8MTV3_FAB",
    "LOP_SLA_Mi8MT_Cargo",
    "LOP_SLA_Mi8MTV3_UPK23"
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_preset_oJets = [
];

/*------------------------------------------------------------
    --- ENEMY MILITIA CLASSNAMES ---
    Lightweight soldier classnames the game will pick from randomly as sector defenders.
    Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies.
------------------------------------------------------------*/

// Militia soldiers
KPLIB_preset_oMilUnits = [
    "LOP_SLA_Infantry_Rifleman",
    "LOP_SLA_Infantry_Rifleman_2",
    "LOP_SLA_Infantry_GL",
    "LOP_SLA_Infantry_Officer",
    "LOP_SLA_Infantry_TL",
    "LOP_SLA_Infantry_SL",
    "LOP_SLA_Infantry_AA",
    "LOP_SLA_Infantry_AT",
    "LOP_SLA_Infantry_Marksman",
    "LOP_SLA_Infantry_Corpsman",
    "LOP_SLA_Infantry_Engineer"
];

// Militia vehicles
KPLIB_preset_oMilVeh = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_UAZ",
    "LOP_SLA_UAZ_Open"
];

/*------------------------------------------------------------
    --- ENEMY BATTLEGROUPS CLASSNAMES ---
    All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements.
------------------------------------------------------------*/

// Vehicles for high enemy combat readiness (aggression level).
KPLIB_preset_oBattleVeh = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_Ural_open",
    "LOP_SLA_Ural",
    "LOP_SLA_BTR60",
    "LOP_SLA_BMP1",
    "LOP_SLA_ZSU234",
    "LOP_SLA_T72BA",
    "LOP_SLA_T72BB",
    "LOP_SLA_Mi8MTV3_FAB",
    "LOP_SLA_Mi8MT_Cargo",
    "LOP_SLA_Mi8MTV3_UPK23"
];

// Vehicles for lower enemy combat readiness (aggression levels).
KPLIB_preset_oBattleVehLow = [
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_Ural",
    "LOP_SLA_BTR70",
    "LOP_SLA_BMP1D",
    "LOP_SLA_BMP2D",
    "LOP_SLA_ZSU234",
    "LOP_SLA_Mi8MTV3_UPK23",
    "LOP_SLA_Mi8MT_Cargo"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also able to hold at least 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_preset_oBattleTransports = [
    "LOP_SLA_Ural_open",
    "LOP_SLA_Ural",
    "LOP_SLA_Mi8MTV3_FAB",
    "LOP_SLA_Mi8MT_Cargo",
    "LOP_SLA_Mi8MTV3_UPK23"
];

/*------------------------------------------------------------
    --- ENEMY SECONDARY OBJECTIVE CLASSNAMES ---
    Classnames which are used by the creation of secondary objectives.
------------------------------------------------------------*/

// Unarmed MRAP
KPLIB_preset_oMrap = "LOP_SLA_UAZ";
// Armed MRAP
KPLIB_preset_oMrapArmed = "LOP_SLA_UAZ_DshKM";
// Transport helicopter
KPLIB_preset_oTransportHeli = "LOP_SLA_Mi8MT_Cargo";
// Transport truck
KPLIB_preset_oTransportTruck = "LOP_SLA_Ural";
// Logistic truck (has to be able to transport reouce crates)
KPLIB_preset_oLogiTruck = "LOP_SLA_Ural_open";                          //-> Has to be able to transport resource crates! =>["LOP_SLA_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
// Fuel truck
KPLIB_preset_oFuelTruck = "RHS_Ural_Fuel_MSV_01";                       //Ural-4320 Fuel
// Ammo truck
KPLIB_preset_oAmmoTruck = "rhs_gaz66_ammo_msv";                         //GAZ-66 Ammo
// Fuel container
KPLIB_preset_oFuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";      //Taru Fuel Pod
// Ammo container
KPLIB_preset_oAmmoContainer = "Land_Pod_Heli_Transport_04_ammo_F";      //Taru Ammo Pod
// Enemy flag
KPLIB_preset_oFlag = "lop_Flag_sla_F";
