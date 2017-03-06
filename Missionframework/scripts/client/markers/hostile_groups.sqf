private [ "_hostile_markers", "_hostile_groups", "_nextgroup", "_marker" ];

_hostile_markers = [];

waitUntil {
	sleep 1;
	!isNil "blufor_sectors"
};

while { true } do {

	{ deleteMarkerLocal _x } foreach _hostile_markers;
	_hostile_markers = [];
	_hostile_groups = [];

	{
		private [ "_nextgroup" ];
		_nextgroup = _x;
		if ( (side _nextgroup == GRLIB_side_enemy) && (({ !captive _x } count ( units _nextgroup ) ) > 0)) then {
			if ( [(getpos leader _nextgroup), GRLIB_side_friendly, GRLIB_radiotower_size] call F_getNearestTower != "" ) then {

				_hostile_groups pushback _nextgroup;
			};
		};
	} foreach allGroups;

	{
		_marker = createMarkerLocal [format ["hostilegroup%1",_x], markers_reset];
		_marker setMarkerColorLocal GRLIB_color_enemy_bright;
		_marker setMarkerTypeLocal "mil_warning";
		_marker setMarkerSizeLocal [ 0.65, 0.65 ];
		_marker setMarkerPosLocal ( [ getpos (leader _x), random 50, random 360 ] call BIS_fnc_relPos );
		_hostile_markers pushback _marker;
	} foreach _hostile_groups;

	sleep (60 + (random 60));
};