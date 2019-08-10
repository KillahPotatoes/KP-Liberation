waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "GRLIB_vehicle_to_military_base_links"};
waitUntil {!isNil "blufor_sectors"};
waitUntil {save_is_loaded};

private _vehicle_unlock_markers = [];
private _cfg = configFile >> "cfgVehicles";

{
    _x params ["_vehicle", "_base"];
    private _marker = createMarkerLocal [format ["vehicleunlockmarker%1", _base], [(markerpos _base) select 0, ((markerpos _base) select 1) + 125]];
    _marker setMarkerTextLocal (getText (_cfg >> _vehicle >> "displayName"));
    _marker setMarkerColorLocal GRLIB_color_enemy;
    _marker setMarkerTypeLocal "mil_pickup";
    _vehicle_unlock_markers pushback [_marker, _base];
} forEach GRLIB_vehicle_to_military_base_links;

private _sector_count = -1;

uiSleep 1;

while {true} do {
    waitUntil {
        uiSleep 1;
        count blufor_sectors != _sector_count
    };

    {_x setMarkerColorLocal GRLIB_color_enemy;} forEach (sectors_allSectors - blufor_sectors);
    {_x setMarkerColorLocal GRLIB_color_friendly;} forEach blufor_sectors;

    {
        _x params ["_marker", "_base"];
        _marker setMarkerColorLocal ([GRLIB_color_enemy, GRLIB_color_friendly] select (_base in blufor_sectors));
    } forEach _vehicle_unlock_markers;
    _sector_count = count blufor_sectors;
};
