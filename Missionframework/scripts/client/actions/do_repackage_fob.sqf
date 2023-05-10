dorepackage = 0;

createDialog "liberation_repackage_fob";
waitUntil {sleep 0.1; dialog};
waitUntil {sleep 0.1; !dialog || !alive player || dorepackage != 0};

if (dorepackage > 0) then {
    closeDialog 0;
    waitUntil {sleep 0.1; !dialog};

    private _fob = [] call KPLIB_fnc_getNearestFob;

    if !(_fob isEqualTo []) then {
        KPLIB_sectors_fob = KPLIB_sectors_fob - [_fob];
        KPLIB_clearances deleteAt (KPLIB_clearances findIf {(_x select 0) isEqualTo _fob});
        publicVariable "KPLIB_sectors_fob";
        publicVariable "KPLIB_clearances";
    };

    {deleteVehicle _x} forEach (((getPos player) nearobjects [KPLIB_b_fobBuilding, 250]) select {getObjectType _x >= 8});

    sleep 0.5;

    private _spawnpos = zeropos;
    while {_spawnpos distance2d zeropos < 1000} do {
        _spawnpos = (getPosASL player) findEmptyPosition [10, 250, 'B_Heli_Transport_01_F'];
        if (_spawnpos isEqualTo []) then {_spawnpos = (getPosASL player) findEmptyPosition [0, 250, 'B_Heli_Transport_01_F'];};
    };

    if (dorepackage == 1) then {
        private _fobbox = KPLIB_b_fobBox createVehicle _spawnpos;
        [_fobbox] call KPLIB_fnc_addObjectInit;
    };

    if (dorepackage == 2) then {
        private _fobTruck = KPLIB_b_fobTruck createVehicle _spawnpos;
        [_fobTruck] call KPLIB_fnc_addObjectInit;
    };
    hint localize "STR_FOB_REPACKAGE_HINT";
};
