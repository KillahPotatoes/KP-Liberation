private [ "_blufor_ai_groups", "_localgroup", "_is_ai_only", "_commander" ];

while { GRLIB_endgame == 0 } do {

	_commander = [] call F_getCommander;

	if ( !(isNull _commander ) ) then {

		_blufor_ai_groups = [];

		{
			if ( side _x == GRLIB_side_friendly ) then {
				_localgroup = _x;
				_is_ai_only = true;

				{ if ( isPlayer _x ) then { _is_ai_only = false; }; } foreach units _localgroup;

				if ( _is_ai_only ) then { _blufor_ai_groups pushback _localgroup };

			};
		} foreach ( [ allGroups, { groupOwner _x != owner _commander } ] call BIS_fnc_conditionalSelect );

		if ( count _blufor_ai_groups > 0 ) then {
			{
				if ( ( ( leader _x ) distance startbase ) > 500 && ( groupOwner _x != owner _commander ) ) then {
					_x setGroupOwner (owner _commander);
					sleep 1;
				};
			} foreach _blufor_ai_groups;
		};
	};

	sleep 15;
};