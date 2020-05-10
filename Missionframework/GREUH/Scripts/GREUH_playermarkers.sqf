private _marked_players = [];
private _marked_vehicles = [];
private _marked_squadmates = [];
private _marker_objs = [];
private _color = "";
private _ticks = 0;
private _cfg = configFile >> "cfgVehicles";

if ( side player == GRLIB_side_friendly ) then {
	_color = GRLIB_color_friendly;
} else {
	_color = GRLIB_color_enemy;
};

while { true } do {
	waitUntil { sleep 0.2; show_teammates };
	while { show_teammates } do {

		if ( _ticks == 0 ) then {

			{
				private _nextmarker = _x select 0;
				private _nextobj = _x select 1;
				if ( (isNull _nextobj) || !(alive _nextobj) ) then {
					deleteMarkerLocal _nextmarker;
				};
			} foreach _marker_objs;

			private _playableunits = [];
			if ( count playableUnits > 0 ) then {
				_playableunits = [ playableUnits, { (side (group _x)) == (side (group player)) } ] call BIS_fnc_conditionalSelect;
			} else {
				_playableunits = [ player ];
			};

			{
				if ( vehicle _x == _x ) then {
					_marked_players pushbackUnique _x;
				} else {
					_marked_vehicles pushbackUnique (vehicle _x);
				};
			 } foreach _playableunits;

			{
				if ( alive _x && !(isPlayer _x) ) then {
					if ( vehicle _x == _x ) then {
						_marked_squadmates pushbackUnique _x;
					} else {
						_marked_vehicles pushbackUnique (vehicle _x);
					};
				};
			} foreach (units (group player));

			private _stuff_to_unmark = [];
			{
				if ( (vehicle _x != _x) || !(alive _x) ) then {
					_stuff_to_unmark pushback _x;
					_marked_players = _marked_players - [_x];
				};
			} foreach _marked_players;

			{
				if ( (vehicle _x != _x) || !(alive _x) ) then {
					_stuff_to_unmark pushback _x;
					_marked_squadmates = _marked_squadmates - [_x];
				};
			} foreach _marked_squadmates;

			{
				if ( (count (crew _x) == 0) || !(alive _x) ) then {
					_stuff_to_unmark pushback _x;
					_marked_vehicles = _marked_vehicles - [_x];
				};
			} foreach _marked_vehicles;

			{
				private _nextmarker = _x getVariable [ "spotmarker", "" ];
				if ( _nextmarker != "" ) then {
					deleteMarkerLocal _nextmarker;
					_x setVariable [ "spotmarker", "" ];
				};
			} foreach _stuff_to_unmark;

			{
				private _nextplayer = _x;
				private _marker = _nextplayer getVariable [ "spotmarker", "" ];
				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "playermarker%1", (allUnits find _x) * (time % 1000) * (floor (random 100)) ], getpos _nextplayer ] );
					_marker_objs pushback [ _marker, _nextplayer ];
					_nextplayer setVariable [ "spotmarker", _marker ];

					private _playername = "";
					if( count (squadParams _nextplayer) != 0 ) then {
						_playername = "[" + ((squadParams _nextplayer select 0) select 0) + "] ";
					};
					_playername = _playername + (name _nextplayer);
					_marker setMarkerTextLocal _playername;

					_marker setMarkerSizeLocal [ 0.75, 0.75 ];
					_marker setMarkerColorLocal _color;
				};

				private _markertype = "mil_start";
				if ( _nextplayer getVariable [ "FAR_isUnconscious", 0 ] == 1 ) then {
					_markertype = "MinefieldAP";
				};
				_marker setMarkerTypeLocal _markertype;
			} foreach _marked_players;

			{
				private _nextai = _x;
				private _marker = _nextai getVariable [ "spotmarker", "" ];

				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "squadaimarker%1", (allUnits find _x) * (time % 1000) * (floor (random 10000)) ], getpos _nextai ] );
					_marker_objs pushback [ _marker, _nextai ];
					_nextai setVariable [ "spotmarker", _marker ];
					_marker setMarkerTypeLocal "mil_triangle";
					_marker setMarkerSizeLocal [ 0.6, 0.6 ];
					_marker setMarkerColorLocal _color;
				};

				_marker setMarkerTextLocal format [ "%1", ( [ _nextai ] call KPLIB_fnc_getUnitPositionId )];
			} foreach _marked_squadmates;

			{
				private _nextvehicle = _x;
				private _marker = _nextvehicle getVariable [ "spotmarker", "" ];
				if ( _marker == "" ) then {
					_marker = ( createMarkerLocal [ format [ "vehiclemarker%1", (vehicles find _x) * (time % 1000) * (floor (random 10000)) ], getpos _nextvehicle ] );
					_marker_objs pushback [ _marker, _nextvehicle ];
					_nextvehicle setVariable [ "spotmarker", _marker ];
					_marker setMarkerTypeLocal "mil_arrow2";
					_marker setMarkerSizeLocal [0.75,0.75];
					_marker setMarkerColorLocal _color;
				};

				private _datcrew = crew _nextvehicle;
				private _vehiclename = "";
				{
					if (isPlayer _x) then {
						_vehiclename = _vehiclename + (name _x);
					} else {
						_vehiclename = _vehiclename + ( format [ "%1", [ _x ] call KPLIB_fnc_getUnitPositionId ] );
					};

					if( (_datcrew find _x) != ((count _datcrew) - 1) ) then {
						_vehiclename = _vehiclename + ",";
					};
					_vehiclename = _vehiclename + " ";
				} foreach  _datcrew;

				_vehiclename = _vehiclename + "(" + getText (_cfg >> typeOf _nextvehicle >> "displayName") + ")";
				_marker setMarkerTextLocal _vehiclename;
			} foreach _marked_vehicles;
		};

		private _markerunits = [] + _marked_players + _marked_squadmates + _marked_vehicles;
		{
			private _nextunit = _x;
			private _marker = _nextunit getVariable [ "spotmarker", "" ];
			if ( _marker != "" ) then {
				_marker setMarkerPosLocal (getPos _nextunit);
				private _mrkdir = getDir _nextunit;
				if ( isPlayer _nextunit ) then {
					if (  _nextunit getVariable [ "FAR_isUnconscious", 0 ] == 1 ) then {
						_mrkdir = 0;
					};
				};
				_marker setMarkerDirLocal _mrkdir;
			};
		} foreach _markerunits;

		_ticks = _ticks + 1;

		if ( _ticks > 10 ) then {
			_ticks = 0;
		};
		sleep 0.1;
	};

	{
		private _nextunit = _x;
		private _marker =  _nextunit getVariable [ "spotmarker", "" ];
		if ( _marker != "" ) then {
			deleteMarkerLocal _marker;
			_nextunit setVariable [ "spotmarker", "" ];
		};
	} forEach (allUnits + vehicles);
};
