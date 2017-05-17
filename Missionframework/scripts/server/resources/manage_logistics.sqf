waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KP_liberation_logistics"};

private ["_tempLogistics","_locPos","_locRes","_storage_areas","_toUnload","_space","_nextState","_time"];

while {(GRLIB_endgame == 0) && KP_liberation_ailogistics} do {


	if (((count allPlayers) > 0) && ((count KP_liberation_logistics) > 0)) then {
		
		_tempLogistics = KP_liberation_logistics;

		{
			switch (_x select 7) do {
				case 0: {};
				case 1;
				case 3: {
					if ((_x select 8) > 1) then {
						_x set [8,((_x select 8) - 1)];
						switch (_x select 7) do {case 1: {_locPos = 2; _locRes = 4;}; case 3: {_locPos = 3; _locRes = 5;};};
						_storage_areas = (_x select _locPos) nearobjects [[KP_liberation_small_storage_building, KP_liberation_large_storage_building],GRLIB_fob_range];

						if (((_x select 9) == 0) && !((_x select 6) isEqualTo [0,0,0])) then {

							if ((count (_storage_areas)) == 0) exitWith {_x set [9,2];};

							_toUnload = ceil ((ceil (((_x select 6) select 0) / 100)) + (ceil (((_x select 6) select 1) / 100)) + (ceil (((_x select 6) select 2) / 100)));
							if (_toUnload > 3) then {_toUnload = 3;};
							_spaceSum = 0;
							{
								if (typeOf _x == KP_liberation_large_storage_building) then {
									_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
								};
								if (typeOf _x == KP_liberation_small_storage_building) then {
									_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
								};
							} forEach _storage_areas;

							if (_spaceSum < _toUnload) exitWith {_x set [9,2];};

						} else {
							_x set [9,1];
						};

						if (((_x select 9) == 1) && !((_x select _locRes) isEqualTo [0,0,0])) then {

							if ((count (_storage_areas)) == 0) exitWith {_x set [9,3];};
						};
					} else {
						if (((_x select 4) isEqualTo [0,0,0]) && ((_x select 5) isEqualTo [0,0,0]) && ((_x select 6) isEqualTo [0,0,0])) then {
							_nextState = 0;
							_time = -1;
						} else {
							_nextState = switch (_x select 7) do {case 1: {2}; case 3: {4};};
							_time = ceil (((_x select 2) distance2D (_x select 3)) / 400);
						};

						_x set [7,_nextState];
						_x set [8,_time];
						_x set [9,0];
					};
				};
				case 2;
				case 4: {
					if ((_x select 8) > 1) then {
						_x set [8,((_x select 8) - 1)];
					} else {
						switch (_x select 7) do {
							case 2: {
								_nextState = 3;
								_time = ceil (((ceil (((_x select 5) select 0) / 100)) + (ceil (((_x select 5) select 1) / 100)) + (ceil (((_x select 5) select 2) / 100))) / 3);	
							};
							case 4: {
								_nextState = 1;
								_time = ceil (((ceil (((_x select 4) select 0) / 100)) + (ceil (((_x select 4) select 1) / 100)) + (ceil (((_x select 4) select 2) / 100))) / 3);
							};
						};
						if (_time > (_x select 1)) then {_time = (_x select 1);};

						_time = _time + (ceil (((ceil (((_x select 6) select 0) / 100)) + (ceil (((_x select 6) select 1) / 100)) + (ceil (((_x select 6) select 2) / 100))) / 3));
						_time = _time + 1;

						_x set [7,_nextState];
						_x set [8,_time];
					};
				};
				case 5;
				case 6: {
					if ((_x select 8) > 1) then {
						_x set [8,((_x select 8) - 1)];
						_locPos = switch (_x select 7) do {case 5: {2}; case 6: {3};};
						// Check if Time <= (loaded crates / 3 + 1), then unload resources.  
					} else {
						_x set [2,[0,0,0]];
						_x set [3,[0,0,0]];
						_x set [4,[0,0,0]];
						_x set [5,[0,0,0]];
						_x set [6,[0,0,0]];
						_x set [7,0];
						_x set [8,-1];
					};
				};
				default {};
			};
		} forEach _tempLogistics;	

		KP_liberation_logistics = _tempLogistics;	
	};
	uiSleep 60;
};
