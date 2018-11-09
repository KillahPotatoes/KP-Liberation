/*
    KPLIB_fnc_init_loadPresets

    File: fn_init_loadPresets.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads the configured preset files, checks if classnames are available with current modset and initialize global arrays which are dependent on the presets.
        Distributes the cleaned arrays to the clients.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]

    --- NOTE
    Not sure about this whole publicVariable method in the preset initialization.
    Idea was that the server will first initialize all vital stuff and distribute it to the clients.
    This would avoid that clients check all arrays for mods etc. to ensure equality in these arrays.
    As it would catch errors if a client has for example RHS loaded but not the server (due to verifySignatures 0 for example).
    --- ENDNOTE
*/

// Load Blufor preset
switch (KPLIB_param_presetPlayer) do {
    case 1: {call compile preprocessFileLineNumbers "presets\blufor\apex.sqf";};
    case 2: {call compile preprocessFileLineNumbers "presets\blufor\3cbBAF.sqf";};
    case 3: {call compile preprocessFileLineNumbers "presets\blufor\bwmod.sqf";};
    case 4: {call compile preprocessFileLineNumbers "presets\blufor\rhs_usaf.sqf";};
    case 5: {call compile preprocessFileLineNumbers "presets\blufor\rhs_usaf_d.sqf";};
    default {call compile preprocessFileLineNumbers "presets\blufor\custom.sqf";};
};

// Load Opfor preset
switch (KPLIB_param_presetEnemy) do {
    case 1: {call compile preprocessFileLineNumbers "presets\opfor\apex.sqf";};
    case 2: {call compile preprocessFileLineNumbers "presets\opfor\rhs_afrf.sqf";};
    case 3: {call compile preprocessFileLineNumbers "presets\opfor\takistan.sqf";};
    default {call compile preprocessFileLineNumbers "presets\opfor\custom.sqf";};
};

// Load resistance preset
switch (KPLIB_param_presetResistance) do {
    case 1: {call compile preprocessFileLineNumbers "presets\resistance\apex.sqf";};
    case 2: {call compile preprocessFileLineNumbers "presets\resistance\rhs_gref.sqf";};
    default {call compile preprocessFileLineNumbers "presets\resistance\custom.sqf";};
};

// Load civilian preset
switch (KPLIB_param_presetCivilian) do {
    case 1: {call compile preprocessFileLineNumbers "presets\civilians\apex.sqf";};
    case 2: {call compile preprocessFileLineNumbers "presets\civilians\takistan.sqf";};
    default {call compile preprocessFileLineNumbers "presets\civilians\custom.sqf";};
};

// Set prices for the Blufor infantry squads (supplies, ammo, fuel)
KPLIB_preset_squads = [
    [KPLIB_preset_lightSquad,200,0,0],
    [KPLIB_preset_heavySquad,300,0,0],
    [KPLIB_preset_atSquad,200,250,0],
    [KPLIB_preset_aaSquad,200,250,0],
    [KPLIB_preset_reconSquad,250,0,0],
    [KPLIB_preset_paraSquad,200,0,0]
];

