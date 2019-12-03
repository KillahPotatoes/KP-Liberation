/*
    File: fn_crGetMulti.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current level of the civil reputation. (positive or negative)

    Parameter(s):
        NONE

    Returns:
        Reputation level [NUMBER]
*/
// TODO
private _reputation = if (KP_liberation_civ_rep < 0) then {KP_liberation_civ_rep * -1} else {KP_liberation_civ_rep};
private _return = floor (_reputation / 25);
if (_return == 4) then {_return = 3;};
_return
