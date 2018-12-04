private _olddistance_inf = -1;
private _olddistance_veh = -1;
private _olddistance_obj = -1;
private _olddesiredvolume = -1;
private _was_vehicle = false;
private _min_view_distance = 300;
private _desired_inf = -1;
private _desired_veh = -1;
private _desired_obj = -1;


waitUntil { !isNil "GREUH_view_distance_factor" };
waitUntil { !isNil "GREUH_force_adjust_view_distance" };

while { true } do {
	waitUntil { sleep 0.3;
		(round _olddistance_inf != round desiredviewdistance_inf)
		|| (round _olddistance_veh != round desiredviewdistance_veh)
		|| (round _olddistance_obj != round desiredviewdistance_obj)
		|| ( (( vehicle player == player ) && _was_vehicle)
		|| (( vehicle player != player ) && !_was_vehicle) )
		|| !(alive player)
		|| ( round _olddesiredvolume != round desired_vehvolume)
		|| GREUH_force_adjust_view_distance };
	waitUntil { alive player };
	GREUH_force_adjust_view_distance = false;
	_olddistance_inf = round desiredviewdistance_inf;
	_olddistance_veh = round desiredviewdistance_veh;
	_olddistance_obj = round desiredviewdistance_obj;
	_olddesiredvolume = desired_vehvolume;
	_was_vehicle = ( vehicle player != player );

	if ( _was_vehicle ) then {

		_desired_veh = (round desiredviewdistance_veh) * GREUH_view_distance_factor;
		if ( _desired_veh < _min_view_distance ) then {
			_desired_veh = _min_view_distance;
		};
		setViewDistance _desired_veh;

		1 fadeSound ( desired_vehvolume / 100.0 );
	} else {

		_desired_inf = (round desiredviewdistance_inf) * GREUH_view_distance_factor;
		if ( _desired_inf < _min_view_distance ) then {
			_desired_inf = _min_view_distance;
		};
		setViewDistance _desired_inf;

		1 fadeSound 1;
	};

	_desired_obj = (((desiredviewdistance_obj / 100.0) * desiredviewdistance_inf) * GREUH_view_distance_factor);
	if ( _desired_obj < _min_view_distance) then {
		_desired_obj = _min_view_distance;
	};
	setObjectViewDistance _desired_obj;
};