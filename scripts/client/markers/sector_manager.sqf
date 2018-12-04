private [ "_sector_count", "_vehicle_unlock_markers", "_marker", "_nextbase", "_nextvehicle", "_cfg", "_nextmarker" ];

waitUntil { !isNil "sectors_allSectors" };
waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };

_vehicle_unlock_markers = [];
_cfg = configFile >> "cfgVehicles";

{
	_nextvehicle = _x select 0;
	_nextbase = _x select 1;
	_marker = createMarkerLocal [format ["vehicleunlockmarker%1",_nextbase], [ markerpos _nextbase select 0, (markerpos _nextbase select 1) + 125]];
	_marker setMarkerTextLocal ( getText (_cfg >> _nextvehicle >> "displayName") );
	_marker setMarkerColorLocal GRLIB_color_enemy;
	_marker setMarkerTypeLocal "mil_pickup";
	_vehicle_unlock_markers pushback [ _marker, _nextbase ];
} foreach GRLIB_vehicle_to_military_base_links;


_sector_count = -1;

uiSleep 1;

while { true } do {
	waitUntil {
		uiSleep 1;
		count blufor_sectors != _sector_count
	};

	{ _x setMarkerColorLocal GRLIB_color_enemy; } foreach (sectors_allSectors - blufor_sectors);
	{ _x setMarkerColorLocal GRLIB_color_friendly; } foreach blufor_sectors;

	{
		_nextmarker = _x;
		(_nextmarker select 0) setMarkerColorLocal GRLIB_color_enemy;
		{
			if ( _x == (_nextmarker select 1) ) exitWith { (_nextmarker select 0) setMarkerColorLocal GRLIB_color_friendly; };
		} foreach blufor_sectors;
	} foreach _vehicle_unlock_markers;
	_sector_count = count blufor_sectors;
};