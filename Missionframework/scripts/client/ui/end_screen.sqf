params [
    "_stats_ammo_produced",
    "_stats_ammo_spent",
    "_stats_blufor_soldiers_killed",
    "_stats_blufor_soldiers_recruited",
    "_stats_blufor_teamkills",
    "_stats_blufor_vehicles_built",
    "_stats_blufor_vehicles_killed",
    "_stats_civilian_buildings_destroyed",
    "_stats_civilian_vehicles_killed",
    "_stats_civilian_vehicles_killed_by_players",
    "_stats_civilian_vehicles_seized",
    "_stats_civilians_healed",
    "_stats_civilians_killed",
    "_stats_civilians_killed_by_players",
    "_stats_fobs_built",
    "_stats_fobs_lost",
    "_stats_fuel_produced",
    "_stats_fuel_spent",
    "_stats_hostile_battlegroups",
    "_stats_ieds_detonated",
    "_stats_opfor_killed_by_players",
    "_stats_opfor_soldiers_killed",
    "_stats_opfor_vehicles_killed",
    "_stats_opfor_vehicles_killed_by_players",
    "_stats_player_deaths",
    "_stats_playtime",
    "_stats_prisoners_captured",
    "_stats_readiness_earned",
    "_stats_reinforcements_called",
    "_stats_resistance_killed",
    "_stats_resistance_teamkills",
    "_stats_resistance_teamkills_by_players",
    "_stats_secondary_objectives",
    "_stats_sectors_liberated",
    "_stats_sectors_lost",
    "_stats_spartan_respawns",
    "_stats_supplies_produced",
    "_stats_supplies_spent",
    "_stats_vehicles_recycled",
    "_stats_rabbits_killed"
];

// Some preparations
if (isNil "cinematic_camera_started") then {cinematic_camera_started = false};
private _line_delay = 0.75;
private _page_delay = 5;
private _addReportLine = {
    params [
        "_control",
        "_string",
        ["_pageEnd", false, [false]]
    ];

    if (dialog) then {
        [_control, _string] call write_credit_line;
        sleep ([_line_delay, _page_delay] select _pageEnd);
    };
};
private _cleanPage = {
    if (dialog) then {
        ctrlSetText [691, ""];
        ctrlSetText [692, ""];
        ctrlSetText [693, ""];
        ctrlSetText [694, ""];
        ctrlSetText [695, ""];
        ctrlSetText [696, ""];
        sleep 2;
    };
};

// Calculate the playtime
private _playtime_days = floor (_stats_playtime / 86400);
private _playtime_hours = floor ((_stats_playtime % 86400) / 3600);
private _playtime_minutes = floor ((_stats_playtime % 3600) / 60);
private _playtime_seconds = _stats_playtime % 60;

[] spawn cinematic_camera;

private _dialog = createDialog "liberation_endscreen";
waitUntil {dialog};
if (dialog) then {sleep 3};

// Playtime line
[690, format [localize "STR_STATS_PLAYTIME", _playtime_days, _playtime_hours, _playtime_minutes, _playtime_seconds]] call _addReportLine;
if (dialog) then {sleep 3};

// First page
[691, format [localize "STR_STATS_OPFOR_K_INF", _stats_opfor_soldiers_killed]] call _addReportLine;
[692, format [localize "STR_STATS_OPFOR_K_INF_PL", _stats_opfor_killed_by_players]] call _addReportLine;
[693, format [localize "STR_STATS_OPFOR_K_VEH", _stats_opfor_vehicles_killed]] call _addReportLine;
[694, format [localize "STR_STATS_OPFOR_K_VEH_PL", _stats_opfor_vehicles_killed_by_players], true] call _addReportLine;
[] call _cleanPage;

// Second page
[691, format [localize "STR_STATS_BLUFOR_B_INF", _stats_blufor_soldiers_recruited]] call _addReportLine;
[692, format [localize "STR_STATS_BLUFOR_K_INF", _stats_blufor_soldiers_killed]] call _addReportLine;
[693, format [localize "STR_STATS_BLUFOR_B_VEH", _stats_blufor_vehicles_built]] call _addReportLine;
[694, format [localize "STR_STATS_BLUFOR_K_VEH", _stats_blufor_vehicles_killed]] call _addReportLine;
[695, format [localize "STR_STATS_BLUFOR_K_PL", _stats_player_deaths]] call _addReportLine;
[696, format [localize "STR_STATS_BLUFOR_TK", _stats_blufor_teamkills], true] call _addReportLine;
[] call _cleanPage;

