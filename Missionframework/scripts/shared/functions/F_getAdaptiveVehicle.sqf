private _vehicle_to_spawn = selectRandom opfor_vehicles;

if (combat_readiness < 35) then {
	_vehicle_to_spawn = selectRandom opfor_vehicles_low_intensity;
};

_vehicle_to_spawn;
