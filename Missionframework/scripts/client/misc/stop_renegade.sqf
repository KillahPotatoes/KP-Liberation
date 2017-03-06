if ( !GRLIB_teamkill_penalty ) then {
	while { true } do {
		waitUntil { rating player < 0 };
		player addRating (abs (rating player));
		hint localize "STR_FRIENDLY_FIRE";
	};
};