// Filter Blufor preset arrays
KPLIB_preset_infantry = [KPLIB_preset_infantry] call KPLIB_fnc_init_filterMods;
KPLIB_preset_lightVeh = [KPLIB_preset_lightVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_heavyVeh = [KPLIB_preset_heavyVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_airVeh = [KPLIB_preset_airVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_staticVeh = [KPLIB_preset_staticVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_buildings = [KPLIB_preset_buildings] call KPLIB_fnc_init_filterMods;
KPLIB_preset_supportVeh = [KPLIB_preset_supportVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_lockedVeh = [KPLIB_preset_lockedVeh] call KPLIB_fnc_init_filterMods;

// Send Blufor preset to clients
KPLIB_preset_bluforPackage = [
    KPLIB_preset_sidePlayers,
    KPLIB_preset_colorPlayers,
    KPLIB_preset_fobBuilding,
    KPLIB_preset_fobBox,
    KPLIB_preset_fobTruck,
    KPLIB_preset_arsenalBox,
    KPLIB_preset_respawnTruck,
    KPLIB_preset_potato,
    KPLIB_preset_crewman,
    KPLIB_preset_hpilot,
    KPLIB_preset_jpilot,
    KPLIB_preset_addHeli,
    KPLIB_preset_addBoat,
    KPLIB_preset_logiTruck,
    KPLIB_preset_smallStorage,
    KPLIB_preset_largeStorage,
    KPLIB_preset_recycleBuilding,
    KPLIB_preset_airBuilding,
    KPLIB_preset_heliSlot,
    KPLIB_preset_planeSlot,
    KPLIB_preset_sCrate,
    KPLIB_preset_aCrate,
    KPLIB_preset_fCrate,
    KPLIB_preset_infantry,
    KPLIB_preset_lightVeh,
    KPLIB_preset_heavyVeh,
    KPLIB_preset_airVeh,
    KPLIB_preset_staticVeh,
    KPLIB_preset_buildings,
    KPLIB_preset_supportVeh,
    KPLIB_preset_uavs,
    KPLIB_preset_lightSquad,
    KPLIB_preset_heavySquad,
    KPLIB_preset_atSquad,
    KPLIB_preset_aaSquad,
    KPLIB_preset_reconSquad,
    KPLIB_preset_paraSquad,
    KPLIB_preset_lockedVeh,
    KPLIB_preset_alphabet,
    KPLIB_preset_squads
];
publicVariable "KPLIB_preset_bluforPackage";

// Filter Opfor preset arrays
KPLIB_preset_oVehicles = [KPLIB_preset_oVehicles] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oVehiclesLow = [KPLIB_preset_oVehiclesLow] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oChoppers = [KPLIB_preset_oChoppers] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oJets = [KPLIB_preset_oJets] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oMilUnits = [KPLIB_preset_oMilUnits] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oMilVeh = [KPLIB_preset_oMilVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oBattleVeh = [KPLIB_preset_oBattleVeh] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oBattleVehLow = [KPLIB_preset_oBattleVehLow] call KPLIB_fnc_init_filterMods;
KPLIB_preset_oBattleTransports = [KPLIB_preset_oBattleTransports] call KPLIB_fnc_init_filterMods;

// Prepare some additional Opfor arrays
KPLIB_preset_oInfantry = [KPLIB_preset_oSquadLeader,KPLIB_preset_oTeamLeader,KPLIB_preset_oSentry,KPLIB_preset_oRifleman,KPLIB_preset_oRpg,KPLIB_preset_oGrenadier,KPLIB_preset_oMachinegunner,KPLIB_preset_oHeavygunner,KPLIB_preset_oMarksman,KPLIB_preset_oSharpshooter,KPLIB_preset_oSniper,KPLIB_preset_oAt,KPLIB_preset_oAa,KPLIB_preset_oMedic,KPLIB_preset_oEngineer];
KPLIB_preset_oStandard = [KPLIB_preset_oSquadLeader,KPLIB_preset_oTeamLeader,KPLIB_preset_oMachinegunner,KPLIB_preset_oHeavygunner,KPLIB_preset_oMedic,KPLIB_preset_oMarksman,KPLIB_preset_oGrenadier,KPLIB_preset_oRpg];
KPLIB_preset_oInfKill = [KPLIB_preset_oSquadLeader,KPLIB_preset_oMachinegunner,KPLIB_preset_oMachinegunner,KPLIB_preset_oHeavygunner,KPLIB_preset_oMedic,KPLIB_preset_oMarksman,KPLIB_preset_oSharpshooter,KPLIB_preset_oSniper];
KPLIB_preset_oTankKill = [KPLIB_preset_oSquadLeader,KPLIB_preset_oMedic,KPLIB_preset_oMachinegunner,KPLIB_preset_oRpg,KPLIB_preset_oRpg,KPLIB_preset_oAt,KPLIB_preset_oAt,KPLIB_preset_oAt];
KPLIB_preset_oAirKill = [KPLIB_preset_oSquadLeader,KPLIB_preset_oMedic,KPLIB_preset_oMachinegunner,KPLIB_preset_oRpg,KPLIB_preset_oRpg,KPLIB_preset_oAa,KPLIB_preset_oAa,KPLIB_preset_oAa];
KPLIB_preset_oAirVeh = [];
{KPLIB_preset_oAirVeh pushBackUnique _x;} forEach (KPLIB_preset_oChoppers + KPLIB_preset_oJets);
KPLIB_preset_oLandVeh = [];
{if (_x isKindOf "Land") then {KPLIB_preset_oLandVeh pushBackUnique _x};} forEach (KPLIB_preset_oVehicles + KPLIB_preset_oVehiclesLow + KPLIB_preset_oMilVeh + KPLIB_preset_oBattleVeh + KPLIB_preset_oBattleVehLow);

// Send Opfor preset to clients
KPLIB_preset_opforPackage = [
    KPLIB_preset_sideEnemy,
    KPLIB_preset_colorEnemy,
    KPLIB_preset_colorEnemyAct,
    KPLIB_preset_oOfficer,
    KPLIB_preset_oSquadLeader,
    KPLIB_preset_oTeamLeader,
    KPLIB_preset_oSentry,
    KPLIB_preset_oRifleman,
    KPLIB_preset_oRpg,
    KPLIB_preset_oGrenadier,
    KPLIB_preset_oMachinegunner,
    KPLIB_preset_oHeavygunner,
    KPLIB_preset_oMarksman,
    KPLIB_preset_oSharpshooter,
    KPLIB_preset_oSniper,
    KPLIB_preset_oAt,
    KPLIB_preset_oAa,
    KPLIB_preset_oMedic,
    KPLIB_preset_oEngineer,
    KPLIB_preset_oParatrooper,
    KPLIB_preset_oVehicles,
    KPLIB_preset_oVehiclesLow,
    KPLIB_preset_oChoppers,
    KPLIB_preset_oJets,
    KPLIB_preset_oMilUnits,
    KPLIB_preset_oMilVeh,
    KPLIB_preset_oBattleVeh,
    KPLIB_preset_oBattleVehLow,
    KPLIB_preset_oBattleTransports,
    KPLIB_preset_oMrap,
    KPLIB_preset_oMrapArmed,
    KPLIB_preset_oTransportHeli,
    KPLIB_preset_oTransportTruck,
    KPLIB_preset_oLogiTruck,
    KPLIB_preset_oFuelTruck,
    KPLIB_preset_oAmmoTruck,
    KPLIB_preset_oFuelContainer,
    KPLIB_preset_oAmmoContainer,
    KPLIB_preset_oFlag,
    KPLIB_preset_oInfantry,
    KPLIB_preset_oStandard,
    KPLIB_preset_oInfKill,
    KPLIB_preset_oTankKill,
    KPLIB_preset_oAirKill,
    KPLIB_preset_oAirVeh,
    KPLIB_preset_oLandVeh
];
publicVariable "KPLIB_preset_opforPackage";

// Filter resistance preset arrays
KPLIB_preset_rUnits = [KPLIB_preset_rUnits] call KPLIB_fnc_init_filterMods;
KPLIB_preset_rVehicles = [KPLIB_preset_rVehicles] call KPLIB_fnc_init_filterMods;
KPLIB_preset_rTransports = [KPLIB_preset_rTransports] call KPLIB_fnc_init_filterMods;

// Send resistance preset to clients
KPLIB_preset_resistancePackage = [
    KPLIB_preset_sideResistance,
    KPLIB_preset_colorResistance,
    KPLIB_preset_rUnits,
    KPLIB_preset_rVehicles,
    KPLIB_preset_rTransports,
    KPLIB_preset_rWeapons1,
    KPLIB_preset_rWeapons2,
    KPLIB_preset_rWeapons3,
    KPLIB_preset_rUniforms1,
    KPLIB_preset_rUniforms2,
    KPLIB_preset_rUniforms3,
    KPLIB_preset_rVests1,
    KPLIB_preset_rVests2,
    KPLIB_preset_rVests3,
    KPLIB_preset_rHeadgear1,
    KPLIB_preset_rHeadgear2,
    KPLIB_preset_rHeadgear3,
    KPLIB_preset_rFacegear
];
publicVariable "KPLIB_preset_resistancePackage";

// Filter civilian preset arrays
KPLIB_preset_cUnits = [KPLIB_preset_cUnits] call KPLIB_fnc_init_filterMods;
KPLIB_preset_cVehicles = [KPLIB_preset_cVehicles] call KPLIB_fnc_init_filterMods;

// Send civilian preset to clients
KPLIB_preset_civiliansPackage = [
    KPLIB_preset_cUnits,
    KPLIB_preset_cVehicles
];
publicVariable "KPLIB_preset_civiliansPackage";

// Fetch and filter transport vehicles from transport config
KPLIB_transport_vehicles = [KPLIB_transport_config] call KPLIB_fnc_init_filterMods;

// Send transport vehicles to clients
publicVariable "KPLIB_transport_vehicles";

/*------------------------------------------------------------
    --- COLLECTION ARRAYS ---
    Arrays which combine some of the existing variables to collections.
    These are needed to speed up things in the scripts which run during the game.
------------------------------------------------------------*/

// Array with all build menu categories
KPLIB_preset_buildLists = [
    KPLIB_preset_infantry,
    KPLIB_preset_lightVeh,
    KPLIB_preset_heavyVeh,
    KPLIB_preset_airVeh,
    KPLIB_preset_staticVeh,
    KPLIB_preset_buildings,
    KPLIB_preset_supportVeh,
    KPLIB_preset_squads
];

// Array with storage areas
KPLIB_preset_storages = [
    KPLIB_preset_smallStorage,
    KPLIB_preset_largeStorage
];

// Array with all crate types
KPLIB_preset_crates = [
    KPLIB_preset_sCrate,
    KPLIB_preset_aCrate,
    KPLIB_preset_fCrate
];

// Array with all upgrade buildings
KPLIB_preset_upgrBuildings = [
    KPLIB_preset_recycleBuilding,
    KPLIB_preset_airBuilding,
    KPLIB_preset_heliSlot,
    KPLIB_preset_planeSlot
];

// Array with all slot increase buildings
KPLIB_preset_slotBuildings = [
    KPLIB_preset_heliSlot,
    KPLIB_preset_planeSlot
];

// Fetch all possible friendly infantry classnames
KPLIB_preset_allInfantryBlue = [];
{KPLIB_preset_allInfantryBlue pushBackUnique _x;} forEach (KPLIB_preset_lightSquad + KPLIB_preset_heavySquad + KPLIB_preset_atSquad + KPLIB_preset_aaSquad + KPLIB_preset_reconSquad + KPLIB_preset_paraSquad);
{KPLIB_preset_allInfantryBlue pushBackUnique (_x select 0);} forEach KPLIB_preset_infantry;

// Fetch all land vehicle classnames
KPLIB_preset_allLandVeh = [] + KPLIB_preset_oLandVeh;
{KPLIB_preset_allLandVeh pushBack (_x select 0);} forEach (KPLIB_preset_heavyVeh + KPLIB_preset_lightVeh);

// Fetch all air vehicles and a seperate array with only Blufor air vehicle classnames
KPLIB_preset_allAirVeh = [] + KPLIB_preset_oAirVeh;
KPLIB_preset_allAirBlue = [];
{KPLIB_preset_allAirVeh pushBack (_x select 0); KPLIB_preset_allAirBlue pushBack (_x select 0);} forEach KPLIB_preset_airVeh;
KPLIB_preset_allAirBlue = KPLIB_preset_allAirBlue - KPLIB_preset_uavs;

// Fetch all static classnames
KPLIB_preset_staticClassesBlue = [];
{KPLIB_preset_staticClassesBlue pushBack (_x select 0);} forEach KPLIB_preset_staticVeh;

// Expand AI resupply sources with preset classnames
KPLIB_resupply_aiSource = KPLIB_resupply_aiSource + [KPLIB_preset_arsenalBox, KPLIB_preset_respawnTruck, KPLIB_preset_potato];

// Send collections to clients
KPLIB_preset_collectionsPackage = [
    KPLIB_preset_buildLists,
    KPLIB_preset_storages,
    KPLIB_preset_crates,
    KPLIB_preset_upgrBuildings,
    KPLIB_preset_slotBuildings,
    KPLIB_preset_allInfantryBlue,
    KPLIB_preset_allLandVeh,
    KPLIB_preset_allAirVeh,
    KPLIB_preset_allAirBlue,
    KPLIB_preset_staticClassesBlue,
    KPLIB_resupply_aiSource
];
publicVariable "KPLIB_preset_collectionsPackage";

true
