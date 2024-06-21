
private _start = diag_ticktime;
if (isServer) then {
    ["----- Server starts preset initialization -----", "PRESETS"] call KPLIB_fnc_log;
    ["Not found vehicles listed below are not an issue in general. It just sorts out vehicles from not loaded mods.", "PRESETS"] call KPLIB_fnc_log;
    ["Only if you e.g. use a CUP preset and you get messages about missing CUP classes, then check your loaded mods.", "PRESETS"] call KPLIB_fnc_log;
};

switch (KPLIB_presetPlayer) do {
    case  1: {[] call compile preprocessFileLineNumbers "presets\players\apex.sqf";};
    case  2: {[] call compile preprocessFileLineNumbers "presets\players\baf_mtp.sqf";};
    case  3: {[] call compile preprocessFileLineNumbers "presets\players\baf_des.sqf";};
    case  4: {[] call compile preprocessFileLineNumbers "presets\players\bwmod.sqf";};
    case  5: {[] call compile preprocessFileLineNumbers "presets\players\bwmod_des.sqf";};
    case  6: {[] call compile preprocessFileLineNumbers "presets\players\rhs_usaf_wdl.sqf";};
    case  7: {[] call compile preprocessFileLineNumbers "presets\players\rhs_usaf_des.sqf";};
    case  8: {[] call compile preprocessFileLineNumbers "presets\players\rhs_afrf.sqf";};
    case  9: {[] call compile preprocessFileLineNumbers "presets\players\gm_west.sqf";};
    case 10: {[] call compile preprocessFileLineNumbers "presets\players\gm_west_win.sqf";};
    case 11: {[] call compile preprocessFileLineNumbers "presets\players\gm_east.sqf";};
    case 12: {[] call compile preprocessFileLineNumbers "presets\players\gm_east_win.sqf";};
    case 13: {[] call compile preprocessFileLineNumbers "presets\players\csat.sqf";};
    case 14: {[] call compile preprocessFileLineNumbers "presets\players\csat_apex.sqf";};
    case 15: {[] call compile preprocessFileLineNumbers "presets\players\unsung.sqf";};
    case 16: {[] call compile preprocessFileLineNumbers "presets\players\cup_baf_desert.sqf";};
    case 17: {[] call compile preprocessFileLineNumbers "presets\players\cup_baf_woodland.sqf";};
    case 18: {[] call compile preprocessFileLineNumbers "presets\players\cup_usmc_desert.sqf";};
    case 19: {[] call compile preprocessFileLineNumbers "presets\players\cup_usmc_woodland.sqf";};
    case 20: {[] call compile preprocessFileLineNumbers "presets\players\cup_usa_desert.sqf";};
    case 21: {[] call compile preprocessFileLineNumbers "presets\players\cup_usa_woodland.sqf";};
    case 22: {[] call compile preprocessFileLineNumbers "presets\players\cup_cdf.sqf";};
    case 23: {[] call compile preprocessFileLineNumbers "presets\players\cup_acr_desert.sqf";};
    case 24: {[] call compile preprocessFileLineNumbers "presets\players\cup_acr_woodland.sqf";};
    case 25: {[] call compile preprocessFileLineNumbers "presets\players\cup_chdkz.sqf";};
    case 26: {[] call compile preprocessFileLineNumbers "presets\players\cup_sla.sqf";};
    case 27: {[] call compile preprocessFileLineNumbers "presets\players\cup_takistan.sqf";};
    case 28: {[] call compile preprocessFileLineNumbers "presets\players\sfp_wdl.sqf";};
    case 29: {[] call compile preprocessFileLineNumbers "presets\players\sfp_des.sqf";};
    case 30: {[] call compile preprocessFileLineNumbers "presets\players\enoch.sqf";};
    default  {[] call compile preprocessFileLineNumbers "presets\players\custom.sqf";};
};

