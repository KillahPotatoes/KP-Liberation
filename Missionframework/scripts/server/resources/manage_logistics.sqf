waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KP_liberation_logistics"};

private ["_tempLogistics","_locPos","_locRes","_nextState","_time"];

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
						// unload resources
						if (!((_x select 6) isEqualTo [0,0,0])) then {

						};
						// load resources
						if (!((_x select _locRes) isEqualTo [0,0,0])) then {

						};
					} else {
						_nextState = switch (_x select 7) do {case 1: {2}; case 3: {4};};
						_time = ceil (((_x select 2) distance2D (_x select 3)) / 400);

						_x set [7,_nextState];
						_x set [8,_time];
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
						if (_time > (_x select 1)) then {
							_time = (_x select 1);
						};

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
