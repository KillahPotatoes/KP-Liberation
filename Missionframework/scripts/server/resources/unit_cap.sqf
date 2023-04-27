unitcap = 0;
KPLIB_heli_count = 0;
KPLIB_plane_count = 0;

while {true} do {
    private _local_unitcap = 0;
    private _local_heli_count = 0;
    private _local_plane_count = 0;
    private _local_units = allUnits select {alive _x && (side group _x == KPLIB_side_player) && !(captive _x) && ((_x distance startbase) > 250 || (isPlayer _x))};
    private _local_vehicles = vehicles select {alive _x && (toLowerANSI (typeOf _x)) in KPLIB_b_air_classes && !(_x getVariable ["KPLIB_preplaced", false])};
    {
        _local_unitcap = _local_unitcap + 1;
    } forEach _local_units;
    {
        if (!([typeOf _x] call KPLIB_fnc_isClassUAV)) then {
            if (_x isKindOf "Helicopter") then {
                _local_heli_count = _local_heli_count + 1;
            };
            if (_x isKindOf "Plane") then {
                _local_plane_count = _local_plane_count + 1;
            };
        };
    } forEach _local_vehicles;
    unitcap = _local_unitcap;
    KPLIB_heli_count = _local_heli_count;
    KPLIB_plane_count = _local_plane_count;
    sleep 1;
};
