_fobposdestroy = _this select 0;

classnames_to_destroy = [FOB_typename];
{
	classnames_to_destroy = classnames_to_destroy + [(_x select 0)];
} foreach buildings;

_nextbuildingsdestroy = (_fobposdestroy nearobjects 150) select {getObjectType _x >= 8};
_all_buildings_to_destroy = [];
{
	if ( (typeof _x) in classnames_to_destroy ) then {
		_all_buildings_to_destroy = _all_buildings_to_destroy + [_x];
	};
} foreach _nextbuildingsdestroy;

{
	_x setdamage 1;
	sleep (random 3);
} foreach _all_buildings_to_destroy;

KP_liberation_clearances deleteAt (KP_liberation_clearances findIf {(_x select 0) isEqualTo _fobposdestroy});
publicVariable "KP_liberation_clearances";
