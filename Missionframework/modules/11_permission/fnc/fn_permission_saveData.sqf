/*
    KPLIB_fnc_permission_saveData

    File: fn_permission_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Permission module saving...";};

// Set module data to save and send it to the global save data array
["permission",
    [
        KPLIB_permission_list,
        KPLIB_permission_default
    ]
] call KPLIB_fnc_init_setSaveData;

true
