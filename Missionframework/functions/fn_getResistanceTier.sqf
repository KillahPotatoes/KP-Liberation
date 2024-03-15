/*
    File: fn_getResistanceTier.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2020-05-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current tier level of the resistance forces.

    Parameter(s):
        NONE

    Returns:
        Tier level [NUMBER]
*/

switch (true) do {
    case (KPLIB_guerilla_strength >= KPLIB_resistance_tier3): {3};
    case (KPLIB_guerilla_strength >= KPLIB_resistance_tier2): {2};
    default {1};
};
