params [ "_unit"];

private _side = side _unit;

if ( !(GRLIB_autodanger) && (_side == GRLIB_side_friendly)) then {
	_unit disableAI "AUTOCOMBAT";
};

(group _unit) allowFleeing 0;
