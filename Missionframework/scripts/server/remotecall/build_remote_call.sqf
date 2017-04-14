if (!isServer) exitWith {};

params ["_price_s", "_price_a", "_price_f", "_typename", "_localtype"];

if ((_price_s > 0) || (_price_a > 0) || (_price_f > 0)) then {
	/* To be implemented
	resources_ammo = resources_ammo - _price_a;

	if ( _localtype == 8 ) then {
		stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 10;
	} else {
		if ( _typename isKindOf "Man" ) then {
			stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 1;
		} else {
			if ( ! ( _typename isKindOf "Building" ) ) then {
				stats_blufor_vehicles_built = stats_blufor_vehicles_built + 1;
			};
		};
	}; */

	stats_ammo_spent = stats_ammo_spent + _price_a;

	please_recalculate = true;
};
