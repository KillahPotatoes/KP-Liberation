/*
    KPLIB_fnc_enemy_saveData

    File: fn_enemy_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_savedebug) then {["Enemy module saving...", "SAVE"] call KPLIB_fnc_common_log;};

// Set module data to save and send it to the global save data array
["enemy",
    [
        KPLIB_enemy_strength,
        KPLIB_enemy_awareness,
        (diag_activeMissionFSMs select (diag_activeMissionFSMs findIf {(_x select 0) isEqualTo "KPLIB_enemyCommander"})) select 1
    ]
] call KPLIB_fnc_init_setSaveData;

true