switch (KPLIB_presetEnemy) do {
    case  1: {[] call compile preprocessFileLineNumbers "presets\enemies\apex.sqf";};
    case  2: {[] call compile preprocessFileLineNumbers "presets\enemies\rhs_afrf.sqf";};
    case  3: {[] call compile preprocessFileLineNumbers "presets\enemies\takistan.sqf";};
    case  4: {[] call compile preprocessFileLineNumbers "presets\enemies\islamic_state.sqf";};
    case  5: {[] call compile preprocessFileLineNumbers "presets\enemies\sla.sqf";};
    case  6: {[] call compile preprocessFileLineNumbers "presets\enemies\aaf.sqf";};
    case  7: {[] call compile preprocessFileLineNumbers "presets\enemies\nato.sqf";};
    case  8: {[] call compile preprocessFileLineNumbers "presets\enemies\gm_west.sqf";};
    case  9: {[] call compile preprocessFileLineNumbers "presets\enemies\gm_west_win.sqf";};
    case 10: {[] call compile preprocessFileLineNumbers "presets\enemies\gm_east.sqf";};
    case 11: {[] call compile preprocessFileLineNumbers "presets\enemies\gm_east_win.sqf";};
    case 12: {[] call compile preprocessFileLineNumbers "presets\enemies\unsung.sqf";};
    case 13: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_sla.sqf";};
    case 14: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_takistan.sqf";};
    case 15: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_chdkz.sqf";};
    case 16: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_afrf_msv.sqf";};
    case 17: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_afrf_msv_modern.sqf";};
    case 18: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_cdf.sqf";};
    case 19: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_baf_desert.sqf";};
    case 20: {[] call compile preprocessFileLineNumbers "presets\enemies\cup_baf_woodland.sqf";};
    default  {[] call compile preprocessFileLineNumbers "presets\enemies\custom.sqf";};
};

switch (KPLIB_presetResistance) do {
    case  1: {[] call compile preprocessFileLineNumbers "presets\resistance\apex.sqf";};
    case  2: {[] call compile preprocessFileLineNumbers "presets\resistance\rhs_gref.sqf";};
    case  3: {[] call compile preprocessFileLineNumbers "presets\resistance\middle_eastern.sqf";};
    case  4: {[] call compile preprocessFileLineNumbers "presets\resistance\racs.sqf";};
    case  5: {[] call compile preprocessFileLineNumbers "presets\resistance\germany.sqf";};
    case  6: {[] call compile preprocessFileLineNumbers "presets\resistance\unsung.sqf";};
    case  7: {[] call compile preprocessFileLineNumbers "presets\resistance\cup_takistan.sqf";};
    case  8: {[] call compile preprocessFileLineNumbers "presets\resistance\cup_napa.sqf";};
    default  {[] call compile preprocessFileLineNumbers "presets\resistance\custom.sqf";};
};

switch (KPLIB_presetCivilians) do {
    case  1: {[] call compile preprocessFileLineNumbers "presets\civilians\apex.sqf";};
    case  2: {[] call compile preprocessFileLineNumbers "presets\civilians\middle_eastern.sqf";};
    case  3: {[] call compile preprocessFileLineNumbers "presets\civilians\rds_civ.sqf";};
    case  4: {[] call compile preprocessFileLineNumbers "presets\civilians\germany.sqf";};
    case  5: {[] call compile preprocessFileLineNumbers "presets\civilians\unsung.sqf";};
    case  6: {[] call compile preprocessFileLineNumbers "presets\civilians\cup_takistan.sqf";};
    case  7: {[] call compile preprocessFileLineNumbers "presets\civilians\cup_cherno.sqf";};
    default  {[] call compile preprocessFileLineNumbers "presets\civilians\custom.sqf";};
};

if (typeName KPLIB_b_mobileRespawn == typeName "") then {
    KPLIB_b_mobileRespawns = [KPLIB_b_mobileRespawn];
} else {
    KPLIB_b_mobileRespawns = KPLIB_b_mobileRespawn;
};

// Prices for the blufor infantry squads (supplies, ammo, fuel)
KPLIB_b_allSquads = [
    [KPLIB_b_squadLight,50,0,0],
    [KPLIB_b_squadInf,75,25,0],
    [KPLIB_b_squadAT,50,50,0],
    [KPLIB_b_squadAA,50,50,0],
    [KPLIB_b_squadRecon,75,0,0],
    [KPLIB_b_squadPara,50,0,0]
];

// Squad names for build menu
KPLIB_b_squadNames = [
    localize "STR_LIGHT_RIFLE_SQUAD",
    localize "STR_RIFLE_SQUAD",
    localize "STR_AT_SQUAD",
    localize "STR_AA_SQUAD",
    localize "STR_RECON_SQUAD",
    localize "STR_PARA_SQUAD"
];

