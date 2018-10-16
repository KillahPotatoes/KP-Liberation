#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_displayUnload

    File: fn_build_displayUnload.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-09-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle build display unload

    Parameter(s):
        0: DISPLAY - Build display

    Returns:
    NOTHING
*/
params [["_display", nil, [displayNull]]];

systemChat "onUnload";
