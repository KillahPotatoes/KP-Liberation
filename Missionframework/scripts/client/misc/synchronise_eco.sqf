one_eco_done = false;

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside sync eco starts intitializing on: %1", debug_source];_text remoteExec ["diag_log",2];};

waitUntil {!isNil "sync_eco"};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside sync eco intitialized for: %1", debug_source];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {
		sleep 0.2;
		count sync_eco > 0;
	};
	KP_liberation_production = sync_eco select 0;
	KP_liberation_logistics = sync_eco select 1;
	sync_eco = [];
	one_eco_done = true;
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Clientside eco received at: %1", debug_source];_text remoteExec ["diag_log",2];};
};
