uiSleep 3;

private _sector = "";
private _saved = [];
private _classname = "";
private _tower = objNull;

{
    _sector = _x;
    _saved = KPLIB_sectorTowers select {(_x select 0) isEqualTo _sector};
    if (_saved isEqualTo []) then {
        _classname = selectRandom KPLIB_radioTowerClassnames;
        KPLIB_sectorTowers pushBack [_sector, _classname];
    } else {
        _classname = (_saved select 0) select 1;
    };
    _tower = _classname createVehicle (markerpos _x);
    _tower setPos (markerpos _x);
    _tower setVectorUp [0, 0, 1];
    _tower addEventHandler ["HandleDamage", {0}];
} forEach sectors_tower;
