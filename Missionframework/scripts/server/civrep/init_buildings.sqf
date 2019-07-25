if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] init_buildings.sqf initialising on: %1", debug_source];};

switch (worldName) do {
    case "Chernarus": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\chernarus.sqf"};
    case "Enoch": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\enoch.sqf"};
    case "gm_weferlingen_summer": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\gm_weferlingen_summer.sqf"};
    case "gm_weferlingen_winter": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\gm_weferlingen_winter.sqf"};
    case "lythium": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\lythium.sqf"};
    case "Malden": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\malden.sqf"};
    case "panthera3": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\panthera3.sqf"};
    case "pja310": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\pja310.sqf"};
    case "Sara": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\sara.sqf"};
    case "song_bin_tanh": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\song_bin_tanh.sqf"};
    case "Takistan": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\takistan.sqf"};
    case "Tanoa": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\tanoa.sqf"};
    case "WL_Rosche": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\wl_rosche.sqf"};
    case "xcam_taunus": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\xcam_taunus.sqf"};
    default {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\altis.sqf"};
};

KP_liberation_cr_sectorbuildings = [];

{
    KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_capture;

{
    KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_bigtown;

sleep 1;

if (KP_liberation_civrep_debug > 0) then {
    diag_log format ["[KP LIBERATION] [CIVREP] init_buildings.sqf finished on: %1 - Listing sectors with buildings amount...", debug_source];
    {
        diag_log format ["[KP LIBERATION] [CIVREP] %1: %2", markerText (_x select 0), (_x select 1)];
    } forEach KP_liberation_cr_sectorbuildings;
};
