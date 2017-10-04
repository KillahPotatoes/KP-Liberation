params [ "_unit"];

private _side = side _unit;
private _wounded = false;
(group _unit) allowFleeing 0;
if ( damage _unit > 0.25 ) then { _wounded = true; };

private _skillmodifier = sqrt GRLIB_difficulty_modifier;
private _inVehicle = false;
if ( vehicle _unit != _unit ) then {
	_inVehicle = true;
};

if ( !(GRLIB_autodanger) && (_side == GRLIB_side_friendly)) then {
	_unit disableAI "AUTOCOMBAT";
};

if ( _wounded ) then {
	_unit setSkill ["aimingspeed", [ 0.15 * _skillmodifier ] call F_limitSkill ];
	if ( !_inVehicle ) then {
		_unit setSkill ["aimingaccuracy", [ 0.03 * _skillmodifier ] call F_limitSkill ];
	};
	_unit setSkill ["aimingshake", 0];
	_unit setSkill ["spottime", 0.5];
	_unit setSkill ["spotdistance", 0.25];
	_unit setSkill ["commanding", 0.1];
	_unit setSkill ["reloadSpeed", 0.1];
} else {
	if ( _side == GRLIB_side_friendly || _side == GRLIB_side_enemy ) then {
		_unit setSkill ["aimingspeed", [ 0.35 * _skillmodifier ] call F_limitSkill];
		if ( _inVehicle ) then {
			_unit setSkill ["aimingaccuracy", [ 0.65 * _skillmodifier ] call F_limitSkill];
		} else {
			_unit setSkill ["aimingshake", [ 0.35 * _skillmodifier ] call F_limitSkill];
		};
		_unit setSkill ["spottime", [ 0.5 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spotdistance", [ 0.5 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["commanding", 0.5];
		_unit setSkill ["reloadSpeed", 0.7];
	} else {
		_unit setSkill ["aimingspeed", [ 0.35 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingaccuracy", [ 0.25 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["aimingshake", [ 0.35 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spottime", [ 0.5 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["spotdistance", [ 0.5 * _skillmodifier ] call F_limitSkill];
		_unit setSkill ["commanding", 0.5];
		_unit setSkill ["reloadSpeed", 0.5];
	};
};