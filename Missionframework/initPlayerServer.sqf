[] spawn {
	{
		waitUntil {time > 0};
		
		if (!isnil("commandant")) then {
			if (isnull(getAssignedCuratorLogic commandant)) then {
				unassignCurator zm1;
				sleep 2;
				commandant assignCurator zm1;
			};
		};
	} forEach allPlayers
};
