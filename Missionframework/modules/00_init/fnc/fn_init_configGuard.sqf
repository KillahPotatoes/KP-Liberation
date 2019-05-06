/*
    KPLIB_fnc_init_configGuard

    File: fn_init_configGuard.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-19
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Initializes validationNamespace for config verification.
        After mission start checks if all defined config variables are "true" (valid) if any config is not valid then mission is interrupted.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// The config validation happens only on the server
if(!isServer) exitWith {};

// Create validation namespace on server
KPLIB_validationNamespace = [] call CBA_fnc_createNamespace;

// Config
KPLIB_validationNamespace setVariable ["config", false];
// Arsenal
if (KPLIB_param_presetArsenal > 0) then {KPLIB_validationNamespace setVariable ["arsenal", false];};
// Presets
KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedC", false];
KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedE", false];
KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedF", false];
KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedR", false];
KPLIB_validationNamespace setVariable ["KPLIB_preset_checkedSingles", true];

// Delay all checks until all initializations are done
[] spawn {
    waitUntil {
        (time > 0) &&
        ((count ([] call CBA_fnc_players)) > 0)
    };

    ["Validating configuration files...", "CFG GUARD", true] call KPLIB_fnc_common_log;

    // Get array of variables to check
    private _toValidate = allVariables KPLIB_validationNamespace;
    // If there is any "false" variable this means one of the guarded config files is invalid
    private _invalidConfig = (_toValidate findIf {!(KPLIB_validationNamespace getVariable _x)}) != -1;

    // End mission on invalid config
    if(_invalidConfig) exitWith {
        ["Invalid configuration files present. Ending mission for everyone", "CFG GUARD", true] call KPLIB_fnc_common_log;
        "KPLIB_configError" call BIS_fnc_endMissionServer;
    };

    ["Configuration files are valid", "CFG GUARD", true] call KPLIB_fnc_common_log;

    // Display mission information
    ["------------------------------------", "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Name: %1", (localize "STR_KPLIB_TITLE")], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["World: %1", worldName], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Version: %1", (localize "STR_KPLIB_VERSION")], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Author: %1", [missionConfigFile] call BIS_fnc_overviewAuthor], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Blufor: %1", KPLIB_preset_nameF], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Opfor: %1", KPLIB_preset_nameE], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Resistance: %1", KPLIB_preset_nameR], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Civilians: %1", KPLIB_preset_nameC], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["Arsenal: %1",
        [
            localize "STR_KPLIB_SETTINGS_ARSENAL_ARSENAL_0",
            localize "STR_KPLIB_SETTINGS_ARSENAL_ARSENAL_1",
            localize "STR_KPLIB_SETTINGS_ARSENAL_ARSENAL_2"
        ] select KPLIB_param_presetArsenal
    ], "MISSIONSTART"] call KPLIB_fnc_common_log;
    [format ["ACE: %1", KPLIB_ace_enabled], "MISSIONSTART"] call KPLIB_fnc_common_log;
    ["------------------------------------", "MISSIONSTART"] call KPLIB_fnc_common_log;
};

true
