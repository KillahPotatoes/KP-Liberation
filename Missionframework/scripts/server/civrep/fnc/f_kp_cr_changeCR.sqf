params ["_amount", "_negative"];

if (_negative) then {
	KP_liberation_civ_rep = KP_liberation_civ_rep - _amount;
	if (KP_liberation_civ_rep < -100) then {KP_liberation_civ_rep = -100;};
} else {
	KP_liberation_civ_rep = KP_liberation_civ_rep + _amount;
	if (KP_liberation_civ_rep > 100) then {KP_liberation_civ_rep = 100;};
};
