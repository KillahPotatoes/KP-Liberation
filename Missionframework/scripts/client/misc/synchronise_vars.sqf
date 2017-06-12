one_synchro_done = false;
synchro_done = false;

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside sync variables starts intitializing on: %1", debug_source];_text remoteExec ["diag_log",2];};

waitUntil { !isNil "sync_vars" };

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside sync variables intitialized for: %1", debug_source];_text remoteExec ["diag_log",2];};

while { true } do {

	waitUntil {
		sleep 0.2;
		count sync_vars > 0;
	};
	KP_liberation_fob_resources = sync_vars select 0;
	KP_liberation_supplies_global = sync_vars select 1;
	KP_liberation_ammo_global = sync_vars select 2;
	KP_liberation_fuel_global = sync_vars select 3;
	unitcap = sync_vars select 4;
	KP_liberation_heli_count = sync_vars select 5;
	KP_liberation_plane_count = sync_vars select 6;
	KP_liberation_heli_slots = sync_vars select 7;
	KP_liberation_plane_slots = sync_vars select 8;
	combat_readiness = sync_vars select 9;
	resources_intel = sync_vars select 10;
	infantry_cap = sync_vars select 11;
	sync_vars = [];
	one_synchro_done = true;
	synchro_done = true;
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside sync received at: %1", debug_source];_text remoteExec ["diag_log",2];};
};
