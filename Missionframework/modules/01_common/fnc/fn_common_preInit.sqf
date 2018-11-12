/*
    KPLIB_fnc_common_preInit

    File: fn_common_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

// Cache for getIcon function
KPLIB_common_iconCache = [] call CBA_fnc_createNamespace;

true
