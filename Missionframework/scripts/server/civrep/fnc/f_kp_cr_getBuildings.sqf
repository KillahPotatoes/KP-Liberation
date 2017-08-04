params ["_sector"];

private _return = 0;

if (KP_liberation_cr_param_buildings) then {
	_return = {damage _x == 0} count nearestObjects [getMarkerPos _sector, ["House"], 1.5 * GRLIB_capture_size];
} else {
	_return = {alive _x} count nearestObjects [getMarkerPos _sector, ["House"], 1.5 * GRLIB_capture_size];
};

_return
