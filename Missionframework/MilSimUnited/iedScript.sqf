while {true} do {	
	_allIED = allMines;
	_allmarker = allMissionObjects "Land_HelipadEmpty_F";
	
	{
		_playerActive = 0;
		_list = _x nearEntities 2500;
		
		{
			if(side _X == west) then {
				_playerActive = 1;
			}
		} foreach _list;
		
		if(_playerActive == 0) then {
			deleteVehicle _x;
		}
	} foreach _allIED;
	
	{
		_playerActive = 0;
		_list = _x nearEntities 2500;
		
		{
			if(side _X == west) then {
				_playerActive = 1;
			};
		} foreach _list;
		
		if(_playerActive == 0) then {
			deleteVehicle _x;
		};
	} foreach _allmarker;
	
	_headlessClients = entities "HeadlessClient_F";
	_humanPlayers = allPlayers - _headlessClients;
	_countPlayers = count _humanPlayers;
	hint format ["%1", _countPlayers];
	
	maxMines = 0;
	if(_countPlayers < 5) then {
		maxMines = 2;
	};
	if(_countPlayers > 5 && _countPlayers <= 15) then {
		maxMines = 4;
	};
	if(_countPlayers > 15 && _countPlayers <= 25) then {
		maxMines = 6;
	};
	if(_countPlayers > 25) then {
		maxMines = 8;
	};
		
	{
		if(side _x == west) then {
			_countMines = count _allIED;	
			if(_countMines < maxMines) then {
				_nearestRoad = leader _x nearRoads 2500;
				_count = count _nearestRoad;
				
				_rand = random _count;
				_rand = round _rand;
				
				_streetObject = _nearestRoad select _rand;
				_pos = getPos _streetObject;
				
				_randSpawnPos = _pos getPos [10 * sqrt random 1, random 360];
				
				_mineClassnames = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanSmall_Range"];
				_usedMine = selectRandom _mineClassnames;
				
				
				_mine = createMine [_usedMine, _randSpawnPos, [], 0];
				_veh = createVehicle ["Land_HelipadEmpty_F", _randSpawnPos, [], 0, "CAN_COLLIDE"];
				
				{
					_x addCuratorEditableObjects [[_veh], true];
				} foreach allCurators;
			};
		}
	} foreach allGroups;
	sleep 60;
}