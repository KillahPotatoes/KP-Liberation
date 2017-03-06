private [ "_vehicle_to_spawn" ];

_vehicle_to_spawn = opfor_vehicles call BIS_fnc_selectRandom;
if ( combat_readiness < 35 ) then {
	_vehicle_to_spawn = opfor_vehicles_low_intensity call BIS_fnc_selectRandom;
};

_vehicle_to_spawn;
