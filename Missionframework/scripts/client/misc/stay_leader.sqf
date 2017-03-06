if ( !GRLIB_teamkill_penalty ) then {
	while { true } do {
		waitUntil {
			sleep 1;
			!(isPlayer (leader (group player))) && (local (group player))
		};

		(group player) selectLeader player;
	};
};