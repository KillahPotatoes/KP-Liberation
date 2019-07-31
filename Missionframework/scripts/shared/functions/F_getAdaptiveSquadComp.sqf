params [["_type","milita"]];

private _squadcomp = [];

if (_type == "army") then {
	private _specialists = false;
	private _randomchance = -55;
	_squadcomp = opfor_squad_8_standard;

	if (armor_weight > 40 && !_specialists) then {
		_randomchance = (armor_weight - 40) * 1.35;
		if ((random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_tankkillers;
		};
	};

	if (air_weight > 40 && !_specialists) then {
		_randomchance = (air_weight - 40) * 1.35;
		if ((random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_airkillers;
		};
	};

	if (infantry_weight > 40 && !_specialists) then {
		_randomchance = (infantry_weight - 40) * 1.35;
		if ((random 100) < _randomchance) then {
			_specialists = true;
			_squadcomp = opfor_squad_8_infkillers;
		};
	};
} else {
	private _multiplier = 1;
	if (GRLIB_unitcap < 1) then {_multiplier = GRLIB_unitcap;};
	while {count _squadcomp < (10 * _multiplier)} do {_squadcomp pushback (selectRandom militia_squad)};
};

_squadcomp
