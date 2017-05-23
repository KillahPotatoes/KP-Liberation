active_sectors = [];

waitUntil {!isNil "blufor_sectors"};
waitUntil {!isNil "sectors_allSectors"};

while {GRLIB_endgame == 0} do {

	{
		private ["_nextsector", "_opforcount"];

		_nextsector = _x;
		_opforcount =  [] call F_opforCap;

		if (_opforcount < GRLIB_sector_cap) then {

			if (([getmarkerpos _nextsector, [_opforcount] call F_getCorrectedSectorRange, GRLIB_side_friendly] call F_getUnitsCount > 0) && !(_nextsector in active_sectors)) then {

				_hc = [] call F_lessLoadedHC;

				if (isNull _hc) then {
					[_nextsector] spawn manage_one_sector;
				} else {
					[_nextsector] remoteExec ["manage_one_sector", _hc];
				};

				if ((_nextsector in sectors_factory) || (_nextsector in sectors_capture)) then {
					[_nextsector] call manage_captureboxes;
				};

				if (_nextsector in sectors_military) then {
					[_nextsector] call manage_intel;
				};
			};
		};
		sleep 0.25;
	} foreach (sectors_allSectors - blufor_sectors);

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Full sector scan at %1, active sectors: %2", time, active_sectors];_text remoteExec ["diag_log",2];};
	sleep 1;
};