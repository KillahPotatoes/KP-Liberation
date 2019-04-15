/*
    KPLIB_fnc_init_configGuard

    File: fn_init_configGuard.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-19
    Last Update: 2019-04-15
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

    diag_log format ["[KP LIBERATION] [%1] [CFG GUARD] Validating configuration files...", diag_tickTime];

    // Get array of variables to check
    private _toValidate = allVariables KPLIB_validationNamespace;
    // If there is any "false" variable this means one of the guarded config files is invalid
    private _invalidConfig = (_toValidate findIf {!(KPLIB_validationNamespace getVariable _x)}) != -1;

    if(_invalidConfig) exitWith {
        diag_log format ["[KP LIBERATION] [%1] [CFG GUARD] Invalid configuration files present. Ending mission for everyone", diag_tickTime];

        "KPLIB_configError" call BIS_fnc_endMissionServer;
    };

    diag_log format ["[KP LIBERATION] [%1] [CFG GUARD] Configuration files are valid", diag_tickTime];

    diag_log "[KP LIBERATION] [MISSIONSTART] --- MISSION INFORMATION ---";
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Missionfile: %1", (localize "STR_KPLIB_TITLE")];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] World Name: %1", worldName];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Version: %1", (localize "STR_KPLIB_VERSION")];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Author: %1", [missionConfigFile] call BIS_fnc_overviewAuthor];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Blufor: %1", KPLIB_preset_NameF];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Opfor: %1", KPLIB_preset_NameE];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Resistance: %1", KPLIB_preset_NameR];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Civilians: %1", KPLIB_preset_NameC];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] Arsenal: %1", KPLIB_param_presetArsenal];
    diag_log format ["[KP LIBERATION] [MISSIONSTART] ACE: %1", KPLIB_ace_enabled];
};

true
