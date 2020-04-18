private _start = diag_tickTime;
if (isServer) then {["init_buildings.sqf initialising...", "CIVREP"] call KPLIB_fnc_log;};

switch (worldName) do {
    case "Chernarus": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\chernarus.sqf"};
    case "cup_chernarus_A3": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\chernarus2020.sqf"};
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

if (isServer) then {[format ["init_buildings.sqf finished. Time needed: %1 seconds", diag_ticktime - _start], "CIVREP"] call KPLIB_fnc_log;};
if (KP_liberation_civrep_debug > 0) then {
    {
        [format ["%1: %2", markerText (_x select 0), (_x select 1)], "CIVREP"] call KPLIB_fnc_log;
    } forEach KP_liberation_cr_sectorbuildings;
};
