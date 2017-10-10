sync_eco = []; publicVariable "sync_eco";

waitUntil{!isNil "save_is_loaded"};
waitUntil{!isNil "KP_liberation_production"};
waitUntil{!isNil "KP_liberation_logistics"};
waitUntil{!isNil "KP_liberation_production_markers"};

if (KP_liberation_production_markers isEqualTo []) then {
	{
		private _facility = selectRandom [[true,false,false], [false,true,false], [false,false,true]];
		KP_liberation_production_markers pushBack [_x, _facility select 0, _facility select 1, _facility select 2, markerText _x];
	} forEach sectors_factory;
};

private _KP_liberation_production_old = [0];
private _KP_liberation_logistics_old = [0];

while {true} do {

	waitUntil {sleep 0.25;
		!(_KP_liberation_production_old isEqualTo KP_liberation_production)
		|| !(_KP_liberation_logistics_old isEqualTo KP_liberation_logistics)
	};
	{
		private _sector = _x;
		{		
			if ((_sector select 1) == (_x select 0)) exitWith {
				_x set [1, (_sector select 4)];
				_x set [2, (_sector select 5)];
				_x set [3, (_sector select 6)];
			};
		} forEach KP_liberation_production_markers;
	} forEach KP_liberation_production;
	sleep 0.25;
	sync_eco = [KP_liberation_production,KP_liberation_logistics,KP_liberation_production_markers];
	publicVariable "sync_eco";
	
	_KP_liberation_production_old = +KP_liberation_production;
	_KP_liberation_logistics_old = +KP_liberation_logistics;
};
