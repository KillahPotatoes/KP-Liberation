params ["_vehicle"];

if (KP_liberation_civrep_debug > 0) then {[format ["checkVehicle called on: %1 - Vehicle: %2", debug_source, _vehicle], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

if (isNil "KP_liberation_cr_vehicles") then {
    KP_liberation_cr_vehicles = [];
};

if (((typeOf _vehicle) in civilian_vehicles) && !(_vehicle in KP_liberation_cr_vehicles)) then {
    if (KP_liberation_civrep_debug > 0) then {[format ["Vehicle was stolen by: %1", debug_source], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};
    [0] remoteExec ["KPLIB_fnc_crGlobalMsg"];
    [KP_liberation_cr_vehicle_penalty, true] remoteExec ["F_cr_changeCR", 2];

    KP_liberation_cr_vehicles pushBack _vehicle;
    publicVariable "KP_liberation_cr_vehicles";

    stats_civilian_vehicles_seized = stats_civilian_vehicles_seized + 1;
    publicVariable "stats_civilian_vehicles_seized";
};

if (KP_liberation_civrep_debug > 0) then {[format ["checkVehicle finished on: %1 - Stolen vehicle list: %2", debug_source, KP_liberation_cr_vehicles], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};
