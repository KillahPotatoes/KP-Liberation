#include "script_component.hpp"
/*
    KP Liberation NATO Preset

    File: nato.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-17
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        NATO preset file which contains only vanilla assets.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/

params [
    ["_isFriendly", false, [false]]
];


/*------------------------------------------------------------
    --- GENERAL SETTINGS ---
    General stuff like side and colors.
------------------------------------------------------------*/

// Name of the used/created army in this preset
KPLIB_PRST_SETVAR("name", "NATO");

// Military alphabet
KPLIB_PRST_CAT_BEGIN("alphabet");
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Alpha";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Bravo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Charlie";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Delta";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Echo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Foxtrot";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Golf";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Hotel";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "India";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Juliet";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Kilo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Lima";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Mike";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "November";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Oscar";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Papa";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Quebec";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Romeo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Sierra";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Tango";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Uniform";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Victor";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Whiskey";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "X-Ray";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Yankee";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Zulu";


/*------------------------------------------------------------
    --- IMPORTANT UNIQUE CLASSNAMES ---
    Each of these has to be unique.
    Don't use any of the entered classnames anywhere else in the preset.
------------------------------------------------------------*/

// The building defined to unlock FOB air vehicle availability.
KPLIB_PRST_SETVAR("airBuilding", "Land_Radar_Small_F");
// This is the virtual arsenal as portable supply crate.
KPLIB_PRST_SETVAR("arsenalBox", "B_supplyCrate_F");
// This defines the ammunition resource crates.
KPLIB_PRST_SETVAR("crateAmmo", "B_CargoNet_01_ammo_F");
// This defines the fuel resource crates.
KPLIB_PRST_SETVAR("crateFuel", "CargoNet_01_barrels_F");
// This defines the supply resource crates.
KPLIB_PRST_SETVAR("crateSupply", "CargoNet_01_box_F");
// This is the FOB as a container.
KPLIB_PRST_SETVAR("fobBox", "B_Slingload_01_Cargo_F");
// This is the main FOB HQ building.
KPLIB_PRST_SETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
// This is the FOB as a vehicle..
KPLIB_PRST_SETVAR("fobTruck", "B_Truck_01_box_F");
// The building defined to unlock FOB logistic functionalities.
KPLIB_PRST_SETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
// This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIB_PRST_SETVAR("potato", "B_Heli_Transport_03_unarmed_F");
// This is the mobile respawn (and medical) truck.
KPLIB_PRST_SETVAR("respawnTruck", "B_Truck_01_medical_F");
// The helipad used to increase the GLOBAL rotary-wing cap.
KPLIB_PRST_SETVAR("slotHeli", "Land_HelipadSquare_F");
// The hangar used to increase the GLOBAL fixed-wing cap.
KPLIB_PRST_SETVAR("slotJet", "Land_TentHangar_V1_F");
// The large storage area for resources.
KPLIB_PRST_SETVAR("storageLarge", "ContainmentArea_01_sand_F");
// The small storage area for resources.
KPLIB_PRST_SETVAR("storageSmall", "ContainmentArea_02_sand_F");


/*------------------------------------------------------------
    --- ADDITIONAL MECHANICS CLASSNAMES ---
    Classnames of additional mechanics/functionalities in the mission.
    The entered classnames can be reused somewhere else in the preset.
------------------------------------------------------------*/

// These are the boats which spawn in the boat racks of the Liberty.
KPLIB_PRST_SETVAR("addBoat", "B_Boat_Transport_01_F");
// These are the additional helicopter which spawns at the Operation Base.
KPLIB_PRST_SETVAR("addHeli", "B_Heli_Light_01_F");
// These are the trucks which are used in the logistic convoy system.
KPLIB_PRST_SETVAR("logiTruck", "B_Truck_01_transport_F");
// Static Mortar Classname
KPLIB_PRST_SETVAR("mortar", "B_Mortar_01_F");
// Static AA Classname
KPLIB_PRST_SETVAR("staticAa", "B_static_AA_F");
// Static Big AA Classname
KPLIB_PRST_SETVAR("staticAaBig", "B_SAM_System_03_F");
// Static Big AA Radar Classname
KPLIB_PRST_SETVAR("staticAaBigRadar", "B_Radar_System_01_F");
// Static AT Classname
KPLIB_PRST_SETVAR("staticAt", "B_static_AT_F");


