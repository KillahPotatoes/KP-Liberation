private [ "_nextveh" ];

while { true } do {

	{
		_nextveh = _x;
		if ( alive _nextveh && ( typeOf _nextveh ) in all_hostile_classnames ) then {
			if ( _nextveh getVariable [ "GRLIB_captured", 0 ] == 0 ) then {
				{
					if ( alive _x ) then {
						if ( side group _x == GRLIB_side_friendly ) exitWith {
							_nextveh setVariable [ "GRLIB_captured", 1, true ];
						};
					};
				} foreach (crew _x);
			};
		};

		sleep 0.2;

	} foreach vehicles;

	sleep 3;

};