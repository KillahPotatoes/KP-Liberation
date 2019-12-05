/*
    File: fn_crGetMulti.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2019-12-04
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current multiplier of the civilian reputation.

    Parameter(s):
        NONE

    Returns:
        Reputation multiplier [NUMBER]
*/

3 min (floor (abs (KP_liberation_civ_rep / 25)))
