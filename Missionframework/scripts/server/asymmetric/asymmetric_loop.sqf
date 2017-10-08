waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KP_liberation_civ_rep"};

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Loop spawned on: %1", debug_source];_text remoteExec ["diag_log",2];};

KP_liberation_asymmetric_sectors = [];

while {GRLIB_endgame == 0} do {
	private _sectors_to_remove = [];
	
	{
		if (!(_x in blufor_sectors) || (KP_liberation_civ_rep > -25)) then {
			_sectors_to_remove pushBack _x;
		};
	} forEach KP_liberation_asymmetric_sectors;
	
	KP_liberation_asymmetric_sectors = KP_liberation_asymmetric_sectors - _sectors_to_remove;

	if (KP_liberation_civ_rep <= -25) then {
		{
			private _units_at_sector = [getmarkerpos _x, GRLIB_sector_size, GRLIB_side_friendly] call F_getUnitsCount;
			
			if ((_units_at_sector > 0) && !(_x in KP_liberation_asymmetric_sectors)) then {
				KP_liberation_asymmetric_sectors pushBack _x;

				if ((random 100) <= KP_liberation_resistance_ambush_chance) then {
					private _hc = [] call F_lessLoadedHC;
					private _ieds = round (([] call F_cr_getMulti) * GRLIB_difficulty_modifier);

					if (isNull _hc) then {
						[_x, _ieds] spawn manage_asymIED;
						[_x] spawn asym_sector_ambush;
					} else {
						[_x, _ieds] remoteExec ["manage_asymIED", _hc];
						[_x] remoteExec ["asym_sector_ambush",_hc];
					};
				};
			};

			if (!(_units_at_sector > 0) && (_x in KP_liberation_asymmetric_sectors)) then {
				KP_liberation_asymmetric_sectors = KP_liberation_asymmetric_sectors - [_x];
			};
		} forEach ([(sectors_capture + sectors_bigtown), {_x in blufor_sectors}] call BIS_fnc_conditionalSelect);
	};
	publicVariable "KP_liberation_asymmetric_sectors";
	sleep 10;
};
