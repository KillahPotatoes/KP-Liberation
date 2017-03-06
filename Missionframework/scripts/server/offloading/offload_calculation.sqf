if ( isNil "group_owners" ) then { group_owners = []; };

while { true } do {

	group_owners = [[gamelogic, "Server", owner gamelogic, 0, 0, 0]];

	{ _owner_name = group_owners pushback [_x, name _x, owner _x, 0, 0, 0]; } foreach allPlayers;

	{
		_currentgroup = _x;
		_group_owner = [];
		_idx_group_owner = -1;
		{
			if ( ( _x select 2 ) == groupOwner _currentgroup ) then {
				_group_owner = _x;
				_idx_group_owner = group_owners find _x;
			};

		} foreach group_owners;

		if ( count _group_owner > 0 ) then {
			if ( side _currentgroup == GRLIB_side_friendly ) then {
				group_owners set [_idx_group_owner, [_group_owner select 0, _group_owner select 1,_group_owner select 2, (_group_owner select 3) + (count units _currentgroup), (_group_owner select 4), (_group_owner select 5)]];
			};
			if ( side _currentgroup == GRLIB_side_enemy ) then {
				group_owners set [_idx_group_owner, [_group_owner select 0, _group_owner select 1,_group_owner select 2, (_group_owner select 3), (_group_owner select 4)  + (count units _currentgroup), (_group_owner select 5)]];
			};
			if ( side _currentgroup == GRLIB_side_civilian ) then {
				group_owners set [_idx_group_owner, [_group_owner select 0, _group_owner select 1,_group_owner select 2, (_group_owner select 3), (_group_owner select 4), (_group_owner select 5)  + (count units _currentgroup)]];
			};
		}

	} foreach allGroups;

	publicVariable "group_owners";

	sleep 5;
};