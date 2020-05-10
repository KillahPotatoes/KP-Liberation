params ["_liberated_sector"];

private _combat_readiness_increase = 0;
switch (true) do {
    case (_liberated_sector in sectors_bigtown):    {_combat_readiness_increase = floor (random 10) * KPLIB_difficulty_modifier;};
    case (_liberated_sector in sectors_capture):    {_combat_readiness_increase = floor (random 6) * KPLIB_difficulty_modifier;};
    case (_liberated_sector in sectors_military):   {_combat_readiness_increase = 5 + (floor (random 11)) * KPLIB_difficulty_modifier;};
    case (_liberated_sector in sectors_factory):    {_combat_readiness_increase = 3 + (floor (random 7)) * KPLIB_difficulty_modifier;};
    case (_liberated_sector in sectors_tower):      {_combat_readiness_increase = floor (random 4);};
};

combat_readiness = combat_readiness + _combat_readiness_increase;
if (combat_readiness > 100.0 && KPLIB_difficulty_modifier <= 2.0) then {combat_readiness = 100.0};
stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;

[_liberated_sector, 0] remoteExecCall ["remote_call_sector"];
blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
stats_sectors_liberated = stats_sectors_liberated + 1;

reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

if (_liberated_sector in sectors_factory) then {
    {
        if (_liberated_sector in _x) exitWith {KPLIB_production = KPLIB_production - [_x];};
    } forEach KPLIB_production;

    private _sectorFacilities = (KPLIB_production_markers select {_liberated_sector == (_x select 0)}) select 0;
    KPLIB_production pushBack [
        markerText _liberated_sector,
        _liberated_sector,
        1,
        [],
        _sectorFacilities select 1,
        _sectorFacilities select 2,
        _sectorFacilities select 3,
        3,
        KPLIB_production_interval,
        0,
        0,
        0
    ];
};

[_liberated_sector] spawn F_cr_liberatedSector;

if ((random 100) <= KPLIB_cr_wounded_chance || (count blufor_sectors) == 1) then {
    [_liberated_sector] spawn civrep_wounded_civs;
};

asymm_blocked_sectors pushBack [_liberated_sector, time];
publicVariable "asymm_blocked_sectors";

[] spawn check_victory_conditions;

sleep 1;

[] spawn KPLIB_fnc_doSave;

sleep 45;

if (KPLIB_endgame == 0) then {
    if (
        !(_liberated_sector in sectors_tower)
        && {
            (random (150 / (KPLIB_difficulty_modifier * KPLIB_csat_aggressivity))) < (combat_readiness - 15)
            || _liberated_sector in sectors_bigtown
        }
        && {[] call KPLIB_fnc_getOpforCap < KPLIB_battlegroup_cap}
    ) then {
        [_liberated_sector, (random 100) < 45] spawn spawn_battlegroup;
    };
};
