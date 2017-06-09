waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KP_liberation_logistics"};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic management started on: %1", debug_source];_text remoteExec ["diag_log",2];};

while {GRLIB_endgame == 0} do {

	if (((count allPlayers) > 0) && ((count KP_liberation_logistics) > 0)) then {
		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic interval started: %1", time];_text remoteExec ["diag_log",2];};
		
		private ["_tempLogistics","_locPos","_locRes","_storage_areas","_toProcess","_currentIndex","_processed","_space","_crate","_supplyValue","_ammoValue","_fuelValue","_maxGetSupply","_maxGetAmmo","_maxGetFuel","_getSupply","_getAmmo","_getFuel","_i","_nextState","_time"];
		
		_tempLogistics = +KP_liberation_logistics;

		{
			switch (_x select 7) do {
				case 0: {};
				case 1;
				case 3: {
					if ((_x select 8) > 1) then {
						switch (_x select 7) do {case 1: {_locPos = 2; _locRes = 4;}; case 3: {_locPos = 3; _locRes = 5;};};
						switch (_x select 9) do {case 2: {_x set [9,0];}; case 3: {_x set [9,1];};};
						_storage_areas = nearestObjects [(_x select _locPos), [KP_liberation_small_storage_building, KP_liberation_large_storage_building], GRLIB_fob_range];

						if (((_x select 9) == 0) && !((_x select 6) isEqualTo [0,0,0])) then {

							if ((count (_storage_areas)) == 0) exitWith {_x set [9,2];};

							_toProcess = ceil ((ceil (((_x select 6) select 0) / 100)) + (ceil (((_x select 6) select 1) / 100)) + (ceil (((_x select 6) select 2) / 100)));
							if (_toProcess > 3) then {_toProcess = 3;};
							_spaceSum = 0;
							{
								if (typeOf _x == KP_liberation_large_storage_building) then {
									_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
								};
								if (typeOf _x == KP_liberation_small_storage_building) then {
									_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
								};
							} forEach _storage_areas;

							if (_spaceSum < _toProcess) exitWith {_x set [9,2];};
							
							_x set [8,((_x select 8) - 1)];
							_currentIndex = _forEachIndex;
							_processed = 0;
							while {_processed < _toProcess} do {
								{
									_space = 0;
									if (typeOf _x == KP_liberation_large_storage_building) then {
										_space = (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
									};
									if (typeOf _x == KP_liberation_small_storage_building) then {
										_space = (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
									};

									if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 0) > 0)) then {
										if ((floor ((((_tempLogistics select _currentIndex) select 6) select 0) / 100)) > 0) then {
											_crate = KP_liberation_supply_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", 100, true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[(((_tempLogistics select _currentIndex) select 6) select 0) - 100,
												(((_tempLogistics select _currentIndex) select 6) select 1),
												(((_tempLogistics select _currentIndex) select 6) select 2)]
											];
										} else {
											_crate = KP_liberation_supply_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 0), true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[0,
												(((_tempLogistics select _currentIndex) select 6) select 1),
												(((_tempLogistics select _currentIndex) select 6) select 2)]
											];
										};
										_processed = _processed + 1;
										_space = _space - 1;
									};
									if (_processed >= _toProcess) exitWith {};

									if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 1) > 0)) then {
										if ((floor ((((_tempLogistics select _currentIndex) select 6) select 1) / 100)) > 0) then {
											_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", 100, true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[(((_tempLogistics select _currentIndex) select 6) select 0),
												(((_tempLogistics select _currentIndex) select 6) select 1) - 100,
												(((_tempLogistics select _currentIndex) select 6) select 2)]
											];
										} else {
											_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 1), true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[(((_tempLogistics select _currentIndex) select 6) select 0),
												0,
												(((_tempLogistics select _currentIndex) select 6) select 2)]
											];
										};
										_processed = _processed + 1;
										_space = _space - 1;
									};
									if (_processed >= _toProcess) exitWith {};

									if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 2) > 0)) then {
										if ((floor ((((_tempLogistics select _currentIndex) select 6) select 2) / 100)) > 0) then {
											_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", 100, true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[(((_tempLogistics select _currentIndex) select 6) select 0),
												(((_tempLogistics select _currentIndex) select 6) select 1),
												(((_tempLogistics select _currentIndex) select 6) select 2) - 100]
											];
										} else {
											_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
											_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 2), true];
											[_crate, 500] remoteExec ["F_setMass",_crate];
											[_crate, _x] call F_crateToStorage;
											(_tempLogistics select _currentIndex) set [6,
												[(((_tempLogistics select _currentIndex) select 6) select 0),
												(((_tempLogistics select _currentIndex) select 6) select 1),
												0]
											];
										};
										_processed = _processed + 1;
										_space = _space - 1;
									};
									if (_processed >= _toProcess) exitWith {};
								} forEach _storage_areas;
							};
							please_recalculate = true;
							if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
						} else {
							_x set [9,1];
							if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
						};

						if (((_x select 9) == 1) && !((_x select _locRes) isEqualTo [0,0,0])) then {

							if ((count (_storage_areas)) == 0) exitWith {_x set [9,3];};

							_supplyValue = 0;
							_ammoValue = 0;
							_fuelValue = 0;
							
							{
								{
									switch ((typeOf _x)) do {
										case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable ["KP_liberation_crate_value",0]);};
										case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable ["KP_liberation_crate_value",0]);};
										case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable ["KP_liberation_crate_value",0]);};
										default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
									};
								} forEach (attachedObjects _x);
							} forEach _storage_areas;

							_toProcess = ceil ((ceil (((_x select _locRes) select 0) / 100)) + (ceil (((_x select _locRes) select 1) / 100)) + (ceil (((_x select _locRes) select 2) / 100)));
							if (_toProcess > 3) then {_toProcess = 3;};

							_maxGetSupply = ((_x select _locRes) select 0);
							if (_maxGetSupply > 300) then {_maxGetSupply = 300;};
							_maxGetAmmo = ((_x select _locRes) select 1);
							if (_maxGetAmmo > 300) then {_maxGetAmmo = 300;};
							_maxGetFuel = ((_x select _locRes) select 2);
							if (_maxGetFuel > 300) then {_maxGetFuel = 300;};

							_getSupply = 0;
							_getAmmo = 0;
							_getFuel = 0;
							_i = 0;
							private _j = 0;

							while {(_i < _toProcess) && (_j < _toProcess)} do {
								if ((_maxGetSupply - _getSupply) > 0) then {
									if ((floor ((_maxGetSupply - _getSupply) / 100)) > 0) then {
										if ((_supplyValue - _getSupply) >= 100) then {
											_getSupply = _getSupply + 100;
											_i = _i + 1;
										};
									} else {
										if ((_maxGetSupply - _getSupply) <= (_supplyValue - _getSupply)) then {
											_getSupply = _maxGetSupply;
											_i = _i + 1;
										};
									};
								};
								if (((_maxGetAmmo - _getAmmo) > 0) && (_i < _toProcess)) then {
									if ((floor ((_maxGetAmmo - _getAmmo) / 100)) > 0) then {
										if ((_ammoValue - _getAmmo) >= 100) then {
											_getAmmo = _getAmmo + 100;
											_i = _i + 1;
										};
									} else {
										if ((_maxGetAmmo - _getAmmo) <= (_ammoValue - _getAmmo)) then {
											_getAmmo = _maxGetAmmo;
											_i = _i + 1;
										};
									};
								};
								if (((_maxGetFuel - _getFuel) > 0) && (_i < _toProcess)) then {
									if ((floor ((_maxGetFuel - _getFuel) / 100)) > 0) then {
										if ((_fuelValue - _getFuel) >= 100) then {
											_getFuel = _getFuel + 100;
											_i = _i + 1;
										};
									} else {
										if ((_maxGetFuel - _getFuel) <= (_fuelValue - _getFuel)) then {
											_getFuel = _maxGetFuel;
											_i = _i + 1;
										};
									};
								};
								_j = _j + 1;
							};

							if ((_j == _toProcess) && (_i != _toProcess)) exitWith {_x set [9,3];};

							_x set [_locRes,[((_x select _locRes) select 0) - _getSupply,((_x select _locRes) select 1) - _getAmmo,((_x select _locRes) select 2) - _getFuel]];
							_x set [6,[((_x select 6) select 0) + _getSupply,((_x select 6) select 1) + _getAmmo,((_x select 6) select 2) + _getFuel]];
							_x set [8,((_x select 8) - 1)];

							{
								private _storage_positions = [];
								private _storedCrates = (attachedObjects _x);
								reverse _storedCrates;

								{
									private _crateValue = _x getVariable ["KP_liberation_crate_value",0];

									switch ((typeOf _x)) do {
										case KP_liberation_supply_crate: { 
											if (_getSupply > 0) then {
												if (_crateValue > _getSupply) then {
													_crateValue = _crateValue - _getSupply;
													_x setVariable ["KP_liberation_crate_value", _crateValue, true];
													_getSupply = 0;
												} else {
													detach _x;
													deleteVehicle _x;
													_getSupply = _getSupply - _crateValue;
												};
											};
										};
										case KP_liberation_ammo_crate: {
											if (_getAmmo > 0) then {
												if (_crateValue > _getAmmo) then {
													_crateValue = _crateValue - _getAmmo;
													_x setVariable ["KP_liberation_crate_value", _crateValue, true];
													_getAmmo = 0;
												} else {
													detach _x;
													deleteVehicle _x;
													_getAmmo = _getAmmo - _crateValue;
												};
											};
										};
										case KP_liberation_fuel_crate: {
											if (_getFuel > 0) then {
												if (_crateValue > _getFuel) then {
													_crateValue = _crateValue - _getFuel;
													_x setVariable ["KP_liberation_crate_value", _crateValue, true];
													_getFuel = 0;
												} else {
													detach _x;
													deleteVehicle _x;
													_getFuel = _getFuel - _crateValue;
												};
											};
										};
										default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
									};
								} forEach _storedCrates;
								
								switch (typeOf _x) do {
									case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions;};
									case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions;};
									default {_storage_positions = KP_liberation_large_storage_positions;};
								};

								private _area = _x;
								_i = 0;
								{
									_height = 0.6;
									switch (typeOf _x) do {
										case KP_liberation_supply_crate: {_height = 0.4;};
										case KP_liberation_ammo_crate: {_height = 0.6;};
										case KP_liberation_fuel_crate: {_height = 0.3;};
										default {_height = 0.6;};
									};
									detach _x;
									_x attachTo [_area, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
									_i = _i + 1;
								} forEach attachedObjects (_x);

								if ((_getSupply == 0) && (_getAmmo == 0) && (_getFuel == 0)) exitWith {};
								
							} forEach _storage_areas;

							if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
						};
					} else {
						if (((_x select 4) isEqualTo [0,0,0]) && ((_x select 5) isEqualTo [0,0,0]) && ((_x select 6) isEqualTo [0,0,0])) then {
							_x set [2, [0,0,0]];
							_x set [3, [0,0,0]];
							_nextState = 0;
							_time = -1;
						} else {
							_nextState = switch (_x select 7) do {case 1: {2}; case 3: {4};};
							_time = ceil (((_x select 2) distance2D (_x select 3)) / 400);
						};

						_x set [7,_nextState];
						_x set [8,_time];
						_x set [9,0];

						if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
					};
				};
				case 2;
				case 4: {
					if ((_x select 8) > 1) then {
						_x set [8,((_x select 8) - 1)];

						if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};

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

						if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
					};
				};
				case 5;
				case 6: {
					if ((_x select 8) > 1) then {
						_locPos = switch (_x select 7) do {case 5: {2}; case 6: {3};};
						_x set [9,0];
						_storage_areas = nearestObjects [(_x select _locPos), [KP_liberation_small_storage_building, KP_liberation_large_storage_building], GRLIB_fob_range];

						if ((count (_storage_areas)) == 0) exitWith {_x set [9,2];};

						_toProcess = ceil ((ceil (((_x select 6) select 0) / 100)) + (ceil (((_x select 6) select 1) / 100)) + (ceil (((_x select 6) select 2) / 100)));
						if (_toProcess > 3) then {_toProcess = 3;};
						_spaceSum = 0;
						{
							if (typeOf _x == KP_liberation_large_storage_building) then {
								_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
							};
							if (typeOf _x == KP_liberation_small_storage_building) then {
								_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
							};
						} forEach _storage_areas;

						if (_spaceSum < _toProcess) exitWith {_x set [9,2];};
						
						_x set [8,((_x select 8) - 1)];
						_currentIndex = _forEachIndex;
						_processed = 0;
						while {_processed < _toProcess} do {
							{
								_space = 0;
								if (typeOf _x == KP_liberation_large_storage_building) then {
									_space = (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
								};
								if (typeOf _x == KP_liberation_small_storage_building) then {
									_space = (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
								};

								if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 0) > 0)) then {
									if ((floor ((((_tempLogistics select _currentIndex) select 6) select 0) / 100)) > 0) then {
										_crate = KP_liberation_supply_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", 100, true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[(((_tempLogistics select _currentIndex) select 6) select 0) - 100,
											(((_tempLogistics select _currentIndex) select 6) select 1),
											(((_tempLogistics select _currentIndex) select 6) select 2)]
										];
									} else {
										_crate = KP_liberation_supply_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 0), true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[0,
											(((_tempLogistics select _currentIndex) select 6) select 1),
											(((_tempLogistics select _currentIndex) select 6) select 2)]
										];
									};
									_processed = _processed + 1;
									_space = _space - 1;
								};
								if (_processed >= _toProcess) exitWith {};

								if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 1) > 0)) then {
									if ((floor ((((_tempLogistics select _currentIndex) select 6) select 1) / 100)) > 0) then {
										_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", 100, true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[(((_tempLogistics select _currentIndex) select 6) select 0),
											(((_tempLogistics select _currentIndex) select 6) select 1) - 100,
											(((_tempLogistics select _currentIndex) select 6) select 2)]
										];
									} else {
										_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 1), true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[(((_tempLogistics select _currentIndex) select 6) select 0),
											0,
											(((_tempLogistics select _currentIndex) select 6) select 2)]
										];
									};
									_processed = _processed + 1;
									_space = _space - 1;
								};
								if (_processed >= _toProcess) exitWith {};

								if ((_space > 0) && ((((_tempLogistics select _currentIndex) select 6) select 2) > 0)) then {
									if ((floor ((((_tempLogistics select _currentIndex) select 6) select 2) / 100)) > 0) then {
										_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", 100, true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[(((_tempLogistics select _currentIndex) select 6) select 0),
											(((_tempLogistics select _currentIndex) select 6) select 1),
											(((_tempLogistics select _currentIndex) select 6) select 2) - 100]
										];
									} else {
										_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
										_crate setVariable ["KP_liberation_crate_value", (((_tempLogistics select _currentIndex) select 6) select 2), true];
										[_crate, 500] remoteExec ["F_setMass",_crate];
										[_crate, _x] call F_crateToStorage;
										(_tempLogistics select _currentIndex) set [6,
											[(((_tempLogistics select _currentIndex) select 6) select 0),
											(((_tempLogistics select _currentIndex) select 6) select 1),
											0]
										];
									};
									_processed = _processed + 1;
									_space = _space - 1;
								};
								if (_processed >= _toProcess) exitWith {};
							} forEach _storage_areas;
						};
						please_recalculate = true;

						if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
					} else {
						_x set [2,[0,0,0]];
						_x set [3,[0,0,0]];
						_x set [4,[0,0,0]];
						_x set [5,[0,0,0]];
						_x set [6,[0,0,0]];
						_x set [7,0];
						_x set [8,-1];

						if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic Group Update: %1", _x];_text remoteExec ["diag_log",2];};
					};
				};
				default {};
			};
		} forEach _tempLogistics;	

		KP_liberation_logistics = +_tempLogistics;

		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Logistic interval finished: %1", time];_text remoteExec ["diag_log",2];};
	};
	uiSleep 60;
};
