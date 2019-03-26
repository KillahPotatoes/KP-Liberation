/*
    KPLIB_fnc_persistence_addPersistentVar

    File: fn_persistence_addPersistentVar.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-26
    Last Update: 2019-03-26
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Add object variable to persistence system.
        Variable should contain simple data only. (no objects etc.)

    Parameter(s):
        _variableName - Name of variable which should be saved [STRING]

    Returns:
        Variable was added to persistence system [BOOL]
*/
params [
    ["_variableName", nil, [""]],
    ["_global", false, [false]]
];

if (isNil "_variableName") exitWith {false};
// Prevent overwrites and warn
if (KPLIB_persistenceSavedVars findIf {_x#0 == _variableName} != -1) exitWith {
    diag_log text format ["[KP LIBERATION] [SAVE] [WARNING] Variable '%1' was already in persistence system!", _variableName];
};

KPLIB_persistenceSavedVars pushBack [_variableName, _global];

true
