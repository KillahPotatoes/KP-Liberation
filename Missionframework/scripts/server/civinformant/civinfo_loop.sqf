if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] Loop spawned on: %1", debug_source];_text remoteExec ["diag_log",2];};

while {true} do {
	uiSleep (KP_liberation_civinfo_min + round (random (KP_liberation_civinfo_max - KP_liberation_civinfo_min)));
	
	if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] Informant sleep passed";_text remoteExec ["diag_log",2];};

	waitUntil {
		sleep 10;
		KP_liberation_civ_rep >= 25
	};

	if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] Informant waitUntil passed";_text remoteExec ["diag_log",2];};

	if (KP_liberation_civinfo_chance >= (random 100)) then {
		if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] Informant spawn chance fits";_text remoteExec ["diag_log",2];};

		private _sector = selectRandom ([sectors_capture, {_x in blufor_sectors}] call BIS_fnc_conditionalSelect);

	} else {
		if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] Informant spawn chance missed";_text remoteExec ["diag_log",2];};
	};
};
