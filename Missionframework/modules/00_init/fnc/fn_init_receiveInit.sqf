/*
	KPLIB_fnc_init_receiveInit
	
	File: fn_init_receiveInit.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-25
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Receive data from the server initialization and split the packages accordingly.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

// Wait until the server has send the packages
waitUntil {!isNil "KPLIB_preset_bluforPackage"};
waitUntil {!isNil "KPLIB_preset_opforPackage"};
waitUntil {!isNil "KPLIB_preset_resistancePackage"};
waitUntil {!isNil "KPLIB_preset_civiliansPackage"};
waitUntil {!isNil "KPLIB_preset_collectionsPackage"};

// Process Blufor package
KPLIB_preset_sidePlayers = KPLIB_preset_bluforPackage select 0;
KPLIB_preset_colorPlayers = KPLIB_preset_bluforPackage select 1;
KPLIB_preset_fobBuilding = KPLIB_preset_bluforPackage select 2;
KPLIB_preset_fobBox = KPLIB_preset_bluforPackage select 3;
KPLIB_preset_fobTruck = KPLIB_preset_bluforPackage select 4;
KPLIB_preset_arsenalBox = KPLIB_preset_bluforPackage select 5;
KPLIB_preset_respawnTruck = KPLIB_preset_bluforPackage select 6;
KPLIB_preset_potato = KPLIB_preset_bluforPackage select 7;
KPLIB_preset_crewman = KPLIB_preset_bluforPackage select 8;
KPLIB_preset_hpilot = KPLIB_preset_bluforPackage select 9;
KPLIB_preset_jpilot = KPLIB_preset_bluforPackage select 10;
KPLIB_preset_addHeli = KPLIB_preset_bluforPackage select 11;
KPLIB_preset_addBoat = KPLIB_preset_bluforPackage select 12;
KPLIB_preset_logiTruck = KPLIB_preset_bluforPackage select 13;
KPLIB_preset_smallStorage = KPLIB_preset_bluforPackage select 14;
KPLIB_preset_largeStorage = KPLIB_preset_bluforPackage select 15;
KPLIB_preset_recycleBuilding = KPLIB_preset_bluforPackage select 16;
KPLIB_preset_airBuilding = KPLIB_preset_bluforPackage select 17;
KPLIB_preset_heliSlot = KPLIB_preset_bluforPackage select 18;
KPLIB_preset_planeSlot = KPLIB_preset_bluforPackage select 19;
KPLIB_preset_sCrate = KPLIB_preset_bluforPackage select 20;
KPLIB_preset_aCrate = KPLIB_preset_bluforPackage select 21;
KPLIB_preset_fCrate = KPLIB_preset_bluforPackage select 22;
KPLIB_preset_infantry = KPLIB_preset_bluforPackage select 23;
KPLIB_preset_lightVeh = KPLIB_preset_bluforPackage select 24;
KPLIB_preset_heavyVeh = KPLIB_preset_bluforPackage select 25;
KPLIB_preset_airVeh = KPLIB_preset_bluforPackage select 26;
KPLIB_preset_staticVeh = KPLIB_preset_bluforPackage select 27;
KPLIB_preset_buildings = KPLIB_preset_bluforPackage select 28;
KPLIB_preset_supportVeh = KPLIB_preset_bluforPackage select 29;
KPLIB_preset_uavs = KPLIB_preset_bluforPackage select 30;
KPLIB_preset_lightSquad = KPLIB_preset_bluforPackage select 31;
KPLIB_preset_heavySquad = KPLIB_preset_bluforPackage select 32;
KPLIB_preset_atSquad = KPLIB_preset_bluforPackage select 33;
KPLIB_preset_aaSquad = KPLIB_preset_bluforPackage select 34;
KPLIB_preset_reconSquad = KPLIB_preset_bluforPackage select 35;
KPLIB_preset_paraSquad = KPLIB_preset_bluforPackage select 36;
KPLIB_preset_lockedVeh = KPLIB_preset_bluforPackage select 37;
KPLIB_preset_alphabet = KPLIB_preset_bluforPackage select 38;
KPLIB_preset_squads = KPLIB_preset_bluforPackage select 39;

// Process Opfor package
KPLIB_preset_sideEnemy = KPLIB_preset_opforPackage select 0;
KPLIB_preset_colorEnemy = KPLIB_preset_opforPackage select 1;
KPLIB_preset_colorEnemyAct = KPLIB_preset_opforPackage select 2;
KPLIB_preset_oOfficer = KPLIB_preset_opforPackage select 3;
KPLIB_preset_oSquadLeader = KPLIB_preset_opforPackage select 4;
KPLIB_preset_oTeamLeader = KPLIB_preset_opforPackage select 5;
KPLIB_preset_oSentry = KPLIB_preset_opforPackage select 6;
KPLIB_preset_oRifleman = KPLIB_preset_opforPackage select 7;
KPLIB_preset_oRpg = KPLIB_preset_opforPackage select 8;
KPLIB_preset_oGrenadier = KPLIB_preset_opforPackage select 9;
KPLIB_preset_oMachinegunner = KPLIB_preset_opforPackage select 10;
KPLIB_preset_oHeavygunner = KPLIB_preset_opforPackage select 11;
KPLIB_preset_oMarksman = KPLIB_preset_opforPackage select 12;
KPLIB_preset_oSharpshooter = KPLIB_preset_opforPackage select 13;
KPLIB_preset_oSniper = KPLIB_preset_opforPackage select 14;
KPLIB_preset_oAt = KPLIB_preset_opforPackage select 15;
KPLIB_preset_oAa = KPLIB_preset_opforPackage select 16;
KPLIB_preset_oMedic = KPLIB_preset_opforPackage select 17;
KPLIB_preset_oEngineer = KPLIB_preset_opforPackage select 18;
KPLIB_preset_oParatrooper = KPLIB_preset_opforPackage select 19;
KPLIB_preset_oVehicles = KPLIB_preset_opforPackage select 20;
KPLIB_preset_oVehiclesLow = KPLIB_preset_opforPackage select 21;
KPLIB_preset_oChoppers = KPLIB_preset_opforPackage select 22;
KPLIB_preset_oJets = KPLIB_preset_opforPackage select 23;
KPLIB_preset_oMilUnits = KPLIB_preset_opforPackage select 24;
KPLIB_preset_oMilVeh = KPLIB_preset_opforPackage select 25;
KPLIB_preset_oBattleVeh = KPLIB_preset_opforPackage select 26;
KPLIB_preset_oBattleVehLow = KPLIB_preset_opforPackage select 27;
KPLIB_preset_oBattleTransports = KPLIB_preset_opforPackage select 28;
KPLIB_preset_oMrap = KPLIB_preset_opforPackage select 29;
KPLIB_preset_oMrapArmed = KPLIB_preset_opforPackage select 30;
KPLIB_preset_oTransportHeli = KPLIB_preset_opforPackage select 31;
KPLIB_preset_oTransportTruck = KPLIB_preset_opforPackage select 32;
KPLIB_preset_oLogiTruck = KPLIB_preset_opforPackage select 33;
KPLIB_preset_oFuelTruck = KPLIB_preset_opforPackage select 34;
KPLIB_preset_oAmmoTruck = KPLIB_preset_opforPackage select 35;
KPLIB_preset_oFuelContainer = KPLIB_preset_opforPackage select 36;
KPLIB_preset_oAmmoContainer = KPLIB_preset_opforPackage select 37;
KPLIB_preset_oFlag = KPLIB_preset_opforPackage select 38;
KPLIB_preset_oInfantry = KPLIB_preset_opforPackage select 39;
KPLIB_preset_oStandard = KPLIB_preset_opforPackage select 40;
KPLIB_preset_oInfKill = KPLIB_preset_opforPackage select 41;
KPLIB_preset_oTankKill = KPLIB_preset_opforPackage select 42;
KPLIB_preset_oAirKill = KPLIB_preset_opforPackage select 43;
KPLIB_preset_oAirVeh = KPLIB_preset_opforPackage select 44;
KPLIB_preset_oLandVeh = KPLIB_preset_opforPackage select 45;

// Process resistance package
KPLIB_preset_sideResistance = KPLIB_preset_resistancePackage select 0;
KPLIB_preset_colorResistance = KPLIB_preset_resistancePackage select 1;
KPLIB_preset_rUnits = KPLIB_preset_resistancePackage select 2;
KPLIB_preset_rVehicles = KPLIB_preset_resistancePackage select 3;
KPLIB_preset_rTransports = KPLIB_preset_resistancePackage select 4;
KPLIB_preset_rWeapons1 = KPLIB_preset_resistancePackage select 5;
KPLIB_preset_rWeapons2 = KPLIB_preset_resistancePackage select 6;
KPLIB_preset_rWeapons3 = KPLIB_preset_resistancePackage select 7;
KPLIB_preset_rUniforms1 = KPLIB_preset_resistancePackage select 8;
KPLIB_preset_rUniforms2 = KPLIB_preset_resistancePackage select 9;
KPLIB_preset_rUniforms3 = KPLIB_preset_resistancePackage select 10;
KPLIB_preset_rVests1 = KPLIB_preset_resistancePackage select 11;
KPLIB_preset_rVests2 = KPLIB_preset_resistancePackage select 12;
KPLIB_preset_rVests3 = KPLIB_preset_resistancePackage select 13;
KPLIB_preset_rHeadgear1 = KPLIB_preset_resistancePackage select 14;
KPLIB_preset_rHeadgear2 = KPLIB_preset_resistancePackage select 15;
KPLIB_preset_rHeadgear3 = KPLIB_preset_resistancePackage select 16;
KPLIB_preset_rFacegear = KPLIB_preset_resistancePackage select 17;

// Process civilian package
KPLIB_preset_cUnits = KPLIB_preset_civiliansPackage select 0;
KPLIB_preset_cVehicles = KPLIB_preset_civiliansPackage select 1;

// Process collections package
KPLIB_preset_buildLists = KPLIB_preset_collectionsPackage select 0;
KPLIB_preset_storages = KPLIB_preset_collectionsPackage select 1;
KPLIB_preset_crates = KPLIB_preset_collectionsPackage select 2;
KPLIB_preset_upgrBuildings = KPLIB_preset_collectionsPackage select 3;
KPLIB_preset_slotBuildings = KPLIB_preset_collectionsPackage select 4;
KPLIB_preset_allInfantryBlue = KPLIB_preset_collectionsPackage select 5;
KPLIB_preset_allLandVeh = KPLIB_preset_collectionsPackage select 6;
KPLIB_preset_allAirVeh = KPLIB_preset_collectionsPackage select 7;
KPLIB_preset_allAirBlue = KPLIB_preset_collectionsPackage select 8;
KPLIB_preset_staticClassesBlue = KPLIB_preset_collectionsPackage select 9;
KPLIB_resupply_aiSource = KPLIB_preset_collectionsPackage select 10;

// Set correct localized squad names
KPLIB_preset_squadNames = [
	localize "STR_SQUAD_LIGHT",
	localize "STR_SQUAD_RIFLE",
	localize "STR_SQUAD_AT",
	localize "STR_SQUAD_AA",
	localize "STR_SQUAD_RECON",
	localize "STR_SQUAD_PARA"
];

true
