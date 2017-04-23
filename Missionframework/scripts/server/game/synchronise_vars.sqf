sync_vars = []; publicVariable "sync_vars";

waitUntil {!isNil "save_is_loaded"};
waitUntil{!isNil "KP_liberation_fob_resources"};
waitUntil{!isNil "KP_liberation_supplies_global"};
waitUntil{!isNil "KP_liberation_ammo_global"};
waitUntil{!isNil "KP_liberation_fuel_global"};
waitUntil{!isNil "combat_readiness"};
waitUntil{!isNil "unitcap"};
waitUntil{!isNil "KP_liberation_heli_count"};
waitUntil{!isNil "KP_liberation_plane_count"};
waitUntil{!isNil "KP_liberation_heli_slots"};
waitUntil{!isNil "KP_liberation_plane_slots"};
waitUntil{!isNil "resources_intel"};
waitUntil{!isNil "infantry_cap"};

_KP_liberation_fob_resources_old = [];
_KP_liberation_supplies_global_old = -1;
_KP_liberation_ammo_global_old = -1;
_KP_liberation_fuel_global_old = -1;
_unitcap_old = -1;
_KP_liberation_heli_count_old = -1;
_KP_liberation_plane_count_old = -1;
_KP_liberation_heli_slots_old = -1;
_KP_liberation_plane_slots_old = -1;
_combat_readiness_old = -1;
_resources_intel_old = -999;
_infantry_cap_old = -999;

while {true} do {

	waitUntil {sleep 0.25;
		!(_KP_liberation_fob_resources_old isEqualTo KP_liberation_fob_resources)
		|| _KP_liberation_supplies_global_old != KP_liberation_supplies_global
		|| _KP_liberation_ammo_global_old != KP_liberation_ammo_global
		|| _KP_liberation_fuel_global_old != KP_liberation_fuel_global
		|| _unitcap_old != unitcap
		|| _KP_liberation_heli_count_old != KP_liberation_heli_count
		|| _KP_liberation_plane_count_old != KP_liberation_plane_count
		|| _KP_liberation_heli_slots_old != KP_liberation_heli_slots
		|| _KP_liberation_plane_slots_old != KP_liberation_plane_slots
		|| _combat_readiness_old != combat_readiness
		|| _resources_intel_old != resources_intel
		|| _infantry_cap_old != infantry_cap
	};
	sleep 0.25;
	sync_vars = [KP_liberation_fob_resources,KP_liberation_supplies_global,KP_liberation_ammo_global,KP_liberation_fuel_global,unitcap,KP_liberation_heli_count,KP_liberation_plane_count,KP_liberation_heli_slots,KP_liberation_plane_slots,combat_readiness,resources_intel,infantry_cap];
	publicVariable "sync_vars";
	
	_KP_liberation_fob_resources_old = KP_liberation_fob_resources;
	_KP_liberation_supplies_global_old = KP_liberation_supplies_global;
	_KP_liberation_ammo_global_old = KP_liberation_ammo_global;
	_KP_liberation_fuel_global_old = KP_liberation_fuel_global;
	_unitcap_old = unitcap;
	_KP_liberation_heli_count_old = KP_liberation_heli_count;
	_KP_liberation_plane_count_old = KP_liberation_plane_count;
	_KP_liberation_heli_slots_old = KP_liberation_heli_slots;
	_KP_liberation_plane_slots_old = KP_liberation_plane_slots;
	_combat_readiness_old = combat_readiness;
	_resources_intel_old = resources_intel;
	_infantry_cap_old = infantry_cap;
	
};
