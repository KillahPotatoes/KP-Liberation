waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KP_liberation_civ_rep"};

if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Loop spawned on: %1", debug_source];};

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
			private _sector = _x;
			private _blocked = false;
			private _units_at_sector = [getmarkerpos _sector, GRLIB_sector_size, GRLIB_side_friendly] call F_getUnitsCount;
			
			{
				if ((_x select 0) == _sector) exitWith {
					if ((((_x select 1) + 1800) < time) && (_units_at_sector == 0)) then {
						asymm_blocked_sectors = asymm_blocked_sectors - [_x];
						if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Sector %1 removed from blocked sectors", markerText (_x select 0)];};
					} else {
						_blocked = true;
						if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Sector %1 still blocked for ambush", markerText (_x select 0)];};
					};
				};
			} forEach asymm_blocked_sectors;
			
			if ((_units_at_sector > 0) && !(_sector in KP_liberation_asymmetric_sectors) && !_blocked) then {
				KP_liberation_asymmetric_sectors pushBack _sector;

				if ((random 100) <= KP_liberation_resistance_ambush_chance) then {
					private _hc = [] call F_lessLoadedHC;
					private _ieds = round (([] call F_cr_getMulti) * GRLIB_difficulty_modifier);

					if (isNull _hc) then {
						[_sector, _ieds] spawn manage_asymIED;
						[_sector] spawn asym_sector_ambush;
					} else {
						[_sector, _ieds] remoteExec ["manage_asymIED", _hc];
						[_sector] remoteExec ["asym_sector_ambush",_hc];
					};
				};
			};

			if (!(_units_at_sector > 0) && (_sector in KP_liberation_asymmetric_sectors)) then {
				KP_liberation_asymmetric_sectors = KP_liberation_asymmetric_sectors - [_sector];
			};
		} forEach ([(sectors_capture + sectors_bigtown), {_x in blufor_sectors}] call BIS_fnc_conditionalSelect);
	};
	publicVariable "KP_liberation_asymmetric_sectors";
	publicVariable "asymm_blocked_sectors";
	sleep 10;
};
