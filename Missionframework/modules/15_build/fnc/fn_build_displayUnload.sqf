#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_displayUnload

    File: fn_build_displayUnload.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle build display unload

    Parameter(s):
        _display - Build display [DISPLAY, defaults to displayNull]

    Returns:
        Display was unloaded [BOOL]
*/

params [
    ["_display", displayNull, [displayNull]]
];

["KPLIB_build_display_close", [_display]] call CBA_fnc_localEvent;

true
