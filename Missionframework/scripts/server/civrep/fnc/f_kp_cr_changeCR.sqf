params ["_amount", ["_negative", false]];

if (!isServer) exitWith {};

if (KPLIB_civrep_debug > 0) then {[format ["changeCR called - Parameters [%1, %2]", _amount, _negative], "CIVREP"] call KPLIB_fnc_log;};

if (_negative) then {
    KPLIB_civ_rep = KPLIB_civ_rep - _amount;
} else {
    KPLIB_civ_rep = KPLIB_civ_rep + _amount;
};

KPLIB_civ_rep = -100 max (KPLIB_civ_rep min 100);

// Set correct resistance standing
private _resistanceEnemy = [0, 1] select (KPLIB_civ_rep < 25);
private _resistanceFriendly = [0, 1] select (KPLIB_civ_rep >= -25);

KPLIB_side_resistance setFriend [KPLIB_side_enemy, _resistanceEnemy];
KPLIB_side_enemy setFriend [KPLIB_side_resistance, _resistanceEnemy];
KPLIB_side_resistance setFriend [KPLIB_side_player, _resistanceFriendly];
KPLIB_side_player setFriend [KPLIB_side_resistance, _resistanceFriendly];

if (KPLIB_civrep_debug > 0) then {[format ["changeCR finished - New value: %1", KPLIB_civ_rep], "CIVREP"] call KPLIB_fnc_log;};
if (KPLIB_civrep_debug > 0) then {[format ["%1 getFriend %2: %3 - %1 getFriend %4: %5", KPLIB_side_resistance, KPLIB_side_enemy, (KPLIB_side_resistance getFriend KPLIB_side_enemy), KPLIB_side_player, (KPLIB_side_resistance getFriend KPLIB_side_player)], "CIVREP"] call KPLIB_fnc_log;};
