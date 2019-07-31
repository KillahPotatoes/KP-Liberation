params ["_amount", ["_negative", false]];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] changeCR called on: %1 - Parameters [%2, %3]", debug_source, _amount, _negative];_text remoteExec ["diag_log",2];};

if (_negative) then {
	KP_liberation_civ_rep = KP_liberation_civ_rep - _amount;
} else {
	KP_liberation_civ_rep = KP_liberation_civ_rep + _amount;
};

KP_liberation_civ_rep = -100 max (KP_liberation_civ_rep min 100);

// Set correct resistance standing
private _resistanceEnemy = [0, 1] select (KP_liberation_civ_rep < 25);
private _resistanceFriendly = [0, 1] select (KP_liberation_civ_rep >= -25);

GRLIB_side_resistance setFriend [GRLIB_side_enemy, _resistanceEnemy];
GRLIB_side_enemy setFriend [GRLIB_side_resistance, _resistanceEnemy];
GRLIB_side_resistance setFriend [GRLIB_side_friendly, _resistanceFriendly];
GRLIB_side_friendly setFriend [GRLIB_side_resistance, _resistanceFriendly];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] changeCR finished on: %1 - New value: %2", debug_source, KP_liberation_civ_rep];_text remoteExec ["diag_log",2];};
if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] %1 getFriend %2: %3 - %1 getFriend %4: %5", GRLIB_side_resistance, GRLIB_side_enemy, (GRLIB_side_resistance getFriend GRLIB_side_enemy), GRLIB_side_friendly, (GRLIB_side_resistance getFriend GRLIB_side_friendly)];_text remoteExec ["diag_log",2];};
