private [ "_markers", "_markers_mobilespawns", "_marker", "_idx", "_respawn_trucks", "_markers_mobilespawns" ];

_markers = [];
_markers_mobilespawns = [];

waitUntil { !isNil "GRLIB_all_fobs" };

uiSleep 3;

while { true } do {
	if ( count _markers != count GRLIB_all_fobs ) then {
		{ deleteMarkerLocal _x } foreach _markers;
		_markers = [];
		for [ {_idx=0},{_idx < count GRLIB_all_fobs},{_idx=_idx+1}] do {
			_marker = createMarkerLocal [format ["fobmarker%1",_idx], markers_reset];
			_marker setMarkerTypeLocal "b_hq";
			_marker setMarkerSizeLocal [ 1.5, 1.5 ];
			_marker setMarkerPosLocal (GRLIB_all_fobs select _idx);
			_marker setMarkerTextLocal format ["FOB %1",military_alphabet select _idx];
			_marker setMarkerColorLocal "ColorYellow";
			_markers pushback _marker;
		};
	};

	if (KP_liberation_mobilerespawn) then {
		_respawn_trucks = call F_getMobileRespawns;
		if ( count _markers_mobilespawns != count _respawn_trucks ) then {
			{ deleteMarkerLocal _x; } foreach _markers_mobilespawns;
			_markers_mobilespawns = [];
			for [ {_idx=0} , {_idx < (count _respawn_trucks)} , {_idx=_idx+1} ] do {
				_marker = createMarkerLocal [format ["mobilespawn%1",_idx], markers_reset];
				_marker setMarkerTypeLocal "mil_end";
				_marker setMarkerColorLocal "ColorYellow";
				_markers_mobilespawns pushback _marker;
			};
		};

		if ( count _respawn_trucks == count _markers_mobilespawns ) then {
			for [ {_idx=0},{_idx < (count _markers_mobilespawns)},{_idx=_idx+1} ] do {
				(_markers_mobilespawns select _idx) setMarkerPosLocal getpos (_respawn_trucks select _idx);
				(_markers_mobilespawns select _idx) setMarkerTextLocal format ["%1 %2",localize "STR_RESPAWN_TRUCK",mapGridPosition (_respawn_trucks select _idx)];
			};
		};
	};

	sleep 5.12;
};
