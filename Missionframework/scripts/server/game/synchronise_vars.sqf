sync_vars = []; publicVariable "sync_vars";

waitUntil {!isNil "save_is_loaded"};
waitUntil{!isNil "KP_liberation_fob_resources"};
waitUntil{!isNil "combat_readiness"};
waitUntil{!isNil "unitcap"};
waitUntil{!isNil "resources_intel"};
waitUntil{!isNil "infantry_cap"};

_KP_liberation_fob_resources_old = [];
_resources_kp_ammo_old = -999;
_resources_kp_fuel_old = -999;
_unitcap_old = -1;
_combat_readiness_old = -1;
_resources_intel_old = -999;
_infantry_cap_old = -999;

while {true} do {

	waitUntil {sleep 0.25;
		!(_KP_liberation_fob_resources_old isEqualTo KP_liberation_fob_resources)
		|| _unitcap_old != unitcap
		|| _combat_readiness_old != combat_readiness
		|| _resources_intel_old != resources_intel
		|| _infantry_cap_old != infantry_cap
	};
	sleep 0.25;
	sync_vars = [KP_liberation_fob_resources,unitcap,combat_readiness,resources_intel,infantry_cap];
	publicVariable "sync_vars";
	
	_KP_liberation_fob_resources_old = KP_liberation_fob_resources;
	_unitcap_old = unitcap;
	_combat_readiness_old = combat_readiness;
	_resources_intel_old = resources_intel;
	_infantry_cap_old = infantry_cap;
	
};