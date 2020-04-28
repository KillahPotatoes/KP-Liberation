_fobposdestroy = _this select 0;

private _to_destroy = [toLower FOB_typename];
_to_destroy append KPLIB_b_buildings_classes;

_nextbuildingsdestroy = (_fobposdestroy nearobjects 150) select {getObjectType _x >= 8};
_all_buildings_to_destroy = [];
{
    if ((toLower (typeof _x)) in _to_destroy) then {
        _all_buildings_to_destroy = _all_buildings_to_destroy + [_x];
    };
} foreach _nextbuildingsdestroy;

{
    _x setdamage 1;
    sleep (random 3);
} foreach _all_buildings_to_destroy;

KP_liberation_clearances deleteAt (KP_liberation_clearances findIf {(_x select 0) isEqualTo _fobposdestroy});
publicVariable "KP_liberation_clearances";
