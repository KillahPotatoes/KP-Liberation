/*
    KPLIB_fnc_init_setupConfig

    File: fn_init_setupConfig.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-01
    Last Update: 2018-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Fetches all mission parameters to global variables
    Also reads the KPLIB_config.sqf

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

diag_log format ["[KP LIBERATION] [PRE INIT] ----- Time: %1 - Config initialization started -----", diag_tickTime];

// Check for ACE
KPLIB_ace_enabled = isClass (configFile >> "CfgVehicles" >> "ACE_module");
KPLIB_ace_medical = isClass (configfile >> "CfgPatches" >> "ace_medical");

KPLIB_param_source = ["LoadSaveParams", 1] call BIS_fnc_getParamValue;

// Skip params fetching on clients
// preInit unscheduled environment should guarnantee that this is run on server first
if(isServer) then {
    call KPLIB_fnc_init_paramsFetch;

    KPLIB_initSetupDone = true;
    publicVariable "KPLIB_initSetupDone";
};
// Read the KPLIB_config.sqf file
call compile preprocessFileLineNumbers "KPLIB_config.sqf";

diag_log format ["[KP LIBERATION] [PRE INIT] ----- Time: %1 - Config initialization finished -----", diag_tickTime];

true
