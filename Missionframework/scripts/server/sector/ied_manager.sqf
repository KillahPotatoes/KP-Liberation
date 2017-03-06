params [ "_sector", "_radius", "_number" ];
private [ "_activation_radius_infantry", "_activation_radius_vehicles", "_spread", "_infantry_trigger", "_ultra_strong", "_vehicle_trigger", "_ied_type", "_ied_obj", "_roadobj", "_goes_boom"];

if ( _number <= 0 ) exitWith {};

_number = round _number;

_activation_radius_infantry = 6.66;
_activation_radius_vehicles = 10;

_spread = 7;
_infantry_trigger = 2 + (floor (random 3));
_ultra_strong = false;
if ( random 100 < 12 ) then {
	_ultra_strong = true;
};
_vehicle_trigger = 1;
_ied_type = [ "IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F" ] call BIS_fnc_selectRandom;
_ied_obj = objNull;
_roadobj = [ [  getmarkerpos (_sector), random(_radius), random(360)  ] call BIS_fnc_relPos, _radius, [] ] call BIS_fnc_nearestRoad;
_goes_boom = false;


if (_number > 0) then {
	[ _sector, _radius, _number - 1 ] spawn ied_manager;
};

if ( !(isnull _roadobj) ) then {

	_roadpos = getpos _roadobj;
	_ied_obj = createMine [ _ied_type, [ _roadpos, _spread, random(360) ] call BIS_fnc_relPos, [], 0];
	_ied_obj setdir (random 360);

	while { _sector in active_sectors && mineActive _ied_obj && !_goes_boom } do {
		_nearinfantry = [ (getpos _ied_obj) nearEntities [ "Man", _activation_radius_infantry ] , { side _x == GRLIB_side_friendly } ] call BIS_fnc_conditionalSelect;
		_nearvehicles = [ (getpos _ied_obj) nearEntities [ [ "Car", "Tank", "Air" ], _activation_radius_vehicles ] , { side _x == GRLIB_side_friendly } ] call BIS_fnc_conditionalSelect;
		if ( count _nearinfantry >= _infantry_trigger || count _nearvehicles >= _vehicle_trigger ) then {
			if ( _ultra_strong ) then {
				"Bomb_04_F" createVehicle (getpos _ied_obj);
				deleteVehicle _ied_obj;
			} else {
				_ied_obj setDamage 1;
			};
			stats_ieds_detonated = stats_ieds_detonated + 1; publicVariable "stats_ieds_detonated";
			_goes_boom = true;
		};
		sleep 1;
	};
};

sleep 1800;

if ( !(isNull _ied_obj) ) then { deleteVehicle _ied_obj; };