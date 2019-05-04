/*
    KPLIB_fnc_example_saveData

    File: fn_example_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
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

if (KPLIB_param_savedebug) then {["Example module saving...", "SAVE"] call KPLIB_fnc_common_log;};

// Set module data to save and send it to the global save data array
["example",
    [

    ]
] call KPLIB_fnc_init_setSaveData;

true
