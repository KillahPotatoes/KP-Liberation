#include "script_component.hpp"
/*
    KPLIB_fnc_permission_saveData

    File: fn_permission_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_savedebug) then {["Permission module saving...", "SAVE"] call KPLIB_fnc_common_log;};

// Set module data to save and send it to the global save data array
["permission",
    [
        (PGVAR("permissionList", [])),
        (PGVAR("permissionDefault", []))
    ]
] call KPLIB_fnc_init_setSaveData;

true
