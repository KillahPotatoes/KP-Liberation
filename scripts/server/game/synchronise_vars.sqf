sync_vars = []; publicVariable "sync_vars";

waitUntil{!isNil "save_is_loaded"};
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
waitUntil{!isNil "KP_liberation_civ_rep"};
waitUntil{!isNil "KP_liberation_guerilla_strength"};
waitUntil{!isNil "infantry_weight"};
waitUntil{!isNil "armor_weight"};
waitUntil{!isNil "air_weight"};

private _KP_liberation_fob_resources_old = [];
private _KP_liberation_supplies_global_old = -1;
private _KP_liberation_ammo_global_old = -1;
private _KP_liberation_fuel_global_old = -1;
private _unitcap_old = -1;
private _KP_liberation_heli_count_old = -1;
private _KP_liberation_plane_count_old = -1;
private _KP_liberation_heli_slots_old = -1;
private _KP_liberation_plane_slots_old = -1;
private _combat_readiness_old = -1;
private _resources_intel_old = -999;
private _infantry_cap_old = -999;
private _KP_liberation_civ_rep_old = -999;
private _KP_liberation_guerilla_strength_old = -999;
private _infantry_weight_old = -1;
private _armor_weight_old = -1;
private _air_weight_old = -1;

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
		|| _KP_liberation_civ_rep_old != KP_liberation_civ_rep
		|| _KP_liberation_guerilla_strength_old != KP_liberation_guerilla_strength
		|| _infantry_weight_old != infantry_weight
		|| _armor_weight_old != armor_weight
		|| _air_weight_old != air_weight
	};
	
	if (KP_liberation_guerilla_strength < 0) then {KP_liberation_guerilla_strength = 0;};

	sleep 0.25;
	sync_vars = [
		KP_liberation_fob_resources,
		KP_liberation_supplies_global,
		KP_liberation_ammo_global,
		KP_liberation_fuel_global,
		unitcap,
		KP_liberation_heli_count,
		KP_liberation_plane_count,
		KP_liberation_heli_slots,
		KP_liberation_plane_slots,
		combat_readiness,
		resources_intel,
		infantry_cap,
		KP_liberation_civ_rep,
		KP_liberation_guerilla_strength,
		infantry_weight,
		armor_weight,
		air_weight
	];
	publicVariable "sync_vars";
	
	_KP_liberation_fob_resources_old = +KP_liberation_fob_resources;
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
	_KP_liberation_civ_rep_old = KP_liberation_civ_rep;
	_KP_liberation_guerilla_strength_old = KP_liberation_guerilla_strength;
	_infantry_weight_old = infantry_weight;
	_armor_weight_old = armor_weight;
	_air_weight_old = air_weight;
};
