private _is_bigtown_active = false;

if (!isNil "active_sectors") then {
	{
		if (_x in sectors_bigtown) exitWith {_is_bigtown_active = true};
	} forEach active_sectors;
};

_is_bigtown_active
