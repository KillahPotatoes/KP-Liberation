if ( isNil "active_sectors" ) then { active_sectors = [] };
if ( isNil "GRLIB_all_fobs" ) then { GRLIB_all_fobs = [] };

cinematic_camera_started = true;
private _last_transition = -1;
private _last_position = [ -1, -1, -1 ];

showCinemaBorder true;
private _cinematic_camera = "camera" camCreate [0,0,0];
private _cinematic_pointer = "Sign_Arrow_Blue_F" createVehicleLocal [0,0,0];
_cinematic_pointer hideObject true;
_cinematic_camera camSetTarget _cinematic_pointer;
_cinematic_camera cameraEffect ["internal","back"];
_cinematic_camera camcommit 0;
if ( isNil "first_camera_round" ) then { first_camera_round = true; };

while { cinematic_camera_started } do {

	waitUntil { !cinematic_camera_started || camCommitted _cinematic_camera };

	if ( cinematic_camera_started ) then {
		camUseNVG false;

		private _positions = [ getpos startbase ];
		if ( !first_camera_round ) then {

			if ( count GRLIB_all_fobs > 0 ) then {
				for [ {_idx=0},{_idx < 2},{_idx=_idx+1} ] do {
					_positions pushback (selectRandom GRLIB_all_fobs);
				};
			};

			if ( count active_sectors > 0 ) then {
				for [ {_idx=0},{_idx < 5},{_idx=_idx+1} ] do {
					_positions pushback (getmarkerpos (selectRandom active_sectors));
				};
			} else {
				for [ {_idx=0},{_idx < 5},{_idx=_idx+1} ] do {
					_positions pushback (getmarkerpos (selectRandom sectors_allSectors));
				};
			};

			if ( GRLIB_endgame == 0 ) then {
				 _activeplayers = ( [ allPlayers , { alive _x && ( _x distance ( getmarkerpos GRLIB_respawn_marker ) ) > 100 } ] call BIS_fnc_conditionalSelect );
				 if ( count _activeplayers > 0 ) then {
				 	for [ {_idx=0},{_idx < 3},{_idx=_idx+1} ] do {
						_positions pushback (getpos (selectRandom _activeplayers));
					};
				};
			};

		};
		_position = selectRandom (_positions - [_last_position]);
		_last_position = _position;
		_cinematic_pointer setpos [ _position select 0, _position select 1, (_position select 2) + 7 ];
		private _nearentities = _position nearEntities [ "Man", 100 ];
		private _camtarget = _cinematic_pointer;
		if ( first_camera_round ) then {
			_camtarget = startbase;
		} else {
			if ( count ( [ _nearentities , { alive _x && isPlayer _x } ] call BIS_fnc_conditionalSelect ) != 0 ) then {
				_camtarget = selectRandom ([_nearentities, {alive _x && isPlayer _x}] call BIS_fnc_conditionalSelect);
			} else {
				if ( count ( [ _nearentities , { alive _x } ] call BIS_fnc_conditionalSelect ) != 0 ) then {
					_camtarget = selectRandom ([_nearentities, {alive _x}] call BIS_fnc_conditionalSelect);
				};
			};
		};

		_cinematic_camera camSetTarget _camtarget;
		private _startpos = [ ((getpos _camtarget) select 0) - 60, ((getpos _camtarget) select 1) + 350, 5 ];
		private _endpos = [ ((getpos _camtarget) select 0) - 60, ((getpos _camtarget) select 1) - 230, 5 ];
		private _startfov = 0.5;
		private _endfov = 0.5;

		if ( !first_camera_round ) then {
			_startfov = 0.8;
			_endfov = 0.8;

			_next_transition = selectRandom ([0, 1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11 ,12 ,13 ,14, 15] - [_last_transition]);
			_last_transition = _next_transition;

			switch ( _next_transition ) do {
				case 0: {
					_startpos = [ ((getpos _camtarget) select 0) - 30, ((getpos _camtarget) select 1) - 50, 15 ];
					_endpos = [ ((getpos _camtarget) select 0) - 30, ((getpos _camtarget) select 1) + 50, 15 ];
					_endfov = 0.8;
				};

				case 1: {
					_startpos = [ ((getpos _camtarget) select 0) + 5, ((getpos _camtarget) select 1) - 100, 1 ];
					_endpos = [ ((getpos _camtarget) select 0) + 5, ((getpos _camtarget) select 1) + 100, 40 ];
					_endfov = 0.55;
				};

				case 2: {
					_startpos = [ ((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 50, 100 ];
					_endpos = [ ((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) + 50, 100 ];
					_startfov = 0.5;
					_endfov = 0.3;
				};

				case 3: {
					_startpos = [ ((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 80, 2 ];
					_endpos = [ ((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) + 80, 20 ];
				};

				case 4: {
					_startpos = [ ((getpos _camtarget) select 0) - 400, ((getpos _camtarget) select 1) + 400, 50 ];
					_endpos = [ ((getpos _camtarget) select 0) + 400, ((getpos _camtarget) select 1) + 400, 50 ];
					_startfov = 0.25;
					_endfov = 0.25;
				};

				case 5: {
					_startpos = [ ((getpos _camtarget) select 0) + 300, ((getpos _camtarget) select 1) - 100, 15 ];
					_endpos = [ ((getpos _camtarget) select 0) -300, ((getpos _camtarget) select 1) - 120, 15 ];
				};

				case 6: {
					_startpos = [ ((getpos _camtarget) select 0) + 100, ((getpos _camtarget) select 1) - 100, 1 ];
					_endpos = [ ((getpos _camtarget) select 0) + 100, ((getpos _camtarget) select 1) - 100, 50 ];
				};

				case 7: {
					_startpos = [ ((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 50, 150 ];
					_endpos = [ ((getpos _camtarget) select 0) + 20, ((getpos _camtarget) select 1) - 20, 5 ];
					_startfov = 0.6;
					_endfov = 0.9;
				};

				case 8: {
					_startpos = [ ((getpos _camtarget) select 0) - 300, ((getpos _camtarget) select 1) - 80, 20 ];
					_endpos = [ ((getpos _camtarget) select 0) + 300, ((getpos _camtarget) select 1) + 120, 20 ];
					_startfov = 0.55;
					_endfov = 0.55;
				};

				case 9: {
					_startpos = [ ((getpos _camtarget) select 0) - 80, ((getpos _camtarget) select 1) - 300, 30 ];
					_endpos = [ ((getpos _camtarget) select 0) + 120, ((getpos _camtarget) select 1) + 300, 30 ];
					_startfov = 0.65;
					_endfov = 0.65;
				};

				case 10: {
					_startpos = [ ((getpos _camtarget) select 0) - 5, ((getpos _camtarget) select 1) + 30, 5 ];
					_endpos = [ ((getpos _camtarget) select 0) - 25, ((getpos _camtarget) select 1) -30, 150 ];
				};

				case 11 : {
					_cinematic_camera cameraEffect ["Terminate", "BACK"];
					camDestroy _cinematic_camera;
					_cinematic_camera = "camera" camCreate [0,0,0];
					_cinematic_camera cameraEffect ["internal","back"];
					_cinematic_camera camcommit 0;
					_startpos = [ ((getpos _camtarget) select 0) + 2, ((getpos _camtarget) select 1) -200, 25 ];
					_endpos = [ ((getpos _camtarget) select 0) + 2, ((getpos _camtarget) select 1) +200, 25 ];
					_cinematic_camera setDir 0;
					[ _cinematic_camera, -30, 0 ] call BIS_fnc_setPitchBank;
				};

				case 12 : {
					_cinematic_camera cameraEffect ["Terminate", "BACK"];
					camDestroy _cinematic_camera;
					_cinematic_camera = "camera" camCreate [0,0,0];
					_cinematic_camera cameraEffect ["internal","back"];
					_cinematic_camera camcommit 0;
					_startpos = [ ((getpos _camtarget) select 0) + 302 , ((getpos _camtarget) select 1) + 300, 50 ];
					_endpos = [ ((getpos _camtarget) select 0) - 198, ((getpos _camtarget) select 1) - 200, 50 ];
					_cinematic_camera setDir 225;
					[ _cinematic_camera, -25, 0 ] call BIS_fnc_setPitchBank;
				};

				case 13 : {
					_cinematic_camera cameraEffect ["Terminate", "BACK"];
					camDestroy _cinematic_camera;
					_cinematic_camera = "camera" camCreate [0,0,0];
					_cinematic_camera cameraEffect ["internal","back"];
					_cinematic_camera camcommit 0;
					_startpos = [ ((getpos _camtarget) select 0) - 80 , ((getpos _camtarget) select 1) + 150, 20 ];
					_endpos = [ ((getpos _camtarget) select 0) - 80, ((getpos _camtarget) select 1) - 150, 20 ];
					_cinematic_camera setDir 90;
					[ _cinematic_camera, -15, 0 ] call BIS_fnc_setPitchBank;
				};

				case 14 : {
					_cinematic_camera cameraEffect ["Terminate", "BACK"];
					camDestroy _cinematic_camera;
					_cinematic_camera = "camera" camCreate [0,0,0];
					_cinematic_camera cameraEffect ["internal","back"];
					_cinematic_camera camcommit 0;
					_startpos = [ ((getpos _camtarget) select 0) - 50 , ((getpos _camtarget) select 1) + 2, 30 ];
					_endpos = [ ((getpos _camtarget) select 0) + 150, ((getpos _camtarget) select 1) - 2, 30 ];
					_cinematic_camera setDir 270;
					[ _cinematic_camera, -20, 0 ] call BIS_fnc_setPitchBank;
					_startfov = 0.55;
					_endfov = 0.55;
				};

				case 15 : {
					_cinematic_camera cameraEffect ["Terminate", "BACK"];
					camDestroy _cinematic_camera;
					_cinematic_camera = "camera" camCreate [0,0,0];
					_cinematic_camera cameraEffect ["internal","back"];
					_cinematic_camera camcommit 0;
					_startpos = [ ((getpos _camtarget) select 0) - 150 , ((getpos _camtarget) select 1) + 5, 250 ];
					_endpos = [ ((getpos _camtarget) select 0) + 150, ((getpos _camtarget) select 1) + 5, 250 ];
					_cinematic_camera setDir 0;
					[ _cinematic_camera, -88, 0 ] call BIS_fnc_setPitchBank;
					_startfov = 0.3;
					_endfov = 0.3;
				};
			};
		};


		if ( surfaceIsWater _position ) then {
			_startpos = [ _startpos select 0, _startpos select 1, (_startpos select 2) + 25 ];
			_endpos = [ _endpos select 0, _endpos select 1, (_endpos select 2) + 25 ];
		};

		while { terrainIntersect [ _startpos, _endpos ] } do {
			_startpos = [ _startpos select 0, _startpos select 1, (_startpos select 2) + 30 ];
			_endpos = [ _endpos select 0, _endpos select 1, (_endpos select 2) + 30 ];
		};

		_cinematic_camera camSetPos _startpos;
		_cinematic_camera camSetFov _startfov;
		_cinematic_camera camCommit 0;
		_cinematic_camera camSetPos _endpos;
		_cinematic_camera camSetFov _endfov;

		if ( isNil "howtoplay" ) then { howtoplay = 0; };

		if ( first_camera_round ) then {
			_cinematic_camera camcommit 18;
		} else {
			if ( howtoplay == 0 ) then {
				_cinematic_camera camcommit 10;
			} else {
				_cinematic_camera camcommit 20;
			};
		};
		first_camera_round = false;

		if ( !isNil "showcaminfo" ) then {
			if ( showcaminfo && howtoplay == 0 ) then {
				private _unitname = "";
				if ( isPlayer _camtarget ) then { _unitname = name _camtarget };
				private _nearest_sector = "";
				if ( _position distance startbase < 300 ) then {
					_nearest_sector = "BEGIN OF OPERATION";
				} else {
					_nearest_sector = [300, _position ] call F_getNearestSector;
					if ( _nearest_sector != "" ) then {
						_nearest_sector = markertext _nearest_sector;
					} else {
						_nearfobs = [ GRLIB_all_fobs, { _x distance _position < 300 } ] call BIS_fnc_conditionalSelect;
						if ( count _nearfobs > 0 ) then {
							_nearest_sector = format [ "FOB %1", military_alphabet select ( GRLIB_all_fobs find ( _nearfobs select 0 ) ) ];
						};
					};
				};

				[ format [ "<t size='0.7' align='left'>%1<br/>%2</t>", _unitname, _nearest_sector ],1,0.8,6,1 ] spawn BIS_fnc_dynamictext;
			};
		};
	};
};

_cinematic_camera cameraEffect ["Terminate", "BACK"];
camDestroy _cinematic_camera;
camUseNVG false;
cinematic_camera_stop = true;
