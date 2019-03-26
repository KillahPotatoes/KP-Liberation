/*
    KPLIB_fnc_example_saveData

    File: fn_example_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-03-26
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Persistence module saving..."};

// Set module data to save and send it to the global save data array
["persistence", [
    ([KPLIB_persistenceHash, "objects"] call CBA_fnc_hashGet) apply {[_x call KPLIB_fnc_persistence_serializeObject]},
    ([KPLIB_persistenceHash, "units"] call CBA_fnc_hashGet) apply {[_x call KPLIB_fnc_persistence_serializeUnit]}
]] call KPLIB_fnc_init_setSaveData;

true
