KP_liberation_cr_sectorbuildings = [];

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_capture;

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_bigtown;
