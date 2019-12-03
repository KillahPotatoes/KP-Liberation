/*
    File: fn_getResistanceTier.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current tier level of the resistance forces.

    Parameter(s):
        NONE

    Returns:
        Tier level [NUMBER]
*/
// TODO
private _return = 1;

if (KP_liberation_guerilla_strength >= KP_liberation_resistance_tier2) then {
	_return = 2;
};

if (KP_liberation_guerilla_strength >= KP_liberation_resistance_tier3) then {
	_return = 3;
};

_return
