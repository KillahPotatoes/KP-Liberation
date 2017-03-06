params [ "_grp" ];
private [ "_grouptype", "_vehicletype" ];

_grouptype = 'infantry';
_vehicletype = '';
{
	if ( vehicle _x != _x && _vehicletype == '' ) then {
		if ( ((gunner vehicle _x) == _x) || ((driver  vehicle _x) == _x) || ((commander vehicle _x) == _x) ) then {
			_vehicletype = typeof vehicle _x;
		};
	};
} foreach units _grp;

if ((_grouptype == 'infantry') && (_vehicletype != '')) then {

	{
		if  ( _vehicletype == (_x select 0)) then {
			_grouptype = 'heavy';
		};
	} foreach heavy_vehicles;

	if ( _grouptype == 'infantry' ) then {
	{
		if  ( _vehicletype == (_x select 0)) then {
			if ( _vehicletype in uavs ) then {
				_grouptype = 'uav';
			} else {
				_grouptype = 'air';
			};
		};
	} foreach air_vehicles;
	};

	if ( _grouptype == 'infantry' ) then {
	{
		if  ( _vehicletype == (_x select 0)) then {
			if ( _vehicletype in uavs ) then {
				_grouptype = 'uav';
			} else {
				_grouptype = 'light';
			};
		};
	} foreach light_vehicles;
	};


	if ( _grouptype == 'infantry' ) then {
	{
		if  ( _vehicletype == (_x select 0)) then {
			_grouptype = 'support';
		};
	} foreach support_vehicles;
	};

	if ( _grouptype == 'infantry' ) then {
	{
		if  ( _vehicletype == (_x select 0)) then {
			_grouptype = 'static';
		};
	} foreach static_vehicles;
	};

};

_grouptype
