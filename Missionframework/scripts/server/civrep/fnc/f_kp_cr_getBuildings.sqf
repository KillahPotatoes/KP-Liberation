params ["_sector"];

private _return = 0;

if (KPLIB_cr_param_buildings) then {
    _return = count (nearestObjects [markerPos _sector, ["House"], 1.5 * KPLIB_capture_size] select {(damage _x == 0) && !((typeOf _x) in KPLIB_cr_ign_buildings)});
} else {
    _return = count (nearestObjects [markerPos _sector, ["House"], 1.5 * KPLIB_capture_size] select {(alive _x) && !((typeOf _x) in KPLIB_cr_ign_buildings)});
};

_return
