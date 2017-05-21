if (!isServer) exitWith {};

{
	if (!isNil("commandant")) then {
		if (isNull(getAssignedCuratorLogic commandant)) then {
			unassignCurator zm1;
			sleep 2;
			commandant assignCurator zm1;
		};
	};
} forEach allPlayers;
