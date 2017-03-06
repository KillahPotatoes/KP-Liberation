sync_vars = []; publicVariable "sync_vars";


waitUntil { !isNil "save_is_loaded" };
waitUntil{ !isNil "resources_infantry" };
waitUntil{ !isNil "resources_ammo" };
waitUntil{ !isNil "resources_fuel" };
waitUntil{ !isNil "infantry_cap" };
waitUntil{ !isNil "fuel_cap" };
waitUntil{ !isNil "combat_readiness" };
waitUntil{ !isNil "unitcap" };
waitUntil{ !isNil "resources_intel" };


_infantry_cap_old = -999;
_fuel_cap_old = -999;
_resources_infantry_old = -999;
_resources_ammo_old = -999;
_resources_fuel_old = -999;
_resources_intel_old = -999;
_unitcap_old = -1;
_combat_readiness_old = -1;

while { true } do {

	waitUntil { sleep 0.25;
		_resources_infantry_old != resources_infantry
		|| _resources_ammo_old != resources_ammo
		|| _resources_fuel_old != resources_fuel
		|| _infantry_cap_old != infantry_cap
		|| _fuel_cap_old != fuel_cap
		|| _unitcap_old != unitcap
		|| _combat_readiness_old != combat_readiness
		|| _resources_intel_old != resources_intel
	};
	sleep 0.25;
	sync_vars = [resources_infantry, resources_ammo, resources_fuel,infantry_cap,fuel_cap, unitcap, combat_readiness, resources_intel];
	publicVariable "sync_vars";

	_infantry_cap_old = infantry_cap;
	_fuel_cap_old = fuel_cap;
	_resources_infantry_old = resources_infantry;
	_resources_ammo_old = resources_ammo;
	_resources_fuel_old = resources_fuel;
	_unitcap_old = unitcap;
	_combat_readiness_old = combat_readiness;
	_resources_intel_old = resources_intel;
};