/*
    KPLIB_fnc_init_configGuard

    File: fn_init_configGuard.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-19
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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
    waitUntil{time > 0 && count call CBA_fnc_players > 0};
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

    diag_log format [
        "[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Blufor: %4 - Opfor: %5 - Resistance: %6 - Civilians: %7 - Arsenal: %8 - ACE: %9",
        (localize "STR_KPLIB_TITLE"),
        worldName,
        (localize "STR_KPLIB_VERSION"),
        KPLIB_param_presetF,
        KPLIB_param_presetE,
        KPLIB_param_presetR,
        KPLIB_param_presetC,
        KPLIB_param_presetArsenal,
        KPLIB_ace_enabled
    ];
};

true
