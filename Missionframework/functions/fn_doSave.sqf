/*
    File: fn_doSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2020-04-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Save mission state to profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Data was saved [BOOL]
*/

if (!isServer) exitWith {};

if (missionNamespace getVariable ["kp_liberation_saving", false]) exitWith {
    ["Saving already in progress, skipping save!", "PRESETS"] call KPLIB_fnc_log;
};

kp_liberation_saving = true;

private _saveData = [] call KPLIB_fnc_getSaveData;

// Write data in the server profileNamespace
profileNamespace setVariable [GRLIB_save_key, str _saveData];
saveProfileNamespace;

kp_liberation_saving = false;

true
