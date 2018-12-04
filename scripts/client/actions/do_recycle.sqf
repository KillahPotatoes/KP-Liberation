params ["_vehtorecycle"];
private ["_objectinfo", "_cfg", "_dialog", "_building_classnames", "_currentAmmo", "_allAmmo", "_suppMulti", "_ammoMulti", "_fuelMulti", "_disName", "_price_s", "_price_a", "_price_f", "_nearfob", "_recycle_building", "_storage_areas", "_supplyCrates", "_ammoCrates", "_fuelCrates", "_crateSum", "_spaceSum"];

dorecycle = 0;

_cfg = configFile >> "cfgVehicles";
_dialog = createDialog "liberation_recycle";

_building_classnames = [];
{
	_building_classnames pushBack ( _x select 0 );
} foreach (buildings);

if (((typeOf _vehtorecycle) in _building_classnames) ||
	((typeOf _vehtorecycle) in KP_liberation_storage_buildings) ||
	((typeOf _vehtorecycle) in KP_liberation_upgrade_buildings) ||
	((typeOf _vehtorecycle) in KP_liberation_ace_crates) ||
	((typeOf _vehtorecycle) == "B_Slingload_01_Repair_F") ||
	((typeOf _vehtorecycle) == "B_Slingload_01_Fuel_F") ||
	((typeOf _vehtorecycle) == "B_Slingload_01_Ammo_F")) then {
	_suppMulti = 0.5;
	_ammoMulti = 0.5;
	_fuelMulti = 0.5;
} else {
	_currentAmmo = 0; 
	_allAmmo = 0;
	if (count (magazinesAmmo _vehtorecycle) > 0) then {
		{ 
			_currentAmmo = _currentAmmo + (_x select 1); 
			_allAmmo = _allAmmo + (getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count"));
		} forEach (magazinesAmmo _vehtorecycle); 
	} else {
		_allAmmo = 1;
	};

	_suppMulti = (((_vehtorecycle getHitPointDamage "HitEngine") - 1) * -1) * (((_vehtorecycle getHitPointDamage "HitHull") - 1) * -1);
	_ammoMulti = _currentAmmo/_allAmmo;
	_fuelMulti = fuel _vehtorecycle;

	if ((typeOf _vehtorecycle) in boats_names) then {
		_suppMulti = (((_vehtorecycle getHitPointDamage "HitEngine") - 1) * -1);
	};
};

if ((typeOf _vehtorecycle) in all_hostile_classnames) then {
	_disName = getText (_cfg >> (typeOf _vehtorecycle) >> "displayName");
	if (_vehtorecycle isKindOf "Car") then {
		_price_s = round (60 * _suppMulti);
		_price_a = round (25 * _ammoMulti);
		_price_f = round (40 * _fuelMulti);
	};
	if (_vehtorecycle isKindOf "Tank") then {
		_price_s = round (150 * _suppMulti);
		_price_a = round (120 * _ammoMulti);
		_price_f = round (100 * _fuelMulti);
	};
	if (_vehtorecycle isKindOf "Air") then {
		_price_s = round (250 * _suppMulti);
		_price_a = round (200 * _ammoMulti);
		_price_f = round (150 * _fuelMulti);
	};
} else {
	_objectinfo = ([(light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles + buildings), {(typeOf _vehtorecycle) == (_x select 0)}] call BIS_fnc_conditionalSelect) select 0;
	_disName = getText (_cfg >> (_objectinfo select 0) >> "displayName");
	_price_s = round ((_objectinfo select 1) * GRLIB_recycling_percentage * _suppMulti);
	_price_a = round ((_objectinfo select 2) * GRLIB_recycling_percentage * _ammoMulti);
	_price_f = round ((_objectinfo select 3) * GRLIB_recycling_percentage * _fuelMulti);
};

waitUntil { dialog };

ctrlSetText [ 134, format [localize "STR_RECYCLING_YIELD", _disName]];
ctrlSetText [ 131, format ["%1", _price_s]];
ctrlSetText [ 132, format ["%1", _price_a]];
ctrlSetText [ 133, format ["%1", _price_f]];

while { dialog && (alive player) && dorecycle == 0 } do {
	sleep 0.1;
};

if ( dialog ) then { closeDialog 0 };

if (_vehtorecycle getVariable ["KP_liberation_preplaced", false]) exitWith {hint localize "STR_PREPLACED_ERROR";};

if ( dorecycle == 1 && !(isnull _vehtorecycle) && alive _vehtorecycle) then {
	
	_nearfob = [] call F_getNearestFob;

	if (!(KP_liberation_recycle_building_near) && ((_price_s + _price_a + _price_f) > 0)) exitWith {hint localize "STR_NORECBUILDING_ERROR";};

	_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

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
		[_vehtorecycle, _price_s, _price_a, _price_f, _storage_areas] remoteExec ["recycle_remote_call",2];
	};
};
