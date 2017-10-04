if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Respawn script started for: %1", debug_source];_text remoteExec ["diag_log",2];};

if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Respawn script ended for: %1", debug_source];_text remoteExec ["diag_log",2];};
