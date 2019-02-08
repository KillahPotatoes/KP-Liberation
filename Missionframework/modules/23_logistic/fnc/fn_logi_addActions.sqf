/*
    KPLIB_fnc_logi_addActions

    File: fn_logi_addActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-01-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds all actions to the spawned logistic building.

    Parameter(s):
        _object - Spawned object to take care of [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_object", objNull, [objNull]]
];

if ((typeOf _object) isEqualTo KPLIB_logi_building) then {
    // Add main menu dialog action to object
    [
        _object,
        "STR_KPLIB_ACTION_LOGISTIC",
        [{[] call KPLIB_fnc_logi_openDialog;}, nil, -500, false, true, "", "", 4]
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
}
