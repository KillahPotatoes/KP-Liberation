params [ "_veh" ];

if ( _veh isKindOf "Tank" || _veh isKindOf "Air" ) then {

	waitUntil {
		sleep 10;
		!(alive _veh) || ( { alive _x } count (crew _veh) == 0)
	};

	if ( random 100 < 80 ) then {
		sleep 10;
		if ( (alive _veh) && ( { alive _x } count (crew _veh) == 0) ) then {
			_veh setdamage 1;
		};
	};

};