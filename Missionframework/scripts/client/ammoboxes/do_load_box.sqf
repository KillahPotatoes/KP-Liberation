params [ "_ammobox", ["_max_transport_distance", 15] ];
private [ "_neartransporttrucks", "_truck_to_load", "_truck_load", "_next_truck", "_maxload", "_i" ];

_maxload = 3;
_neartransporttrucks = [ ((getpos _ammobox) nearEntities [ ammobox_transports_typenames, _max_transport_distance]), { alive _x && speed _x < 5 && ((getpos _x) select 2) < 5 } ] call BIS_fnc_conditionalSelect;
_truck_to_load = objNull;


{
	_next_truck = _x;
	_maxload = 0;
	_offsets = [];
	{
		if ( _x select 0 == typeof _next_truck ) then {
			_maxload = (count _x) - 2;
			for [ {_i=2}, {_i < (count _x) }, {_i=_i+1} ] do { _offsets pushback (_x select _i); };
		};
	} foreach box_transport_config;

	if ( isNull _truck_to_load ) then {
		_truck_load = _next_truck getVariable ["GRLIB_ammo_truck_load", 0];
		if (  _truck_load < _maxload ) then {
			_truck_to_load = _next_truck;
			_ammobox attachTo [ _truck_to_load, _offsets select _truck_load ];
			_truck_to_load setVariable ["GRLIB_ammo_truck_load", _truck_load + 1, true];
			if ( !isServer ) then {
				hint localize "STR_BOX_LOADED";
			};
		}
	};
} foreach _neartransporttrucks;

if ( isNull _truck_to_load && !isServer ) then {
	hint localize "STR_BOX_CANTLOAD";
};
