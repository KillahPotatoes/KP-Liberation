params ["_sector"];

private _return = 0;

if (KPLIB_param_buildingDamaged) then {
    _return = count (nearestObjects [markerPos _sector, ["House"], 1.5 * KPLIB_range_sectorCapture] select {(damage _x == 0) && !((typeOf _x) in KPLIB_cr_ign_buildings)});
} else {
    _return = count (nearestObjects [markerPos _sector, ["House"], 1.5 * KPLIB_range_sectorCapture] select {(alive _x) && !((typeOf _x) in KPLIB_cr_ign_buildings)});
};

_return
