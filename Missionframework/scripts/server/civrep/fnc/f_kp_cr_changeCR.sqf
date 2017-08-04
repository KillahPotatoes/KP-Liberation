params ["_amount", "_negative"];

if (_negative) then {
	KP_liberation_civ_rep = KP_liberation_civ_rep - _amount;
} else {
	KP_liberation_civ_rep = KP_liberation_civ_rep + _amount;
};
