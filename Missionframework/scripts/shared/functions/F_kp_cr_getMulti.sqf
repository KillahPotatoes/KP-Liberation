/*
F_kp_cr_getMulti.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-10-08

Description:
Returns the current level of the civil reputation (positive or negative)

Parameters:
NONE

Return:
INTEGER - Reputation level
*/

private _reputation = if (KP_liberation_civ_rep < 0) then {KP_liberation_civ_rep * -1} else {KP_liberation_civ_rep};
private _return = floor (_reputation / 25);
if (_return == 4) then {_return = 3;};
_return
