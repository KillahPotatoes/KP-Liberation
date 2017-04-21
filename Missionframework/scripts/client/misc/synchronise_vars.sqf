one_synchro_done = false;
synchro_done = false;
waitUntil { !isNil "sync_vars" };

while { true } do {

	waitUntil {
		sleep 0.2;
		count sync_vars > 0;
	};
	KP_liberation_fob_resources = sync_vars select 0;
	unitcap = sync_vars select 1;
	KP_liberation_heli_count = sync_vars select 2;
	KP_liberation_plane_count = sync_vars select 3;
	KP_liberation_heli_slots = sync_vars select 4;
	KP_liberation_plane_slots = sync_vars select 5;
	combat_readiness = sync_vars select 6;
	resources_intel = sync_vars select 7;
	infantry_cap = sync_vars select 8;
	sync_vars = [];
	one_synchro_done = true;
	synchro_done = true;
};
