waitUntil { !(isNil "GRLIB_player_scores") };
waitUntil { !isNil "save_is_loaded" };

while { true } do {

	{
		if ( ( _x getVariable [ "GRLIB_score_set", 0 ] ) == 0 ) then {

			_x setVariable [ "GRLIB_score_set", 1, false ];

			private [ "_nextplayer" ];
			_nextplayer = _x;
			{
				if ( (getPlayerUID _nextplayer) == (_x select 0) ) exitWith {
					_nextplayer addScore ((_x select 1) - (score _nextplayer));
				};
			} foreach GRLIB_player_scores;
		};
	} foreach allPlayers;

	sleep 15;
};