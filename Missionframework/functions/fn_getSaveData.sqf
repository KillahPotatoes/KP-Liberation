/*
    File: fn_getSaveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2020-08-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gather current session data for saving.

    Parameter(s):
        NONE

    Returns:
        Save data [ARRAY]
*/

private _objectsToSave = [];
private _resourceStorages = [];
private _aiGroups = [];

private _allObjects = [];
private _allStorages = [];
private _allMines = [];
private _allCrates = [];

// Get all blufor groups
private _allBlueGroups = allGroups select {
    (side _x == KPLIB_side_player) &&                 // Only blufor groups
    {isNull objectParent (leader _x)} &&                // Make sure it's an infantry group
    {!(((units _x) select {alive _x}) isEqualTo [])}    // At least one unit has to be alive
};

// Fetch all objects and AI groups near each FOB
private ["_fobPos", "_fobObjects", "_grpUnits", "_fobMines"];
{
    _fobPos = _x;
    _fobObjects = (_fobPos nearObjects (KPLIB_range_fob * 1.2)) select {
        ((toLower (typeof _x)) in KPLIB_classnamesToSave) &&        // Exclude classnames which are not in the presets
        {alive _x} &&                                               // Exclude dead or broken objects
        {getObjectType _x >= 8} &&                                  // Exclude preplaced terrain objects
        {speed _x < 5} &&                                           // Exclude moving objects (like civilians driving through)
        {isNull attachedTo _x} &&                                   // Exclude attachTo'd objects
        {((getpos _x) select 2) < 10} &&                            // Exclude hovering helicopters and the like
        {!(_x getVariable ["KPLIB_edenObject", false])} &&  // Exclude all objects placed via editor in mission.sqm
        {!(_x getVariable ["KPLIB_preplaced", false])} &&   // Exclude preplaced (e.g. little birds from carrier)
        {!((toLower (typeOf _x)) in KPLIB_crates)}                  // Exclude storage crates (those are handled separately)
    };

    _allObjects = _allObjects + (_fobObjects select {!((toLower (typeOf _x)) in KPLIB_storageBuildings)});
    _allStorages = _allStorages + (_fobObjects select {(_x getVariable ["KPLIB_storage_type",-1]) == 0});

    // Process all groups near this FOB
    {
        // Get only living AI units of the group by excluding possible POWs currently in the player group
        _grpUnits = (units _x) select {!(isPlayer _x) && (alive _x) && !((typeOf _x) in KPLIB_o_inf_classes) && !((typeOf _x) in KPLIB_o_militiaInfantry)};
        // Add to save array
        _aiGroups pushBack [getPosATL (leader _x), (_grpUnits apply {typeOf _x})];
    } forEach (_allBlueGroups select {(_fobPos distance2D (leader _x)) < (KPLIB_range_fob * 1.2)});

    // Save all mines around FOB
    _fobMines = allMines inAreaArray [_fobPos, KPLIB_range_fob * 1.2, KPLIB_range_fob * 1.2];
    _allMines append (_fobMines apply {[
        getPosWorld _x,
        [vectorDirVisual _x, vectorUpVisual _x],
        typeOf _x,
        _x mineDetectedBy KPLIB_side_player
    ]});
} forEach KPLIB_sectors_fob;

// Save all fetched objects
private ["_savedPos", "_savedVecDir", "_savedVecUp", "_class", "_hasCrew"];
{
    // Position data
    _savedPos = getPosWorld _x;
    _savedVecDir = vectorDirVisual _x;
    _savedVecUp = vectorUpVisual _x;
    _class = typeOf _x;
    _hasCrew = false;

    // Determine if vehicle is crewed
    if ((toLower _class) in KPLIB_b_allVeh_classes) then {
        if (({!isPlayer _x} count (crew _x) ) > 0) then {
            _hasCrew = true;
        };
    };

    // Only save player side, seized or captured objects
    if (
        (!(_class in KPLIB_c_vehicles) || {_x getVariable ["KPLIB_seized", false]}) &&
        (!((toLower _class) in KPLIB_o_allVeh_classes) || {_x getVariable ["KPLIB_captured", false]})
    ) then {
        _objectsToSave pushBack [_class, _savedPos, _savedVecDir, _savedVecUp, _hasCrew];
    };
} forEach _allObjects;

