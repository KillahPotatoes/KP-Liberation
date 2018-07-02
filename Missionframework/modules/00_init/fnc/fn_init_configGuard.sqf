/*
    KPLIB_fnc_init_configGuard

    File: fn_init_configGuard.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-19
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes validationNamespace for config verification.
    After mission start checks if all defined config variables are "true" (valid) if any config is not valid then mission is interrupted.

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
                // We can't use our params vars here as this will be ran before all other functions
if(!isServer || (["DebugConfigGuard", 1] call BIS_fnc_getParamValue) == 0) exitWith {};

// Create validation namespace on server
KPLIB_validationNamespace = call KPLIB_fnc_common_createNamespace;

// Config
KPLIB_validationNamespace setVariable ["config", false];
// Arsenal
if (KPLIB_preset_arsenal > 0) then {KPLIB_validationNamespace setVariable ["arsenal", false];};
// Presets
KPLIB_validationNamespace setVariable ["blufor", false];
KPLIB_validationNamespace setVariable ["opfor", false];
KPLIB_validationNamespace setVariable ["civilians", false];
KPLIB_validationNamespace setVariable ["resistance", false];

// Delay all checks unitl all initialization is done
[] spawn {
    waitUntil{time > 0 && count call KPLIB_fnc_common_getAllPlayers > 0};
    diag_log "[KP LIBERATION] [CFG GUARD] Validating configuration files";

    // Get array of variables to check
    private _toValidate = allVariables KPLIB_validationNamespace;
    // If there is any "false" variable this means one of the guarded config files is invalid
    private _invalidConfig = (_toValidate findIf {!(KPLIB_validationNamespace getVariable _x)}) != -1;

    if(_invalidConfig) exitWith {
        diag_log "[KP LIBERATION] [CFG GUARD] Invalid configuration files present. Ending mission for everyone";

        "KPLIB_configError" call BIS_fnc_endMissionServer;
    };

    diag_log "[KP LIBERATION] [CFG GUARD] All configuration files seem to be OK";
};
