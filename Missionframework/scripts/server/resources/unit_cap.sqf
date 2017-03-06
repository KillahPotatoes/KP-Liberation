unitcap = 0;

while { true } do {
	while { true } do {
		_local_unitcap = 0;
		{
			if ( (side group _x == GRLIB_side_friendly) && (alive _x) && ((_x distance lhd) > 250 || (isPlayer _x)) ) then {
				_local_unitcap = _local_unitcap + 1;
			};
		} foreach allUnits;
		unitcap = _local_unitcap;
		sleep 1.06;
	};
};