/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// AA Specialist
KPLIB_PRST_SETVAR("rsAntiAir", "B_soldier_AA_F");
// AT Specialist
KPLIB_PRST_SETVAR("rsAntiTank", "B_soldier_AT_F");
// Autorifleman
KPLIB_PRST_SETVAR("rsAutorifleMan", "B_soldier_AR_F");
// Helicopter crew
KPLIB_PRST_SETVAR("rsCrewmanHeli", "B_helicrew_F");
// Vehicle crew
KPLIB_PRST_SETVAR("rsCrewmanVeh", "B_crew_F");
// Engineer
KPLIB_PRST_SETVAR("rsEngineer", "B_engineer_F");
// Grenadier
KPLIB_PRST_SETVAR("rsGrenadier", "B_Soldier_GL_F");
// Heavy Gunner
KPLIB_PRST_SETVAR("rsHeavyGunner", "B_HeavyGunner_F");
// Helicopter pilot
KPLIB_PRST_SETVAR("rsPilotHeli", "B_Helipilot_F");
// Jet pilot
KPLIB_PRST_SETVAR("rsPilotJet", "B_Fighter_Pilot_F");
// Light Anti Tank
KPLIB_PRST_SETVAR("rsLightAt", "B_soldier_LAT_F");
// Marksman
KPLIB_PRST_SETVAR("rsMarksman", "B_soldier_M_F");
// Medic
KPLIB_PRST_SETVAR("rsMedic", "B_medic_F");
// Officer
KPLIB_PRST_SETVAR("rsOfficer", "B_officer_F");
// Paratrooper
KPLIB_PRST_SETVAR("rsParatrooper", "B_soldier_PG_F");
// Rifleman
KPLIB_PRST_SETVAR("rsRifleman", "B_Soldier_F");
// Sharpshooter
KPLIB_PRST_SETVAR("rsSharpshooter", "B_Sharpshooter_F");
// Squad Leader
KPLIB_PRST_SETVAR("rsSquadLeader", "B_Soldier_SL_F");
// Survivor (no weapons, etc.)
KPLIB_PRST_SETVAR("rsSurvivor", "B_Survivor_F");
// Team Leader
KPLIB_PRST_SETVAR("rsTeamLeader", "B_Soldier_TL_F");


/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// Special Forces Diver
KPLIB_PRST_SETVAR("sfDiver", "B_diver_F");
// Special Forces Explosive Specialist
KPLIB_PRST_SETVAR("sfExplosive", "B_recon_exp_F");
// Special Forces Light Anti Tank
KPLIB_PRST_SETVAR("sfLightAt", "B_recon_LAT_F");
// Special Forces Marksman
KPLIB_PRST_SETVAR("sfMarksman", "B_recon_M_F");
// Special Forces Medic
KPLIB_PRST_SETVAR("sfMedic", "B_recon_medic_F");
// Special Forces Rifleman
KPLIB_PRST_SETVAR("sfRifleman", "B_recon_F");
// Special Forces Sharpshooter
KPLIB_PRST_SETVAR("sfSharpshooter", "B_Recon_Sharpshooter_F");
// Special Forces Sniper
KPLIB_PRST_SETVAR("sfSniper", "B_sniper_F");
// Special Forces Spotter
KPLIB_PRST_SETVAR("sfSpotter", "B_spotter_F");
// Special Forces Teamleader
KPLIB_PRST_SETVAR("sfTeamLeader", "B_recon_TL_F");


/*------------------------------------------------------------
    --- BUILDABLE OBJECTS ARRAYS ---
    The arrays below are used to determine what can be build.
    Format: "classname", supplies, ammunition, fuel
    Example: KPLIB_PRST_CAT_ADD("vehLightUnarmed", "B_MRAP_01_F", 100, 0, 50);
    The above example adds the NATO Hunter MRAP to the unarmed light vehicles list
    with the costs of 100 supplies, 0 ammunition and 50 fuel.
------------------------------------------------------------*/

// Infantry units
KPLIB_PRST_CAT_BEGIN("units");
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsRifleman"),               20,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsLightAt"),                30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsGrenadier"),              25,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAutorifleMan"),           25,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsHeavyGunner"),            35,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsMarksman"),               30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAntiTank"),               50,   10,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsAntiAir"),                50,   10,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsMedic"),                  30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsEngineer"),               30,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsParatrooper"),            20,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsCrewmanVeh"),             10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsCrewmanHeli"),            10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsPilotHeli"),              10,    0,    0);
KPLIB_PRST_CAT_ADD("units", KPLIB_PRST_GETVAR("rsPilotJet"),               10,    0,    0);
KPLIB_PRST_CAT_END("units");

