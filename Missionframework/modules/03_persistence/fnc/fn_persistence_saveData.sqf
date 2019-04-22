/*
    KPLIB_fnc_persistence_saveData

    File: fn_persistence_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_savedebug) then {["Persistence module saving...", "SAVE"] call KPLIB_fnc_common_log;};

KPLIB_persistence_objects = KPLIB_persistence_objects - [objNull];
KPLIB_persistence_units = KPLIB_persistence_units select {alive _x};

// Set module data to save and send it to the global save data array
["persistence", [
    KPLIB_persistence_objects apply {[_x call KPLIB_fnc_persistence_serializeObject, _x call KPLIB_fnc_persistence_serializeVars]},
    KPLIB_persistence_units apply {[_x call KPLIB_fnc_persistence_serializeUnit, _x call KPLIB_fnc_persistence_serializeVars]}
]] call KPLIB_fnc_init_setSaveData;

true