// Save all storages and resources
private ["_supplyValue", "_ammoValue", "_fuelValue"];
{
    // Position data
    _savedPos = getPosWorld _x;
    _savedVecDir = vectorDirVisual _x;
    _savedVecUp = vectorUpVisual _x;
    _class = typeOf _x;

    // Resource variables
    _supplyValue = 0;
    _ammoValue = 0;
    _fuelValue = 0;

    // Sum all stored resources of current storage
    {
        switch ((typeOf _x)) do {
            case KPLIB_b_crateSupply: {_supplyValue = _supplyValue + (_x getVariable ["KPLIB_crate_value",0]);};
            case KPLIB_b_crateAmmo: {_ammoValue = _ammoValue + (_x getVariable ["KPLIB_crate_value",0]);};
            case KPLIB_b_crateFuel: {_fuelValue = _fuelValue + (_x getVariable ["KPLIB_crate_value",0]);};
            default {[format ["Invalid object (%1) at storage area", (typeOf _x)], "ERROR"] call KPLIB_fnc_log;};
        };
    } forEach (attachedObjects _x);

    // Add to saving with corresponding resource values
    _resourceStorages pushBack [_class, _savedPos, _savedVecDir, _savedVecUp, _supplyValue, _ammoValue, _fuelValue];
} forEach _allStorages;

// Save crates at blufor sectors which spawn crates on activation
{
    _allCrates append (
        ((nearestObjects [markerPos _x, KPLIB_crates, KPLIB_range_sectorCapture]) select {isNull attachedTo _x}) apply {
            [typeOf _x, _x getVariable ["KPLIB_crate_value", 0], getPosATL _x]
        }
    );
} forEach (KPLIB_sectors_player select {_x in KPLIB_sectors_factory || _x in KPLIB_sectors_city});

// Pack all stats in one array
private _stats = [
    stats_ammo_produced,
    stats_ammo_spent,
    stats_blufor_soldiers_killed,
    stats_blufor_soldiers_recruited,
    stats_blufor_teamkills,
    stats_blufor_vehicles_built,
    stats_blufor_vehicles_killed,
    stats_civilian_buildings_destroyed,
    stats_civilian_vehicles_killed,
    stats_civilian_vehicles_killed_by_players,
    stats_civilian_vehicles_seized,
    stats_civilians_healed,
    stats_civilians_killed,
    stats_civilians_killed_by_players,
    stats_fobs_built,
    stats_fobs_lost,
    stats_fuel_produced,
    stats_fuel_spent,
    stats_hostile_battlegroups,
    stats_ieds_detonated,
    stats_opfor_killed_by_players,
    stats_opfor_soldiers_killed,
    stats_opfor_vehicles_killed,
    stats_opfor_vehicles_killed_by_players,
    stats_player_deaths,
    stats_playtime,
    stats_prisoners_captured,
    stats_readiness_earned,
    stats_reinforcements_called,
    stats_resistance_killed,
    stats_resistance_teamkills,
    stats_resistance_teamkills_by_players,
    stats_secondary_objectives,
    stats_sectors_liberated,
    stats_sectors_lost,
    stats_potato_respawns,
    stats_supplies_produced,
    stats_supplies_spent,
    stats_vehicles_recycled
];

// Pack the weights in one array
private _weights = [
    infantry_weight,
    armor_weight,
    air_weight
];

// Pack the save data in the save array
[
    KPLIB_version,
    date,
    _objectsToSave,
    _resourceStorages,
    _stats,
    _weights,
    _aiGroups,
    KPLIB_sectors_player,
    KPLIB_enemyReadiness,
    KPLIB_sectors_fob,
    KPLIB_permissions,
    KPLIB_vehicle_to_military_base_links,
    KPLIB_civ_rep,
    KPLIB_clearances,
    KPLIB_guerilla_strength,
    KPLIB_logistics,
    KPLIB_production,
    KPLIB_production_markers,
    resources_intel,
    _allMines,
    _allCrates,
    KPLIB_sectorTowers
] // return
