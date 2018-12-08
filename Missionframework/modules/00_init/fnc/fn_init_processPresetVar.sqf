/*
    KPLIB_fnc_init_processPresetVar

    File: fn_init_processPresetVar.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-08
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Processes a given preset variable by filtering for missing mods and adding the variable to the specific package.

    Parameter(s):
        _variable - Preset variable [STRING, defaults to ""]
        _suffix - Preset faction suffix [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_variable", "", [""]],
    ["_suffix", "", [""]]
];

if (!isServer) exitWith {false};

// Get basic variable
private _prstVar = missionNamespace getVariable (["KPLIB_preset_", _variable, _suffix] joinString "");

// Skip if the basic variable is not used or if it's name or alphabet
if !(isNil "_prstVar" || _variable isEqualTo "name" || _variable isEqualTo "alphabet") then {
    // Filter mods from arrays or check single classname for availability
    if (_prstVar isEqualType []) then {
        _prstVar = [_prstVar] call KPLIB_fnc_init_filterMods;
    } else {
        if !([_prstVar] call KPLIB_fnc_init_checkClass) then {
            KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedSingles", false];
        };
    };

    // Add filtered variable to package
    (missionNamespace getVariable ["KPLIB_preset_package" + _suffix, []]) pushBack [["KPLIB_preset_", _variable, _suffix] joinString "", _prstVar];
};

true
