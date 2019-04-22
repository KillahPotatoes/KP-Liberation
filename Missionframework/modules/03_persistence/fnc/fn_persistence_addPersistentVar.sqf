/*
    KPLIB_fnc_persistence_addPersistentVar

    File: fn_persistence_addPersistentVar.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-26
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Add object variable to persistence system.
        Variable should contain simple data only. (no objects etc.)

    Parameter(s):
        _variableName   - Name of variable which should be saved [STRING]
        _global         - Is variable global [BOOL, defaults to false]

    Returns:
        Variable was added to persistence system [BOOL]
*/
params [
    ["_variableName", "", [""]],
    ["_global", false, [false]]
];

if (_variableName isEqualTo "") exitWith {false};

private _idx = KPLIB_persistenceSavedVars findIf {(_x select 0) == _variableName};
if (_idx != -1) exitWith {
    KPLIB_persistenceSavedVars set [_idx, [_variableName, _global]];
};

[format ["Variable '%1' added to persistence system", _variableName], ""] call KPLIB_fnc_common_log;

KPLIB_persistenceSavedVars pushBack [_variableName, _global];

true
