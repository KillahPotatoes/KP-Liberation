scriptName "synchronize_eco";

publicVariable "synchronise_eco";

sync_eco = []; publicVariable "sync_eco";

waitUntil{!isNil "KPLIB_saveLoaded"};
waitUntil{!isNil "KPLIB_production"};
waitUntil{!isNil "KPLIB_logistics"};
waitUntil{!isNil "KPLIB_production_markers"};
waitUntil {KPLIB_saveLoaded};

if (KPLIB_production_markers isEqualTo []) then {
    {
        private _facility = selectRandom [[true,false,false], [false,true,false], [false,false,true]];
        KPLIB_production_markers pushBack [_x, _facility select 0, _facility select 1, _facility select 2, markerText _x];
    } forEach KPLIB_sectors_factory;
};

private _KPLIB_production_old = [0];
private _KPLIB_logistics_old = [0];

while {true} do {

    waitUntil {sleep 0.25;
        !(_KPLIB_production_old isEqualTo KPLIB_production)
        || !(_KPLIB_logistics_old isEqualTo KPLIB_logistics)
    };
    {
        private _sector = _x;
        {
            if ((_sector select 1) == (_x select 0)) exitWith {
                _x set [1, (_sector select 4)];
                _x set [2, (_sector select 5)];
                _x set [3, (_sector select 6)];
            };
        } forEach KPLIB_production_markers;
    } forEach KPLIB_production;
    sleep 0.25;
    sync_eco = [KPLIB_production,KPLIB_logistics,KPLIB_production_markers];
    publicVariable "sync_eco";

    _KPLIB_production_old = +KPLIB_production;
    _KPLIB_logistics_old = +KPLIB_logistics;
};