// Special Forces units
KPLIB_PRST_CAT_BEGIN("specOps");
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfRifleman"),                50,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfLightAt"),                 80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfMarksman"),                80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfMedic"),                   80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfExplosive"),               80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSpotter"),                 80,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSharpshooter"),            85,    0,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfSniper"),                 100,   10,    0);
KPLIB_PRST_CAT_ADD("specOps", KPLIB_PRST_GETVAR("sfDiver"),                  100,    0,    0);
KPLIB_PRST_CAT_END("specOps");

// Light vehicles (unarmed)
KPLIB_PRST_CAT_BEGIN("vehLightUnarmed");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "B_Quadbike_01_F",                      50,    0,   25);   // Quadbike
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "B_LSV_01_unarmed_F",                   75,    0,   50);   // Prowler
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "B_MRAP_01_F",                         100,    0,   50);   // Hunter
KPLIB_PRST_CAT_END("vehLightUnarmed");

// Light vehicles (armed)
KPLIB_PRST_CAT_BEGIN("vehLightArmed");
KPLIB_PRST_CAT_ADD("vehLightArmed", "B_LSV_01_armed_F",                       75,   40,   50);   // Prowler (HMG)
KPLIB_PRST_CAT_ADD("vehLightArmed", "B_LSV_01_AT_F",                          75,   50,   50);   // Prowler (AT)
KPLIB_PRST_CAT_ADD("vehLightArmed", "B_MRAP_01_hmg_F",                       100,   40,   50);   // Hunter (HMG)
KPLIB_PRST_CAT_ADD("vehLightArmed", "B_MRAP_01_gmg_F",                       100,   60,   50);   // Hunter (GMG)
KPLIB_PRST_CAT_END("vehLightArmed");

// Transport trucks
KPLIB_PRST_CAT_BEGIN("vehTrans");
KPLIB_PRST_CAT_ADD("vehTrans", "B_Truck_01_transport_F",                     125,    0,   75);   // HEMTT Transport
KPLIB_PRST_CAT_ADD("vehTrans", "B_Truck_01_covered_F",                       125,    0,   75);   // HEMTT Transport (Covered)
KPLIB_PRST_CAT_END("vehTrans");

// Boats
KPLIB_PRST_CAT_BEGIN("boats");
KPLIB_PRST_CAT_ADD("boats", "B_Boat_Transport_01_F",                         100,    0,   25);   // Assault Boat
KPLIB_PRST_CAT_ADD("boats", "B_Boat_Armed_01_minigun_F",                     200,   80,   75);   // Speedboat with Minigun
KPLIB_PRST_CAT_ADD("boats", "B_SDV_01_F",                                     50,    0,   50);   // SDV
KPLIB_PRST_CAT_END("boats");

// APCs
KPLIB_PRST_CAT_BEGIN("vehHeavyApc");
KPLIB_PRST_CAT_ADD("vehHeavyApc", "B_APC_Wheeled_01_cannon_F",               200,   75,  125);    // AMV-7 Marshall
KPLIB_PRST_CAT_ADD("vehHeavyApc", "B_APC_Tracked_01_rcws_F",                 300,  100,  150);    // IFV-6c Panther
KPLIB_PRST_CAT_END("vehHeavyApc");

// Heavy vehicles
KPLIB_PRST_CAT_BEGIN("vehHeavy");
KPLIB_PRST_CAT_ADD("vehHeavy", "B_AFV_Wheeled_01_cannon_F",                  300,  250,  180);    // Rhino MGS
KPLIB_PRST_CAT_ADD("vehHeavy", "B_AFV_Wheeled_01_up_cannon_F",               400,  300,  200);    // Rhino MGS UP
KPLIB_PRST_CAT_ADD("vehHeavy", "B_MBT_01_cannon_F",                          400,  300,  200);    // M2A1 Slammer
KPLIB_PRST_CAT_ADD("vehHeavy", "B_MBT_01_TUSK_F",                            500,  350,  225);    // M2A4 Slammer UP
KPLIB_PRST_CAT_END("vehHeavy");

