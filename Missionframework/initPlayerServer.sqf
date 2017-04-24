{
	if (!isnil("commandant")) then {
		if (isnull(getAssignedCuratorLogic commandant)) then {
			unassignCurator zm1;
			sleep 2;
			commandant assignCurator zm1;
		};
	};

	// Force player into GRLIB_side_friendly
	if((side _x) != GRLIB_side_friendly) then {
		_friendlySideGroup = createGroup GRLIB_side_friendly; 
		[_x] joinSilent _friendlySideGroup; 
	}

} forEach allPlayers