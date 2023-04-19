params ["_sector"];

if (_sector in KPLIB_sectors_capital || _sector in KPLIB_sectors_city) then {
    private _penalty = 0;

    {
        if (_sector == (_x select 0)) exitWith {_penalty = (_x select 1) - ([_sector] call F_cr_getBuildings)};
    } forEach KPLIB_cr_sectorbuildings;

    stats_civilian_buildings_destroyed = stats_civilian_buildings_destroyed + _penalty;

    _penalty = _penalty * KPLIB_cr_building_penalty;

    if (_penalty > 0) then {
        [1, [(_penalty / KPLIB_cr_building_penalty)]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
    } else {
        _penalty = 0;
    };

    if (_sector in KPLIB_sectors_capital) then {
        [(2 * KPLIB_cr_sector_gain - _penalty), false] spawn F_cr_changeCR;
    } else {
        [(KPLIB_cr_sector_gain - _penalty), false] spawn F_cr_changeCR;
    };

    [format ["Civilian sector %1 (%2) captured. Penalty: %3", markerText _sector, _sector, _penalty], "CIVREP"] call KPLIB_fnc_log;
};
