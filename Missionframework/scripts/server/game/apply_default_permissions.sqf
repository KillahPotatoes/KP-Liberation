if ( !GRLIB_permissions_param ) exitWith {};

private [ "_default_permissions", "_all_players_uids", "_old_count" ];

waitUntil { !(isNil "GRLIB_permissions") };
waitUntil { !isNil "save_is_loaded" };

while { true } do {

	_default_permissions = [];
	{ if ( ( _x select 0 ) == "Default" ) exitWith { _default_permissions = (_x select 1); } } foreach GRLIB_permissions;

	if ( count _default_permissions > 0 ) then {
		_all_players_uids = [];
		{ if ( ( _x select 0 ) != "Default" ) then { _all_players_uids pushback (_x select 0) } } foreach GRLIB_permissions;

		_old_count = count GRLIB_permissions;
		{
			if ( !( (name _x) in [ "HC1", "HC2", "HC3" ] ) ) then {
				if ( !((getPlayerUID _x) in _all_players_uids) ) then {
					GRLIB_permissions pushback [ (getPlayerUID _x), _default_permissions ];
				};
			};
		} foreach allPlayers;

		if ( _old_count != count GRLIB_permissions ) then {
			publicVariable "GRLIB_permissions"
		};
	};

	sleep 10;

};