/*
    Checking all preset arrays for missing mods and sort out not available classnames
*/
// Blufor
KPLIB_b_basic_uniform           = getText (configFile >> "CfgVehicles" >> (KPLIB_b_infantry#0)#0 >> "uniformClass");
KPLIB_b_infantry                = KPLIB_b_infantry                  select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_vehLight                = KPLIB_b_vehLight                  select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_vehHeavy                = KPLIB_b_vehHeavy                  select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_vehAir                  = KPLIB_b_vehAir                    select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_vehStatic               = KPLIB_b_vehStatic                 select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_objectsDeco             = KPLIB_b_objectsDeco               select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_vehSupport              = KPLIB_b_vehSupport                select {[( _x select 0)] call KPLIB_fnc_checkClass};
KPLIB_b_squadLight              = KPLIB_b_squadLight                select {[_x] call KPLIB_fnc_checkClass};
KPLIB_b_squadInf                = KPLIB_b_squadInf                  select {[_x] call KPLIB_fnc_checkClass};
KPLIB_b_squadAT                 = KPLIB_b_squadAT                   select {[_x] call KPLIB_fnc_checkClass};
KPLIB_b_squadAA                 = KPLIB_b_squadAA                   select {[_x] call KPLIB_fnc_checkClass};
KPLIB_b_squadRecon              = KPLIB_b_squadRecon                select {[_x] call KPLIB_fnc_checkClass};
KPLIB_b_squadPara               = KPLIB_b_squadPara                 select {[_x] call KPLIB_fnc_checkClass};
private _elite_crosscheck = (KPLIB_b_vehLight + KPLIB_b_vehHeavy + KPLIB_b_vehAir + KPLIB_b_vehStatic + KPLIB_b_vehSupport) apply {(_x#0);};
KPLIB_b_vehToUnlock             = KPLIB_b_vehToUnlock               arrayIntersect _elite_crosscheck;

// Opfor
KPLIB_o_militiaInfantry         = KPLIB_o_militiaInfantry           select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_militiaVehicles         = KPLIB_o_militiaVehicles           select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_armyVehicles            = KPLIB_o_armyVehicles              select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_armyVehiclesLight       = KPLIB_o_armyVehiclesLight         select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_battleGrpVehicles       = KPLIB_o_battleGrpVehicles         select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_battleGrpVehiclesLight  = KPLIB_o_battleGrpVehiclesLight    select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_troopTransports         = KPLIB_o_troopTransports           select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_helicopters             = KPLIB_o_helicopters               select {[_x] call KPLIB_fnc_checkClass};
KPLIB_o_planes                  = KPLIB_o_planes                    select {[_x] call KPLIB_fnc_checkClass};

// Resistance
KPLIB_r_units                   = KPLIB_r_units                     select {[_x] call KPLIB_fnc_checkClass};
KPLIB_r_vehicles                = KPLIB_r_vehicles                  select {[_x] call KPLIB_fnc_checkClass};

// Civilians
KPLIB_c_units                   = KPLIB_c_units                     select {[_x] call KPLIB_fnc_checkClass};
KPLIB_c_vehicles                = KPLIB_c_vehicles                  select {[_x] call KPLIB_fnc_checkClass};

// Misc
KPLIB_transportConfigs          = KPLIB_transportConfigs            select {[_x select 0] call KPLIB_fnc_checkClass};
KPLIB_aiResupplySources         = KPLIB_aiResupplySources           select {[_x] call KPLIB_fnc_checkClass};

/*
    Fetch arrays with only classnames from the blufor preset build arrays
    Beware that all classnames are converted to lowercase. Important for e.g. `in` checks, as it's case-sensitive.
*/
KPLIB_b_inf_classes             = KPLIB_b_infantry                  apply {toLowerANSI (_x select 0)};
KPLIB_b_light_classes           = KPLIB_b_vehLight                  apply {toLowerANSI (_x select 0)};
KPLIB_b_heavy_classes           = KPLIB_b_vehHeavy                  apply {toLowerANSI (_x select 0)};
KPLIB_b_air_classes             = KPLIB_b_vehAir                    apply {toLowerANSI (_x select 0)};
KPLIB_b_static_classes          = KPLIB_b_vehStatic                 apply {toLowerANSI (_x select 0)};
KPLIB_b_deco_classes            = KPLIB_b_objectsDeco               apply {toLowerANSI (_x select 0)};
KPLIB_b_support_classes         = KPLIB_b_vehSupport                apply {toLowerANSI (_x select 0)};
KPLIB_transport_classes         = KPLIB_transportConfigs            apply {toLowerANSI (_x select 0)};

KPLIB_b_inf_classes append (KPLIB_b_squadLight + KPLIB_b_squadInf + KPLIB_b_squadAT + KPLIB_b_squadAA + KPLIB_b_squadRecon + KPLIB_b_squadPara);
KPLIB_b_inf_classes             = KPLIB_b_inf_classes               apply {toLowerANSI _x};
KPLIB_b_inf_classes             = KPLIB_b_inf_classes               arrayIntersect KPLIB_b_inf_classes;

/*
    Opfor squad compositions
*/
KPLIB_o_squadStd        = [KPLIB_o_squadLeader, KPLIB_o_medic, KPLIB_o_machinegunner, KPLIB_o_heavyGunner, KPLIB_o_medic, KPLIB_o_marksman, KPLIB_o_grenadier, KPLIB_o_riflemanLAT];
KPLIB_o_squadInf        = [KPLIB_o_squadLeader, KPLIB_o_medic, KPLIB_o_machinegunner, KPLIB_o_heavyGunner, KPLIB_o_heavyGunner, KPLIB_o_marksman, KPLIB_o_sharpshooter, KPLIB_o_sniper];
KPLIB_o_squadTank       = [KPLIB_o_squadLeader, KPLIB_o_medic, KPLIB_o_machinegunner, KPLIB_o_riflemanLAT, KPLIB_o_riflemanLAT, KPLIB_o_atSpecialist, KPLIB_o_atSpecialist, KPLIB_o_atSpecialist];
KPLIB_o_squadAir        = [KPLIB_o_squadLeader, KPLIB_o_medic, KPLIB_o_machinegunner, KPLIB_o_riflemanLAT, KPLIB_o_riflemanLAT, KPLIB_o_aaSpecialist, KPLIB_o_aaSpecialist, KPLIB_o_aaSpecialist];

/*
    Liberation specific collections
*/
KPLIB_buildList         = [[], KPLIB_b_infantry, KPLIB_b_vehLight, KPLIB_b_vehHeavy, KPLIB_b_vehAir, KPLIB_b_vehStatic, KPLIB_b_objectsDeco, KPLIB_b_vehSupport, KPLIB_b_allSquads];
KPLIB_crates            = [KPLIB_b_crateSupply, KPLIB_b_crateAmmo, KPLIB_b_crateFuel];
KPLIB_airSlots          = [KPLIB_b_slotHeli, KPLIB_b_slotPlane];
KPLIB_storageBuildings  = [KPLIB_b_smallStorage, KPLIB_b_largeStorage];
KPLIB_upgradeBuildings  = [KPLIB_b_logiStation, KPLIB_b_airControl, KPLIB_b_slotHeli, KPLIB_b_slotPlane];
KPLIB_aiResupplySources append KPLIB_b_mobileRespawns;
KPLIB_aiResupplySources append [KPLIB_b_potato01, KPLIB_b_arsenal];

KPLIB_crates            = KPLIB_crates              apply {toLowerANSI _x};
KPLIB_airSlots          = KPLIB_airSlots            apply {toLowerANSI _x};
KPLIB_storageBuildings  = KPLIB_storageBuildings    apply {toLowerANSI _x};
KPLIB_upgradeBuildings  = KPLIB_upgradeBuildings    apply {toLowerANSI _x};
KPLIB_aiResupplySources = KPLIB_aiResupplySources   apply {toLowerANSI _x};

/*
    Classname collections
*/
// All land vehicle classnames
KPLIB_allLandVeh_classes = [[], [KPLIB_b_potato01]] select (KPLIB_b_potato01 isKindOf "Air");;
{
    KPLIB_allLandVeh_classes append _x;
} forEach [
    KPLIB_o_militiaVehicles apply {toLowerANSI _x},
    KPLIB_o_armyVehicles apply {toLowerANSI _x},
    KPLIB_o_armyVehiclesLight apply {toLowerANSI _x},
    KPLIB_o_battleGrpVehicles apply {toLowerANSI _x},
    KPLIB_o_battleGrpVehiclesLight apply {toLowerANSI _x},
    KPLIB_o_troopTransports apply {toLowerANSI _x},
    KPLIB_b_light_classes,
    KPLIB_b_heavy_classes,
    KPLIB_b_support_classes select {_x isKindOf "Car" || _x isKindOf "Tank"}
];
KPLIB_allLandVeh_classes = KPLIB_allLandVeh_classes arrayIntersect KPLIB_allLandVeh_classes;

// All air vehicle classnames
KPLIB_allAirVeh_classes = [[], [KPLIB_b_potato01]] select (KPLIB_b_potato01 isKindOf "Air");
{
    KPLIB_allAirVeh_classes append _x;
} forEach [KPLIB_o_helicopters apply {toLowerANSI _x}, KPLIB_o_planes apply {toLowerANSI _x}, KPLIB_b_air_classes, KPLIB_b_support_classes select {_x isKindOf "Air"}];

// All blufor vehicle (land and air) classnames
KPLIB_b_allVeh_classes = [];
{
    KPLIB_b_allVeh_classes append _x;
} forEach [KPLIB_b_light_classes, KPLIB_b_heavy_classes, KPLIB_b_air_classes, KPLIB_b_static_classes, KPLIB_b_support_classes];

// All opfor vehicle (land and air) classnames
KPLIB_o_allVeh_classes  = [];
{
    KPLIB_o_allVeh_classes append _x;
} forEach [
    KPLIB_o_militiaVehicles,
    KPLIB_o_armyVehicles,
    KPLIB_o_armyVehiclesLight,
    KPLIB_o_battleGrpVehicles,
    KPLIB_o_battleGrpVehiclesLight,
    KPLIB_o_troopTransports,
    KPLIB_o_helicopters,
    KPLIB_o_planes
];
KPLIB_o_allVeh_classes = KPLIB_o_allVeh_classes apply {toLowerANSI _x};
KPLIB_o_allVeh_classes = KPLIB_o_allVeh_classes arrayIntersect KPLIB_o_allVeh_classes;

// All regular opfor soldier classnames
KPLIB_o_inf_classes = [KPLIB_o_sentry, KPLIB_o_rifleman, KPLIB_o_grenadier, KPLIB_o_squadLeader, KPLIB_o_teamLeader, KPLIB_o_marksman, KPLIB_o_machinegunner, KPLIB_o_heavyGunner, KPLIB_o_medic, KPLIB_o_riflemanLAT, KPLIB_o_atSpecialist, KPLIB_o_aaSpecialist, KPLIB_o_officer, KPLIB_o_sharpshooter, KPLIB_o_sniper,KPLIB_o_engineer];
KPLIB_o_inf_classes = KPLIB_o_inf_classes apply {toLowerANSI _x};

/*
    Vehicle type permission arrays
*/
KPLIB_typeLightClasses = +KPLIB_b_light_classes;
KPLIB_typeHeavyClasses = +KPLIB_b_heavy_classes;
KPLIB_typeAirClasses   = +KPLIB_b_air_classes;
{
    switch (true) do {
        case (_x isKindOf "Tank"):  {KPLIB_typeHeavyClasses    pushBack _x};
        case (_x isKindOf "Air"):   {KPLIB_typeAirClasses      pushBack _x};
        default                     {KPLIB_typeLightClasses    pushBack _x};
    };
} forEach (KPLIB_b_support_classes + [toLowerANSI KPLIB_b_potato01]);

// Military alphabet used for FOBs and convoys
KPLIB_militaryAlphabet = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-Ray", "Yankee", "Zulu"];

// Misc variables
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
KPLIB_sarWreck = "Land_Wreck_Heli_Attack_01_F";
KPLIB_sarFire = "test_EmptyObjectForFireBig";

if (isServer) then {[format ["----- Preset initialization finished. Time needed: %1 seconds -----", diag_ticktime - _start], "PRESETS"] call KPLIB_fnc_log;};
