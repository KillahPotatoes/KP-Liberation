/*
    File: fn_getLocalCap.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the current blufor unit cap.

    Parameter(s):
        NONE

    Returns:
        Blufor unit cap [NUMBER]
*/

(round (infantry_cap / 2)) min GRLIB_blufor_cap
