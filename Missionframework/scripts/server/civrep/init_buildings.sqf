if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] init_buildings.sqf initialising on: %1", debug_source];};

switch (worldName) do {
	case "Chernarus": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\chernarus.sqf"};
	case "lythium": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\lythium.sqf"};
	case "Malden": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\malden.sqf"};
	case "pja310": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\pja310.sqf"};
	case "Sara": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\sara.sqf"};
	case "Takistan": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\takistan.sqf"};
	case "Tanoa": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\tanoa.sqf"};
	case "xcam_taunus": {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\xcam_taunus.sqf"};
	default {call compile preprocessFileLineNumbers "scripts\server\civrep\ignored\altis.sqf"};
};

KP_liberation_cr_sectorbuildings = [];

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_capture;

{
	KP_liberation_cr_sectorbuildings pushBack [_x, [_x] call F_cr_getBuildings];
} forEach sectors_bigtown;

sleep 1;

if (KP_liberation_civrep_debug > 0) then {
	diag_log format ["[KP LIBERATION] [CIVREP] init_buildings.sqf finished on: %1 - Listing sectors with buildings amount...", debug_source];
	{
		diag_log format ["[KP LIBERATION] [CIVREP] %1: %2", markerText (_x select 0), (_x select 1)];
	} forEach KP_liberation_cr_sectorbuildings;
};
