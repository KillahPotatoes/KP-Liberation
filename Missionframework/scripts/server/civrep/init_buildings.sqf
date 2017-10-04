if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] init_buildings.sqf initialising on: %1", debug_source];_text remoteExec ["diag_log",2];};

KP_liberation_cr_sectorbuildings = [];

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_capture;

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_bigtown;

sleep 1;

if (KP_liberation_civrep_debug > 0) then {
	diag_log format ["[KP LIBERATION] [CIVREP] init_buildings.sqf finished on: %1 - List of sector buildings:", debug_source];
	{
		diag_log format ["[KP LIBERATION] [CIVREP] %1: %2", markerText (_x select 0), (_x select 1)];
	} forEach KP_liberation_cr_sectorbuildings;
};
