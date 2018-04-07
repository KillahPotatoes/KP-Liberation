params ["_source", "_permission"];

if (isNil "GRLIB_last_permission_check_time") then {GRLIB_last_permission_check_time = -1000;};
if (isNil "GRLIB_permissions_cache") then {GRLIB_permissions_cache = [];};

private _ret = false;

if (!GRLIB_permissions_param) then {
	_ret = true;
} else {
	if (!(isNil "GRLIB_permissions") && !(isNull _source)) then {

		if ( time > GRLIB_last_permission_check_time + 10) then {
			GRLIB_last_permission_check_time = time;
			private _uidvar = getPlayerUID _source;
			{if (_uidvar == _x select 0) exitWith {GRLIB_permissions_cache  = [] + (_x select 2)};} foreach GRLIB_permissions;
		};

		if (count GRLIB_permissions_cache > _permission) then {
			_ret = GRLIB_permissions_cache select _permission;
		};
	};
};

_ret
