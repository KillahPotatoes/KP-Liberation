/*
    File: fn_getAdaptiveVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Provides a vehicle classname depending on the combat readiness.

    Parameter(s):
        NONE

    Returns:
        Vehicle classname [STRING]
*/

selectRandom ([KPLIB_o_armyVehicles, KPLIB_o_armyVehiclesLight] select (combat_readiness < 40))
