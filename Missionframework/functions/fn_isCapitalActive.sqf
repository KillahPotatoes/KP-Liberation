/*
    File: fn_isCapitalActive.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-05-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks if a capital is currently activated.

    Parameter(s):
        NONE

    Returns:
        Capital currently activated [BOOL]
*/

(KPLIB_sectors_active findIf {_x in KPLIB_sectors_capital}) != -1
