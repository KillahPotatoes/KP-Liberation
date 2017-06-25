sync_vars = []; publicVariable "sync_vars";

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables starts intitializing on: %1", debug_source];_text remoteExec ["diag_log",2];};

waitUntil{!isNil "save_is_loaded"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: save_is_loaded"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_fob_resources"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_fob_resources"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_supplies_global"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_supplies_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_ammo_global"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_ammo_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_fuel_global"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_fuel_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "combat_readiness"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: combat_readiness"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "unitcap"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: unitcap"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_heli_count"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_heli_count"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_plane_count"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_plane_count"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_heli_slots"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_heli_slots"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_plane_slots"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: KP_liberation_plane_slots"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "resources_intel"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: resources_intel"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "infantry_cap"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables: infantry_cap"];_text remoteExec ["diag_log",2];};

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

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync variables intitializing finished on: %1", debug_source];_text remoteExec ["diag_log",2];};

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
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync sent from: %1", debug_source];_text remoteExec ["diag_log",2];};
};
