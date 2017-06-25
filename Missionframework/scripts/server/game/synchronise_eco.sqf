sync_eco = []; publicVariable "sync_eco";

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync eco starts intitializing on: %1", debug_source];_text remoteExec ["diag_log",2];};

waitUntil{!isNil "save_is_loaded"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync eco: save_is_loaded"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_production"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync eco: KP_liberation_production"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "KP_liberation_logistics"};
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync eco: KP_liberation_logistics"];_text remoteExec ["diag_log",2];};

_KP_liberation_production_old = [0];
_KP_liberation_logistics_old = [0];

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside sync eco intitializing finished on: %1", debug_source];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {sleep 0.25;
		!(_KP_liberation_production_old isEqualTo KP_liberation_production)
		|| !(_KP_liberation_logistics_old isEqualTo KP_liberation_logistics)
	};
	sleep 0.25;
	sync_eco = [KP_liberation_production,KP_liberation_logistics];
	publicVariable "sync_eco";
	
	_KP_liberation_production_old = +KP_liberation_production;
	_KP_liberation_logistics_old = +KP_liberation_logistics;

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Serverside eco sent from: %1", debug_source];_text remoteExec ["diag_log",2];};
};