// Anti Air vehicles
KPLIB_PRST_CAT_BEGIN("vehAntiAir");
KPLIB_PRST_CAT_ADD("vehAntiAir", "B_APC_Tracked_01_AA_F",                    300,  250,  175);    // IFV-6a Cheetah
KPLIB_PRST_CAT_END("vehAntiAir");

// Artillery vehicles
KPLIB_PRST_CAT_BEGIN("vehArty");
KPLIB_PRST_CAT_ADD("vehArty", "B_MBT_01_arty_F",                             600, 1250,  300);    // M4 Scorcher
KPLIB_PRST_CAT_ADD("vehArty", "B_MBT_01_mlrs_F",                             800, 1750,  400);    // M5 Sandstorm MLRS
KPLIB_PRST_CAT_END("vehArty");

// Transport Helicopters
KPLIB_PRST_CAT_BEGIN("heliTrans");
KPLIB_PRST_CAT_ADD("heliTrans", "B_Heli_Light_01_F",                         200,    0,  100);    // MH-9 Hummingbird
KPLIB_PRST_CAT_ADD("heliTrans", "B_Heli_Transport_01_F",                     250,   80,  150);    // UH-80 Ghost Hawk
KPLIB_PRST_CAT_ADD("heliTrans", "B_Heli_Transport_01_camo_F",                250,   80,  150);    // UH-80 Ghost Hawk (Camo)
KPLIB_PRST_CAT_ADD("heliTrans", "B_Heli_Transport_03_F",                     300,   80,  175);    // CH-67 Huron (Armed)
KPLIB_PRST_CAT_END("heliTrans");

// Attack Helicopters
KPLIB_PRST_CAT_BEGIN("heliAttack");
KPLIB_PRST_CAT_ADD("heliAttack", "B_Heli_Light_01_dynamicLoadout_F",         200,  100,  100);    // AH-9 Pawnee
KPLIB_PRST_CAT_ADD("heliAttack", "B_Heli_Attack_01_dynamicLoadout_F",        500,  400,  200);    // AH-99 Blackfoot
KPLIB_PRST_CAT_ADD("heliAttack", "B_T_VTOL_01_armed_F",                      750, 1500,  500);    // V-44 X Blackfish (Armed)
KPLIB_PRST_CAT_END("heliAttack");

// Transport Planes
KPLIB_PRST_CAT_BEGIN("planeTrans");
KPLIB_PRST_CAT_ADD("planeTrans", "B_T_VTOL_01_infantry_F",                   750,    0,  500);    // V-44 X Blackfish (Infantry)
KPLIB_PRST_CAT_ADD("planeTrans", "B_T_VTOL_01_vehicle_F",                    750,    0,  500);    // V-44 X Blackfish (Vehicle)
KPLIB_PRST_CAT_END("planeTrans");

// Jets
KPLIB_PRST_CAT_BEGIN("jets");
KPLIB_PRST_CAT_ADD("jets", "B_Plane_CAS_01_dynamicLoadout_F",               1000,  800,  400);    // A-164 Wipeout (CAS)
KPLIB_PRST_CAT_ADD("jets", "B_Plane_Fighter_01_F",                          1500, 1750,  450);    // F/A-181 Black Wasp II
KPLIB_PRST_CAT_ADD("jets", "B_Plane_Fighter_01_Stealth_F",                  1500, 1750,  450);    // F/A-181 Black Wasp II (Stealth)
KPLIB_PRST_CAT_END("jets");

// Static Defenses
KPLIB_PRST_CAT_BEGIN("statics");
KPLIB_PRST_CAT_ADD("statics", "B_HMG_01_F",                                   25,   40,    0);    // Mk30 HMG .50
KPLIB_PRST_CAT_ADD("statics", "B_HMG_01_high_F",                              25,   40,    0);    // Mk30 HMG .50 (Raised)
KPLIB_PRST_CAT_ADD("statics", "B_GMG_01_F",                                   35,   60,    0);    // Mk32 GMG 20mm
KPLIB_PRST_CAT_ADD("statics", "B_GMG_01_high_F",                              35,   60,    0);    // Mk32 GMG 20mm (Raised)
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAa"),                  50,  100,    0);    // Static Titan Launcher (AA)
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAt"),                  50,  100,    0);    // Static Titan Launcher (AT)
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("mortar"),                    80,  150,    0);    // Mk6 Mortar
KPLIB_PRST_CAT_ADD("statics", KPLIB_PRST_GETVAR("staticAaBig"),              250,  300,    0);    // MIM-145 Defender
KPLIB_PRST_CAT_END("statics");

