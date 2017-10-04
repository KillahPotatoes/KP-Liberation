params ["_amount", "_negative"];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] changeCR called on: %1 - Parameters [%2, %3]", debug_source, _amount, _negative];_text remoteExec ["diag_log",2];};

if (_negative) then {
	KP_liberation_civ_rep = KP_liberation_civ_rep - _amount;
} else {
	KP_liberation_civ_rep = KP_liberation_civ_rep + _amount;
};

if (KP_liberation_civ_rep < -100) then {KP_liberation_civ_rep = -100;};
if (KP_liberation_civ_rep > 100) then {KP_liberation_civ_rep = 100;};

if (KP_liberation_civ_rep <= -25) then {
	GRLIB_side_resistance setFriend [GRLIB_side_enemy, 1];
	GRLIB_side_enemy setFriend [GRLIB_side_enemy, 1];
	GRLIB_side_resistance setFriend [GRLIB_side_friendly, 0];
	GRLIB_side_friendly setFriend [GRLIB_side_friendly, 0];
};
if (KP_liberation_civ_rep > -25 && KP_liberation_civ_rep < 25) then {
	GRLIB_side_resistance setFriend [GRLIB_side_enemy, 1];
	GRLIB_side_enemy setFriend [GRLIB_side_enemy, 1];
	GRLIB_side_resistance setFriend [GRLIB_side_friendly, 1];
	GRLIB_side_friendly setFriend [GRLIB_side_friendly, 1];
};
if (KP_liberation_civ_rep >= 25) then {
	GRLIB_side_resistance setFriend [GRLIB_side_friendly, 1];
	GRLIB_side_friendly setFriend [GRLIB_side_friendly, 1];
	GRLIB_side_resistance setFriend [GRLIB_side_enemy, 0];
	GRLIB_side_enemy setFriend [GRLIB_side_enemy, 0];
};

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] changeCR finished on: %1 - New value: %2", debug_source, KP_liberation_civ_rep];_text remoteExec ["diag_log",2];};