// Third page
[691, format [localize "STR_STATS_GUE_K_INF", _stats_resistance_killed]] call _addReportLine;
[692, format [localize "STR_STATS_GUE_TK_INF", _stats_resistance_teamkills]] call _addReportLine;
[693, format [localize "STR_STATS_GUE_TK_INF_PL", _stats_resistance_teamkills_by_players]] call _addReportLine;
[694, format [localize "STR_STATS_CIV_K_INF", _stats_civilians_killed]] call _addReportLine;
[695, format [localize "STR_STATS_CIV_K_INF_PL", _stats_civilians_killed_by_players]] call _addReportLine;
[696, format [localize "STR_STATS_CIV_B_INF", _stats_civilians_healed], true] call _addReportLine;
[] call _cleanPage;

// Fourth page
[691, format [localize "STR_STATS_CIV_K_VEH", _stats_civilian_vehicles_killed]] call _addReportLine;
[692, format [localize "STR_STATS_CIV_K_VEH_PL", _stats_civilian_vehicles_killed_by_players]] call _addReportLine;
[693, format [localize "STR_STATS_CIV_S_VEH", _stats_civilian_vehicles_seized]] call _addReportLine;
[694, format [localize "STR_STATS_CIV_K_BUILDINGS", _stats_civilian_buildings_destroyed]] call _addReportLine;
[695, format [localize "STR_STATS_VEH_RECYCLED", _stats_vehicles_recycled], true] call _addReportLine;
[] call _cleanPage;

// Fifth page
[691, format [localize "STR_STATS_PROD_AMMO", _stats_ammo_produced]] call _addReportLine;
[692, format [localize "STR_STATS_SPENT_AMMO", _stats_ammo_spent]] call _addReportLine;
[693, format [localize "STR_STATS_PROD_FUEL", _stats_fuel_produced]] call _addReportLine;
[694, format [localize "STR_STATS_SPENT_FUEL", _stats_fuel_spent]] call _addReportLine;
[695, format [localize "STR_STATS_PROD_SUPPLY", _stats_supplies_produced]] call _addReportLine;
[696, format [localize "STR_STATS_SPENT_SUPPLY", _stats_supplies_spent], true] call _addReportLine;
[] call _cleanPage;

// Sixth page
[691, format [localize "STR_STATS_SECTORS_CAPTURED", _stats_sectors_liberated]] call _addReportLine;
[692, format [localize "STR_STATS_SECTORS_LOST", _stats_sectors_lost]] call _addReportLine;
[693, format [localize "STR_STATS_FOBS_BUILT", _stats_fobs_built]] call _addReportLine;
[694, format [localize "STR_STATS_FOBS_LOST", _stats_fobs_lost]] call _addReportLine;
[695, format [localize "STR_STATS_SIDEMISSIONS", _stats_secondary_objectives]] call _addReportLine;
[696, format [localize "STR_STATS_PRISONERS", _stats_prisoners_captured], true] call _addReportLine;
[] call _cleanPage;

// Seventh page
[691, format [localize "STR_STATS_BATTLEGROUPS", _stats_hostile_battlegroups]] call _addReportLine;
[692, format [localize "STR_STATS_REINFORCEMENTS", _stats_reinforcements_called]] call _addReportLine;
[693, format [localize "STR_STATS_COMBATREADINESS", round _stats_readiness_earned]] call _addReportLine;
[694, format [localize "STR_STATS_IEDS", _stats_ieds_detonated]] call _addReportLine;
[695, format [localize "STR_STATS_POTATO", _stats_spartan_respawns]] call _addReportLine;
[696, format [localize "STR_STATS_RABBITS", _stats_rabbits_killed], true] call _addReportLine;
[] call _cleanPage;

// Eighth page
[693, localize "STR_STATS_END1"] call _addReportLine;
[694, localize "STR_STATS_END2"] call _addReportLine;
[696, localize "STR_STATS_END3"] call _addReportLine;

waitUntil {!dialog};
cinematic_camera_started = false;
