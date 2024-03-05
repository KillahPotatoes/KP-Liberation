// TODO Refactor and create function
params [
    ["_spawn_marker", "", [""]],
    ["_infOnly", false, [false]]
];

if (GRLIB_endgame == 1) exitWith {};

_spawn_marker = [[2000, 1000] select _infOnly, 3000, false, markerPos _spawn_marker] call KPLIB_fnc_getOpforSpawnPoint;

if !(_spawn_marker isEqualTo "") then {
    GRLIB_last_battlegroup_time = diag_tickTime;

    // combat rediness and _bg_groups are seemingly not used as _bg_groups are always 0.... Its created as empty array here and never populated ..... -_-'  
    //combat_readiness = (combat_readiness - (round ((count _bg_groups) + (random (count _bg_groups))))) max 0;
    stats_hostile_battlegroups = stats_hostile_battlegroups + 1;

    // get headless to spawn directly on
    _headless_client = [] call KPLIB_fnc_getLessLoadedHC;

    if (!isNull _headless_client) then {
        ["KPLIB_battlegroupSpawn", [_spawn_marker, _infOnly, _combat_readiness], _headless_client] call CBA_fnc_targetEvent;
    } else {
        ["KPLIB_battlegroupSpawn", [_spawn_marker, _infOnly, _combat_readiness]] call CBA_fnc_localEvent;
    }
};
