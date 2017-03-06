private [ "_is_bigtown_active" ];

_is_bigtown_active = false;

if (!isNil "active_sectors") then {
	{
		if ( _x in sectors_bigtown ) exitWith { _is_bigtown_active = true };
	} foreach active_sectors;
};

_is_bigtown_active