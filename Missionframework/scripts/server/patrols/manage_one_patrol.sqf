params [ "_minimum_readiness", "_is_infantry" ];
private [ "_headless_client" ];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };

while { GRLIB_endgame == 0 } do {
	waitUntil { sleep 0.3; count blufor_sectors >= 3; };
	waitUntil { sleep 0.3; combat_readiness >= (_minimum_readiness / GRLIB_difficulty_modifier); };

	sleep (random 30);

	while {  [] call F_opforCap > GRLIB_patrol_cap } do {
			sleep (random 30);
	};

	_grp = grpNull;

	_spawn_marker = "";
	while { _spawn_marker == "" } do {
		_spawn_marker = [2000,5000,true] call F_findOpforSpawnPoint;
		if ( _spawn_marker == "" ) then {
			sleep (150 + (random 150));
		};
	};

	_sector_spawn_pos = [(((markerpos _spawn_marker) select 0) - 500) + (random 1000),(((markerpos _spawn_marker) select 1) - 500) + (random 1000),0];

	if (_is_infantry) then {
		_grp = createGroup [GRLIB_side_enemy, true];
		_squad = ["army"] call F_getAdaptiveSquadComp;
		{
			_x createUnit [_sector_spawn_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		} foreach _squad;
	} else {

		private [ "_vehicle_object" ];
		if ( (combat_readiness > 75) && ((random 100) > 85) ) then {
			_vehicle_object = [_sector_spawn_pos, selectRandom opfor_choppers] call F_libSpawnVehicle;
		} else {
			_vehicle_object = [_sector_spawn_pos, [] call F_getAdaptiveVehicle] call F_libSpawnVehicle;
		};

		sleep 0.5;
		_grp = group ((crew _vehicle_object) select 0);
	};

	[_grp] spawn patrol_ai;

	_started_time = time;
	_patrol_continue = true;

	if ( local _grp ) then {
		_headless_client = [] call F_lessLoadedHC;
		if ( !isNull _headless_client ) then {
			_grp setGroupOwner ( owner _headless_client );
		};
	};

	while { _patrol_continue } do {
		sleep 60;
		if ( count (units _grp) == 0  ) then {
			_patrol_continue = false;
		} else {
			if ( time - _started_time > 900 ) then {
				if ( [ getpos (leader _grp) , 4000 , GRLIB_side_friendly ] call F_getUnitsCount == 0 ) then {
					_patrol_continue = false;
					{
						if ( vehicle _x != _x ) then {
							[ (vehicle _x) ] call F_cleanOpforVehicle;
						};
						deleteVehicle _x;
					} foreach (units _grp);
				};
			};
		};
	};

	if ( !([] call F_isBigtownActive) ) then {
		sleep (600.0 / GRLIB_difficulty_modifier);
	};

};