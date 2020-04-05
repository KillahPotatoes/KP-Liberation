params ["_sector", "_opforcount"];

if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - Time: %3 - waiting to spawn sector...", (markerText _sector), _sector, time];_text remoteExec ["diag_log",2];};

private _corrected_size = [_opforcount] call KPLIB_fnc_getSectorRange;
sleep 0.1;
private _unitscount = [markerPos _sector, _corrected_size , GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;

if (_unitscount > 0 && _unitscount <= 10) then {
	sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 6) then {
	sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 4) then {
	sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 3) then {
	sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 2) then {
	sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount == 1) then {
	sleep 5;
};

if (KP_liberation_sectorspawn_debug > 0) then {private _text = format ["[KP LIBERATION] [SECTORSPAWN] Sector %1 (%2) - Time: %3 - waiting done", (markerText _sector), _sector, time];_text remoteExec ["diag_log",2];};
