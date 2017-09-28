if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] init_buildings.sqf initialising on: %1", debug_source];_text remoteExec ["diag_log",2];};

KP_liberation_cr_sectorbuildings = [];

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_capture;

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_bigtown;

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] init_buildings.sqf finished on: %1 - List of sector buildings: %2", debug_source, KP_liberation_cr_sectorbuildings];_text remoteExec ["diag_log",2];};
