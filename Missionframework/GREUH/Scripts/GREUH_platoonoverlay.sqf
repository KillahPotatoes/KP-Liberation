platoon_icon1 = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
platoon_icon2 = "\A3\ui_f\data\igui\cfg\cursors\board_ca.paa";
soldier_icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
formation_leader_icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
commander_icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
group_leader_icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
wounded_icon = "\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa";

nametags_distance = 32.0;

private [ "_groups", "_unitstocount", "_totalx", "_totaly", "_totalz", "_alpha", "_textalpha", "_size", "_screenpos", "_grouppos", "_distlabel", "_dist", "_nextunit", "_color", "_drawicon", "_displayname", "_iconpos" ];

waitUntil { !isNil "GRLIB_overlay_groups" };
waitUntil { !isNil "GRLIB_nametag_units" };

["platoon_overlay", "onEachFrame", {

	if ( show_platoon ) then {

		{
			if ( count units _x > 0 ) then {
				_totalx = 0;
				_totaly = 0;
				_totalz = 0;
				_grouppos = [];
				_unitstocount = [];
				{
					if ( _x distance (leader group _x) < 300) then {
						_unitstocount pushback _x;
						_totalx = _totalx + (getpos _x select 0);
						_totaly = _totaly + (getpos _x select 1);
						_totalz = _totalz + (getpos _x select 2);
					};
				} foreach units _x;

				if ( count _unitstocount > 0 ) then {
					_totalx = _totalx / (count _unitstocount);
					_totaly = _totaly / (count _unitstocount);
					_totalz = _totalz / (count _unitstocount);
				};

				if ( _totalz > 2.1 ) then {
					_grouppos = [_totalx, _totaly, _totalz + 10];
				} else {
					_grouppos = [_totalx, _totaly, 2.1];
				};
				_alpha = 0.5;
				_textalpha = 0;
				_size = 0.8;

				_screenpos = worldToScreen _grouppos;

				if (count _screenpos != 0) then {
					if ( (abs (((worldToScreen _grouppos) select 0) - 0.5) < 0.06) && (abs (((worldToScreen _grouppos) select 1) - 0.5) < 0.08)) then {
						_alpha = 1;
						_textalpha = 1;
						_size = 1;
					};
				};

				_dist = player distance _grouppos;
				_distlabel = "";
				if ( _dist > 200 ) then {
					if ( _dist >= 1000 ) then {
						_distlabel = format [" (%1km)", floor (_dist / 1000)];
					} else {
						_distlabel = format [" (%1m)", (floor (_dist / 100)) * 100];
					};
				};

				_color = [0.8,1,0.2,_alpha];
				if ( _x == group player) then { _color = [1,0.9,0.3,_alpha] };
				drawIcon3D [platoon_icon1, _color, _grouppos, _size / 2, _size / 2,0, format ["%1 - %2%3",groupID _x, name (leader _x),_distlabel], 2, 0.03 * _textalpha, "puristaMedium"];
				drawIcon3D [platoon_icon2, _color, _grouppos, _size, _size,0, "", 2, 0.04, "puristaMedium"];
			};
		} foreach GRLIB_overlay_groups;
	};

	if ( show_nametags ) then {
		{
			_nextunit = _x;

			private _local_nametags_distance = nametags_distance;
			if( _nextunit == leader group player ) then {
				_local_nametags_distance = nametags_distance * 3;
			};
			_alpha = 1;
			if ( _nextunit distance player > (_local_nametags_distance / 2) ) then {
				_alpha = 1 - ((((_nextunit distance player) - (_local_nametags_distance / 2)) * 2) / _local_nametags_distance);
			};

			_color = [];
			if ( _nextunit in (units group player)) then {

				switch ( _nextunit getVariable [ "GRLIB_squad_color", "MAIN" ] ) do {
					case "BLUE" : { _color = [0.15,0.35,1.0,_alpha] };
					case "RED" : { _color = [0.8,0,0,_alpha] };
					case "YELLOW" : { _color = [0.85,0.85,0,_alpha] };
					case "GREEN" : { _color = [0,0.75,0,_alpha] };
					default { _color = [0.9,0.9,0.9,_alpha] };
				};

			} else {
				_color = [0.92,0.7,0.25,_alpha];
			};

			_drawicon = soldier_icon;
			if ( _nextunit getVariable [ "FAR_isUnconscious", 0 ] == 1 ) then {
				_drawicon = wounded_icon;
			} else {
				if ( _nextunit == [] call KPLIB_fnc_getCommander ) then {
					_drawicon = commander_icon;
				} else {
					if ( _nextunit == (leader group _nextunit) && (count (units group _nextunit) > 1 ) ) then {
						_drawicon = group_leader_icon;
					} else {
						if ( ( isFormationLeader _nextunit ) && ( count formationMembers _nextunit > 1 ) ) then {
							_drawicon = formation_leader_icon;
						};
					};
				};
			};

			_displayname = "";
			if(count (squadParams _nextunit) != 0) then {
				_displayname = "[" + ((squadParams _nextunit select 0) select 0) + "] ";
			};
			_displayname = _displayname + ( name _nextunit );

			_height = 2 + ((player distance _nextunit) / (0.75 * _local_nametags_distance));

			_iconpos = [  getPosATL _nextunit select 0,  getPosATL _nextunit select 1,  (getPosATL _nextunit select 2) + _height ];

			drawIcon3D [ _drawicon, _color, _iconpos , 0.75, 0.75,0, format [ "%1", _displayname] , 2, 0.032, "puristaMedium"];

		} foreach GRLIB_nametag_units;
	};

}] call BIS_fnc_addStackedEventHandler;