// Logistic/Utility vehicles and objects
KPLIB_PRST_CAT_BEGIN("logistic");
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("arsenalBox"),              100,  200,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("respawnTruck"),            200,    0,  100);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("fobBox"),                  300,  500,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("fobTruck"),                300,  500,   75);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("storageSmall"),              0,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("storageLarge"),              0,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("logiBuilding"),            250,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("airBuilding"),            1000,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("slotHeli"),                250,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("slotJet"),                 500,    0,    0);
KPLIB_PRST_CAT_ADD("logistic", KPLIB_PRST_GETVAR("staticAaBigRadar"),        250,    0,    0);    // AN/MPQ-105 Radar
KPLIB_PRST_CAT_ADD("logistic", "B_Truck_01_Repair_F",                        325,    0,   75);    // HEMTT Repair
KPLIB_PRST_CAT_ADD("logistic", "B_Truck_01_fuel_F",                          125,    0,  275);    // HEMTT Fuel
KPLIB_PRST_CAT_ADD("logistic", "B_Truck_01_ammo_F",                          125,  200,   75);    // HEMTT Ammo
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Repair_F",                    275,    0,    0);    // Huron Repair Container
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Fuel_F",                       75,    0,  200);    // Huron Fuel Container
KPLIB_PRST_CAT_ADD("logistic", "B_Slingload_01_Ammo_F",                       75,  200,    0);    // Huron Ammo Container
KPLIB_PRST_CAT_END("logistic");

// Decorative Objects
KPLIB_PRST_CAT_BEGIN("deco");
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_House_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Patrol_V1_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Cargo_Tower_V1_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_NATO_F",                                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_US_F",                                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_UK_F",                                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_White_F",                                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_house_V1_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Medevac_HQ_V1_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Flag_RedCrystal_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_open_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "CamoNet_BLUFOR_big_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PortableLight_single_F",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PortableLight_double_F",                      0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampSolar_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampHalogen_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampStreet_small_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_LampAirport_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HelipadCircle_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HelipadRescue_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_blue_F",                   0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_green_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "PortableHelipadLight_01_red_F",                    0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingChair_V1_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingChair_V2_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CampingTable_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_altis_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_stratis_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "MapBoard_seismic_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Pallet_MilBoxes_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_open_empty_F",                       0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_open_full_F",                        0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_PaperBox_closed_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_DieselGroundPowerUnit_01_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_ToolTrolley_02_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Workbench_01_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_blue_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_khaki_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_01_yellow_F",                         0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_GasTank_02_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BarrelWater_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BarrelWater_grey_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_WaterBarrel_F",                               0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_WaterTank_F",                                 0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Round_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Short_F",                            0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Long_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_Corner_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagFence_End_F",                              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Small_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Large_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_BagBunker_Tower_F",                           0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_1_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_3_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrier_5_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall4_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall6_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall_corner_F",                       0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierWall_corridor_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_HBarrierTower_F",                             0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncBarrierMedium_F",                          0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncBarrierMedium4_F",                         0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Concrete_SmallWall_4m_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Concrete_SmallWall_8m_F",                     0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncShelter_F",                                0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncWall1_F",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_CncWall4_F",                                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilitaryArea_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilAreaSmall_F",                  0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Sign_WarningMilitaryVehicles_F",              0,    0,    0);
KPLIB_PRST_CAT_ADD("deco", "Land_Razorwire_F",                                 0,    0,    0);
KPLIB_PRST_CAT_END("deco");


/*------------------------------------------------------------
    --- LOCKED VEHICLE CLASSNAMES ---
    Classnames of vehicles which shouldn't be available from the start.
    The listed classnames have to be also listed in one of the build categories above.
    You can leave this category empty, but leave the line with BEGIN untouched.
------------------------------------------------------------*/

KPLIB_PRST_CAT_BEGIN("lockedVehPl");
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_AFV_Wheeled_01_cannon_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_AFV_Wheeled_01_up_cannon_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_MBT_01_arty_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_MBT_01_mlrs_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_Heli_Attack_01_dynamicLoadout_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_T_VTOL_01_armed_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_Plane_Fighter_01_F";
(KPLIB_PRST_GETVAR("lockedVehPl")) pushBack "B_Plane_Fighter_01_Stealth_F";


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checked"), true];
