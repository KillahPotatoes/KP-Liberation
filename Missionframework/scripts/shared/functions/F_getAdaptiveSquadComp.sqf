private [ "_squadcomp", "_specialists", "_randomchance" ];

if ( isNil 'infantry_weight' ) then { infantry_weight = 33 };
if ( isNil 'armor_weight' ) then { armor_weight = 33 };
if ( isNil 'air_weight' ) then { air_weight = 33 };

_squadcomp = opfor_squad_8_standard;
_specialists = false;

if ( !isNil 'combat_readiness' ) then {
	if ( combat_readiness < 35 ) then {
		_squadcomp = opfor_squad_low_intensity;
		_specialists = true;
	};
};

if ( armor_weight > 40 && !_specialists) then {
	_randomchance = (armor_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_tankkillers;
	};
};

if ( air_weight > 40 && !_specialists) then {
	_randomchance = (air_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_airkillers;
	};
};

if ( infantry_weight > 40 && !_specialists) then {
	_randomchance = (infantry_weight - 40) * 1.35;
	if ( (random 100) < _randomchance) then {
		_specialists = true;
		_squadcomp = opfor_squad_8_infkillers;
	};
};

_squadcomp
