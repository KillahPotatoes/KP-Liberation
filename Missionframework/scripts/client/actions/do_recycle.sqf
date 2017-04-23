params [ "_vehtorecycle" ];
private [ "_objectinfo", "_cfg", "_dialog" ];

_objectinfo = ( [ (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings ), { typeof _vehtorecycle == _x select 0 } ] call BIS_fnc_conditionalSelect ) select 0;
dorecycle = 0;

_cfg = configFile >> "cfgVehicles";
_dialog = createDialog "liberation_recycle";
waitUntil { dialog };

ctrlSetText [ 134, format [ localize "STR_RECYCLING_YIELD", getText (_cfg >> (_objectinfo select 0) >> "displayName" ) ] ];
ctrlSetText [ 131, format [ "%1", round ((_objectinfo select 1) * GRLIB_recycling_percentage) ] ];
ctrlSetText [ 132, format [ "%1", round ((_objectinfo select 2) * GRLIB_recycling_percentage) ] ];
ctrlSetText [ 133, format [ "%1", round ((_objectinfo select 3) * GRLIB_recycling_percentage) ] ];

while { dialog && (alive player) && dorecycle == 0 } do {
	sleep 0.1;
};

if ( dialog ) then { closeDialog 0 };

if (_vehtorecycle getVariable ["KP_liberation_preplaced", false]) exitWith {hint localize "STR_PREPLACED_ERROR";};

if ( dorecycle == 1 && !(isnull _vehtorecycle) && alive _vehtorecycle) then {
	private ["_price_s", "_price_a", "_price_f", "_nearfob", "_recycle_building", "_storage_areas", "_supplyCrates", "_ammoCrates", "_fuelCrates", "_crateSum", "_spaceSum"];
	
	_price_s = round ((_objectinfo select 1) * GRLIB_recycling_percentage);
	_price_a = round ((_objectinfo select 2) * GRLIB_recycling_percentage);
	_price_f = round ((_objectinfo select 3) * GRLIB_recycling_percentage);
	
	_nearfob = [] call F_getNearestFob;

	if (!(KP_liberation_recycle_building_near)) exitWith {hint localize "STR_NORECBUILDING_ERROR";};

	_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(typeOf _x) in KP_liberation_storage_buildings}] call BIS_fnc_conditionalSelect;

	_supplyCrates = ceil (_price_s / 100);
	_ammoCrates = ceil (_price_a / 100);
	_fuelCrates = ceil (_price_f / 100);
	_crateSum = _supplyCrates + _ammoCrates + _fuelCrates;

	_spaceSum = 0;

	{
		if (typeOf _x == KP_liberation_large_storage_building) then {
			_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
		};
		if (typeOf _x == KP_liberation_small_storage_building) then {
			_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
		};
	} forEach _storage_areas;

	if (_spaceSum < _crateSum) then {
		hint localize "STR_CANCEL_ERROR";
	} else {
		[[_vehtorecycle, _price_s, _price_a, _price_f, _storage_areas] , "recycle_remote_call" ] call BIS_fnc_MP;
	};
};
