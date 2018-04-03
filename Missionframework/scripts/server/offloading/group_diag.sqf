waitUntil {sleep 1; !isNil "active_sectors"};

while {true} do {
	uiSleep 600;
	
	diag_log format ["[KP LIBERATION] [GROUPCHECK] ----- Groupcheck for %1 groups started at %2 -----", count allGroups, time];
	diag_log "[KP LIBERATION] [GROUPCHECK] Groups which aren't marked for deletion when empty:";
	
	private _markedgroups = 0;
	
	{		
		private _groupOwner = groupOwner _x;
		private _owner = "Server";

		if (_groupOwner != 2) then {
			_owner = name ((allPlayers select {_groupOwner == (owner _x)}) select 0);
		};
		
		if !(isGroupDeletedWhenEmpty _x) then {
			if (local _x) then {
				_x deleteGroupWhenEmpty true;
			} else {
				[_x, true] remoteExec ["deleteGroupWhenEmpty", groupOwner _x];
			};
			_markedgroups = _markedgroups + 1;
			
			diag_log format ["[KP LIBERATION] [GROUPCHECK] %1 - Owner: %2 - Units: %3 - Marked now: %4 - Side: %5",
			groupId _x,
			_owner,
			count (units _x),
			isGroupDeletedWhenEmpty _x,
			side _x];
		};	
	} forEach allGroups;

	if (_markedgroups == 0) then {
		diag_log "[KP LIBERATION] [GROUPCHECK] No groups found.";
	};
	
	diag_log format ["[KP LIBERATION] [GROUPCHECK] ----- Groupcheck finished at %1 - Groups marked: %2 -----", time, _markedgroups];
};
