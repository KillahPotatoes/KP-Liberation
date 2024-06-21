scriptName "sector_manager";

waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {!isNil "KPLIB_vehicle_to_military_base_links"};
waitUntil {!isNil "KPLIB_sectors_player"};
waitUntil {KPLIB_saveLoaded};

private _vehicle_unlock_markers = [];
private _cfg = configFile >> "cfgVehicles";

{
    _x params ["_vehicle", "_base"];
    private _marker = createMarkerLocal [format ["vehicleunlockmarker%1", _base], [(markerpos _base) select 0, ((markerpos _base) select 1) + 125]];
    _marker setMarkerTextLocal (getText (_cfg >> _vehicle >> "displayName"));
    _marker setMarkerColorLocal KPLIB_color_enemy;
    _marker setMarkerTypeLocal "mil_pickup";
    _vehicle_unlock_markers pushback [_marker, _base];
} forEach KPLIB_vehicle_to_military_base_links;

private _sector_count = -1;

uiSleep 1;

while {true} do {
    waitUntil {
        uiSleep 1;
        count KPLIB_sectors_player != _sector_count
    };

    {_x setMarkerColorLocal KPLIB_color_enemy;} forEach (KPLIB_sectors_all - KPLIB_sectors_player);
    {_x setMarkerColorLocal KPLIB_color_player;} forEach KPLIB_sectors_player;

    {
        _x params ["_marker", "_base"];
        _marker setMarkerColorLocal ([KPLIB_color_enemy, KPLIB_color_player] select (_base in KPLIB_sectors_player));
    } forEach _vehicle_unlock_markers;
    _sector_count = count KPLIB_sectors_player;
};
