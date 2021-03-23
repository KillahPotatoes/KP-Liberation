_allIED = allMines;
_allJunk = allMissionObjects "Land_Garbage_square5_F";

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
} foreach _allJunk;

maxMines = 8;
_headlessClients = entities "HeadlessClient_F";
_humanPlayers = allPlayers - _headlessClients;
_humanPlayers call BIS_fnc_arrayShuffle;

_firstRound = 1;
{
	_allIED = allMines;
	_countMines = count _allIED;
	_mineClassnames = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDLandSmall_Range","ACE_IEDUrbanSmall_Range"];
	
	_minesNearPlayer = 0;
	_player = _x;
	{
		if(isTouchingGround _player) then {
			_distance = _x distance _player;
			if(_distance < 2000) then {
			_minesNearPlayer = _minesNearPlayer + 1;
			};
		};
	} foreach allMines;

	
	if(_countMines < maxMines && isTouchingGround _x && _minesNearPlayer < 2) then {
		
		_nearestRoad = leader _x nearRoads 2000;
		_closeRoads = leader _x nearRoads 1000;
		_allowedRoads = _nearestRoad - _closeRoads;
			
		_count = count _allowedRoads;
		
		_rand = random _count;
		_rand = round _rand;
		
		_streetObject = _allowedRoads select _rand;
		_pos = getPos _streetObject;
		
		_checkPlayers = _streetObject nearEntities 500;
		_playerNear = 0;
		{
			if(side _x == west) then {
				_playerNear = 1;
			}
		} foreach _checkPlayers;
		
		if(_playerNear == 0) then {
			_randSpawnPos = _pos getPos [6 * sqrt random 1, random 360];
			_usedMine = selectRandom _mineClassnames;
			_mine = createMine [_usedMine, _randSpawnPos, [], 0];
		};
	};
} foreach _humanPlayers;

{
	_junkClassname = "Land_Garbage_square5_F";
	_allJunk = allMissionObjects _junkClassname;
	_countJunk = count _allJunk;
		
	_junkNearPlayer = 0;
	_player = _x;
	{
		if(isTouchingGround _player) then {
			_distance = _x distance _player;
			if(_distance < 2000) then {
			_junkNearPlayer = _junkNearPlayer + 1;
			};
		};
	} foreach _allJunk;
	
	if(_countJunk < 60 && _junkNearPlayer < 6) then {
		for "_i" from 1 to 2 do {
		_nearPlayer = _x nearRoads 2000;
		_count = count _nearPlayer;
		_rand = random _count;
		_rand = round _rand;
		_streetObject = _nearPlayer select _rand;
		_pos = getPos _streetObject;
		
		_checkPlayers = _streetObject nearEntities 500;
		_playerNear = 0;
		{
			if(side _x == west) then {
				_playerNear = 1;
			}
		} foreach _checkPlayers;
		
		if(_playerNear == 0) then {
			_randSpawnPos = _pos getPos [6 * sqrt random 1, random 360];
			
			_spawnJunk = createVehicle [_junkClassname, _randSpawnPos, [], 0, "CAN_COLLIDE"];
				{
					_x addCuratorEditableObjects [[_spawnJunk], true];
				} foreach allCurators;
			};
		};
	};
} foreach _humanPlayers;