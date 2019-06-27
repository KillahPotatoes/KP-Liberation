#include "script_component.hpp"
/*
    KPLIB_fnc_mission_saveData

    File: fn_mission_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-21
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_savedebug) then {["Mission module saving...", "SAVE"] call KPLIB_fnc_common_log;};

// Modify the data which will be saved
private _timeData = (MGVAR("timeCheck", [])) apply {[_x select 0, (_x select 1) - diag_tickTime]};

// Set module data to save and send it to the global save data array
["mission",
    [
        _timeData
    ]
] call KPLIB_fnc_init_setSaveData;

true
