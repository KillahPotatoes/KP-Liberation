/*
    KPLIB_fnc_garrison_saveData

    File: fn_garrison_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_savedebug) then {["Garrison module saving...", "SAVE"] call KPLIB_fnc_common_log;};

// Set module data to save and send it to the global save data array
["garrison",
    [
        KPLIB_garrison_array
    ]
] call KPLIB_fnc_init_setSaveData;

true
