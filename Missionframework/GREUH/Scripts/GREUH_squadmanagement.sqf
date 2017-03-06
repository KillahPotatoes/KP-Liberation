groups_list = [];
squadaction = "";
squadname = "";
if (isNil "global_group_ids") then { global_group_ids = [] };
if (isNil "global_groups_renamed") then { global_groups_renamed = [] };

global_new_leader = [];

while { true } do {

	if ( squadaction != "" ) then {
		_grp = grpNull;
		switch (squadaction) do {
			case "create" : {
				_grp = createGroup (side player);
				[player] join _grp;
				hint "New squad created";
			};
			case "join" : {
				if(lbCurSel 515 != -1) then { _grp = groups_list select (lbCurSel 515); };
				if (!(isNull _grp) && (_grp != group player)) then {
					[player] join _grp;
					hint "Squad joined";
				};
			};
			case "rename" : {
				if ( leader group player == player ) then {
					renaming = true;
					ctrlSetText [527, (groupid (group player))];
					waitUntil { ((squadaction == "") || (squadname != "") || !(dialog) || !(alive player)) };
					if ( alive player && dialog && ( squadname != "" )) then {
						if ( (group player) in global_groups_renamed ) then {
							global_group_ids set [global_groups_renamed find (group player),squadname];
						} else {
							global_group_ids = global_group_ids + [squadname];
							global_groups_renamed = global_groups_renamed + [group player];
						};
						publicVariable "global_group_ids";
						publicVariable "global_groups_renamed";
					};
					squadname = "";
					renaming = false;
				} else {
					hint "Sorry, only the squad leader can rename their squad.";
				};
			};
			case "leader" : {
				if ( leader group player == player ) then {
					choosingleader = true;
					choose_squadleader = -10;

					_player_group_filtered = [];
					{
						if ( isPlayer _x ) then {
							_player_group_filtered = _player_group_filtered + [_x];
						};
					} foreach (units group player);

					lbClear 567;
					{

						lbAdd [567, name _x ];
					} foreach _player_group_filtered;

					_count_units_grp_player = count (units group player);
					waitUntil { ((squadaction == "") || (choose_squadleader >= 0) || !(dialog) || !(alive player) || (_count_units_grp_player != count (units group player))) };
					if ( alive player && dialog && ( choose_squadleader >= 0 )) then {
						global_new_leader = [group player, _player_group_filtered select choose_squadleader];
						publicVariable "global_new_leader";
					};
					choose_squadleader = -10;
					choosingleader = false;
				} else {
					hint "Sorry, only the squad leader can choose a new leader.";
				};
			};
		};
		squadaction = "";
	};

	{ if ( (isplayer leader _x) && (side _x == side player) && !(_x in groups_list)) then { groups_list = groups_list + [_x] }; } foreach allGroups;
	{ if (!(_x in allGroups) || (!isplayer leader _x)) then { groups_list = groups_list - [_x] }; } foreach groups_list;

	{
		if (count global_groups_renamed != 0) then {
			if (_x in global_groups_renamed) then {
				if (groupid _x != global_group_ids select (global_groups_renamed find _x)) then {
					_x setgroupid [(global_group_ids select (global_groups_renamed find _x))];
				};
			};
		};
	} foreach groups_list;

	if ( count global_new_leader != 0 ) then {
		if ( group player == global_new_leader select 0 ) then {
			(global_new_leader select 0) selectLeader (global_new_leader select 1);
			hint format ["%1 is your new squad leader.",name (global_new_leader select 1)];
			global_new_leader = [];
		};
	};

	sleep 0.5;

};

