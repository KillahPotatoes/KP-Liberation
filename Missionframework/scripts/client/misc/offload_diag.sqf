private [ "_hint_string" ];

if ( isNil "group_owners" ) then { group_owners = []; };

while { true } do {

	if ( GRLIB_offload_diag ) then {

		_hint_string = "";
		{
			_hint_string = _hint_string + format ["%1 %2 %3 %4<br/>", _x select 1, _x select 3, _x select 4, _x select 5];
		} foreach group_owners;

		hintSilent parseText _hint_string;
	};

	sleep 5;
};