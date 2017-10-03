params ["_sector"];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] getBuildings called on: %1 - Sector: %2", debug_source, _sector];_text remoteExec ["diag_log",2];};

private _return = 0;

if (KP_liberation_cr_param_buildings) then {
	_return = {damage _x == 0} count nearestObjects [getMarkerPos _sector, ["House"], 1.5 * GRLIB_capture_size];
} else {
	_return = {alive _x} count nearestObjects [getMarkerPos _sector, ["House"], 1.5 * GRLIB_capture_size];
};

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] getBuildings finished on: %1 - Return: %2", debug_source, _return];_text remoteExec ["diag_log",2];};

_return
