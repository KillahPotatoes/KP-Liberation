/*
    KPLIB Preset Script Component

    File: script_component.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-23
    Last Update: 2018-11-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Contains all preprocessor commands for the preset processing.
*/

// Generates a KPLIB preset variable
#define KPLIBPRSTVAR(VARIABLE)\
    "KPLIB_preset_" + VARIABLE + (if (_isFriendly) then {"F"} else {"E"})

// Gets the value of a KPLIB preset variable
#define KPLIBPRSTGETVAR(VARIABLE)\
    missionnamespace getVariable [KPLIBPRSTVAR(VARIABLE), nil]

// Sets the value of a KPLIB preset variable
#define KPLIBPRSTSETVAR(VARIABLE,CLASS)\
    missionnamespace setVariable [KPLIBPRSTVAR(VARIABLE), CLASS]

// Creates a KPLIB preset array
#define KPLIBPRSTARCREATE(ARRAYNAME)\
    missionnamespace setVariable [KPLIBPRSTVAR(ARRAYNAME), []];

// Adds a classname to a preset array with resource costs
#define KPLIBPRSTARADD(ARRAYNAME, UNITCLASS, RESSUPPLY, RESAMMO, RESFUEL)\
    (KPLIBPRSTGETVAR(ARRAYNAME)) pushBack [UNITCLASS, RESSUPPLY, RESAMMO, RESFUEL]

// Creates a plain classname array from a preset array with building costs
#define KPLIBPRSTARPLAIN(ARRAYOLD, ARRAYNEW)\
    KPLIBPRSTARCREATE(ARRAYNEW);\
    {(KPLIBPRSTGETVAR(ARRAYNEW)) pushBack (_X select 0);} forEach (KPLIBPRSTGETVAR(ARRAYOLD))
