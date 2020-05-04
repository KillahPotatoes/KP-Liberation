unitcap = 0;
KP_liberation_heli_count = 0;
KP_liberation_plane_count = 0;

while {true} do {
    private _local_unitcap = 0;
    private _local_heli_count = 0;
    private _local_plane_count = 0;
    {
        if ((side group _x == GRLIB_side_friendly) && (alive _x) && ((_x distance startbase) > 250 || (isPlayer _x))) then {
            _local_unitcap = _local_unitcap + 1;
        };
    } forEach allUnits;
    {
        if ((toLower (typeOf _x)) in KPLIB_b_air_classes && !([typeOf _x] call KPLIB_fnc_isClassUAV) && alive _x && !(_x getVariable ["KP_liberation_preplaced", false])) then {
            if (_x isKindOf "Helicopter") then {
                _local_heli_count = _local_heli_count + 1;
            };
            if (_x isKindOf "Plane") then {
                _local_plane_count = _local_plane_count + 1;
            };
        };
    } forEach vehicles;
    unitcap = _local_unitcap;
    KP_liberation_heli_count = _local_heli_count;
    KP_liberation_plane_count = _local_plane_count;
    sleep 1;
};
