/*
    KPLIB_fnc_common_preInit

    File: fn_common_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-11-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        This preInit function defines global variables which are added due to this module.

    Dependencies:
        * 02_core

    Returns:
        Module was initialized [BOOL]
*/

// Cache for getIcon function
KPLIB_common_iconCache = [] call CBA_fnc_createNamespace;

true
