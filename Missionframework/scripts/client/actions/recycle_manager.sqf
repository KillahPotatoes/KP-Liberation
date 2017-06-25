
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Recycle management initializing for: %1", debug_source];_text remoteExec ["diag_log",2];};

private [ "_recycleable_vehicles", "_recycleable_classnames", "_building_classnames", "_detected_vehicles", "_next_vehicle", "_next_vehicle_already_in_list", "_idact_next" ];

_recycleable_vehicles = [];
_recycleable_classnames = [];
veh_action_detect_distance = 20;
veh_action_distance = 10;

{
	_recycleable_classnames pushBack ( _x select 0 );
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles);

_recycleable_classnames append all_hostile_classnames;

_building_classnames = [];
{
	_building_classnames pushBack ( _x select 0 );
} foreach (buildings);
_building_classnames = _building_classnames + ["B_Slingload_01_Cargo_F", "B_Slingload_01_Repair_F", "B_Slingload_01_Fuel_F", "B_Slingload_01_Ammo_F"];

waitUntil {sleep 1; !isNil "GRLIB_all_fobs"};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Recycle management started for: %1", debug_source];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {sleep 1; count GRLIB_all_fobs > 0};
	waitUntil {sleep 1; (player distance ([] call F_getNearestFob)) < GRLIB_fob_range};

	if ([player, 4] call F_fetchPermission) then {

		_detected_vehicles =	[(getPos player) nearObjects veh_action_detect_distance, {
									(((typeof _x in _recycleable_classnames ) &&
									(({alive _x} count (crew _x)) == 0 || (typeof _x) in uavs) &&
									((locked _x == 0 || locked _x == 1))) || ((typeOf _x) in _building_classnames) || (((typeOf _x) in KP_liberation_storage_buildings) && ((_x getVariable ["KP_liberation_storage_type",-1]) == 0)) || ((typeOf _x) in KP_liberation_upgrade_buildings) || ((typeOf _x) in KP_liberation_ace_crates)) &&
									(alive _x) &&
									((count(attachedObjects _x) == 0) || ((typeOf _x) == "rhsusf_mkvsoc")) &&
									(_x distance startbase > 1000) &&
									(_x distance ( [] call F_getNearestFob) < GRLIB_fob_range) &&
									(getObjectType _x >= 8)
								}] call BIS_fnc_conditionalSelect;

		{
			_next_vehicle = _x;
			_next_vehicle_already_in_list = false;
			{
				if ((_x select 0) == _next_vehicle) then {
					_next_vehicle_already_in_list = true;
				};
			} foreach _recycleable_vehicles;

			if (!_next_vehicle_already_in_list) then {
				_idact_next = _next_vehicle addAction ["<t color='#FFFF00'>" + localize "STR_RECYCLE" + "</t> <img size='2' image='res\ui_recycle.paa'/>", "scripts\client\actions\do_recycle.sqf", "", -900, true, true, "", "build_confirmed == 0 && ((_this distance2D _target) < veh_action_distance) && (vehicle player == player)"];
				_recycleable_vehicles pushback [_next_vehicle, _idact_next ] ;
			};
		} foreach _detected_vehicles;

		{
			_next_vehicle = _x;
			_next_vehicle_already_in_list = false;
			{
				if (_x == (_next_vehicle select 0)) then {
					_next_vehicle_already_in_list = true;
				};
			} foreach _detected_vehicles;

			if (!_next_vehicle_already_in_list) then {
				(_next_vehicle select 0) removeAction (_next_vehicle select 1);
				_recycleable_vehicles = _recycleable_vehicles - [ _next_vehicle ];
			};

		} foreach _recycleable_vehicles;

	} else {
		{
			(_x select 0) removeAction (_x select 1);
			_recycleable_vehicles = _recycleable_vehicles - [ _x ];
		} foreach _recycleable_vehicles;
	};

	sleep 3;
};
