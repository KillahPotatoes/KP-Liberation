_allIED = allMines;

{
	_playerActive = 0;
	_list = _x nearEntities 2000;
	
	{
		if(side _x == west) then {
			_playerActive = 1;
		}
	} foreach _list;
	
	if(_playerActive == 0) then {
		deleteVehicle _x;
	}
} foreach _allIED;

maxMines = 4;
_headlessClients = entities "HeadlessClient_F";
_humanPlayers = allPlayers - _headlessClients;
_humanPlayers call BIS_fnc_arrayShuffle;

{
	_allIED = allMines;
	_countMines = count _allIED;
		
	if(_countMines < maxMines && isTouchingGround _x) then {
		_nearestRoad = leader _x nearRoads 2000;
		_closeRoads = leader _x nearRoads 1000;
		_allowedRoads = _nearestRoad - _closeRoads;
			
		_count = count _allowedRoads;
		
		_rand = random _count;
		_rand = round _rand;
		
		_streetObject = _allowedRoads select _rand;
		_pos = getPos _streetObject;
		
		_randSpawnPos = _pos getPos [5 * sqrt random 1, random 360];
		
		_mineClassnames = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanSmall_Range"];
		_usedMine = selectRandom _mineClassnames;
					
		_mine = createMine [_usedMine, _randSpawnPos, [], 0];
	}
} foreach _humanPlayers;