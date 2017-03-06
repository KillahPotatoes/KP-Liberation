private [ "_vehmarkers", "_markedveh", "_cfg", "_vehtomark", "_supporttomark", "_marker" ];

_vehmarkers = [];
_markedveh = [];
_cfg = configFile >> "cfgVehicles";
_vehtomark = [];

_support_to_skip = [
	ammobox_o_typename,
	"B_Slingload_01_Repair_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Ammo_F"
];

{
	_vehtomark pushback (_x select 0);
} foreach light_vehicles + heavy_vehicles + air_vehicles + support_vehicles;

_vehtomark = _vehtomark - _support_to_skip;

while { true } do {

	_markedveh = [];
	{
		if ( (alive _x) && ((typeof _x) in _vehtomark) && (count (crew _x) == 0) && (_x distance lhd > 500) ) then {
			_markedveh pushback _x;
		};
	} foreach vehicles;

	if ( count _markedveh != count _vehmarkers ) then {
		{ deleteMarkerLocal _x; } foreach _vehmarkers;
		_vehmarkers = [];

		{
			_marker = createMarkerLocal [ format [ "markedveh%1" ,_x], markers_reset ];
			_marker setMarkerColorLocal "ColorKhaki";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerSizeLocal [ 0.75, 0.75 ];
			_vehmarkers pushback _marker;
		} foreach _markedveh;
	};

	{
		_marker = _vehmarkers select (_markedveh find _x);
		_marker setMarkerPosLocal getpos _x;
		_marker setMarkerTextLocal  (getText (_cfg >> typeOf _x >> "displayName"));

	} foreach _markedveh;

	sleep 5;
};
