active_sectors = [];

waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "blufor_sectors"};
waitUntil {!isNil "sectors_allSectors"};
waitUntil {save_is_loaded};

["Sector Manager started", "SECTORSPAWN"] call KPLIB_fnc_log;

private _timer = 0;

while {GRLIB_endgame == 0} do {
    {
        private _nextsector = _x;
        private _opforcount =  [] call KPLIB_fnc_getOpforCap;

        if (_opforcount < GRLIB_sector_cap) then {

            if (([markerPos _nextsector, [_opforcount] call KPLIB_fnc_getSectorRange, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount > 0) && !(_nextsector in active_sectors)) then {

                _hc = [] call KPLIB_fnc_getLessLoadedHC;

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
    } forEach (sectors_allSectors - blufor_sectors);

    _timer = _timer + 1;
    if (_timer isEqualTo 60) then {
        private _current_sectors = [];
        {
            _current_sectors pushBack (markerText _x);
        } forEach active_sectors;
        [format ["[KP LIBERATION] [SECTORSPAWN] Active sectors overview: %1", _current_sectors], "SECTORSPAWN"] call KPLIB_fnc_log;
        _timer = 0;
    };
    sleep 1;
};
