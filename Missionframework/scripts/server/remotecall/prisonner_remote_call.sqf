params [ "_unit" ];
private [ "_yield", "_resistance_prisonner_intel_yield", "_csat_prisonner_ammo_yield" ];

_resistance_prisonner_intel_yield = 3;
_csat_prisonner_intel_yield = 6;

if ( isServer ) then {
	_yield = _csat_prisonner_intel_yield;
	if ( ( typeof _unit ) in all_resistance_troops ) then {
		_yield = _resistance_prisonner_intel_yield;
	};
	resources_intel = resources_intel + ( _yield + (round (random _yield)));
	stats_prisonners_captured = stats_prisonners_captured + 1;

	[ [ 0 ] , "remote_call_intel" ] call BIS_fnc_MP;
};