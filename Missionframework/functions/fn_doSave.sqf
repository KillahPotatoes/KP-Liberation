/*
    File: fn_doSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2020-05-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Save mission state to profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Data was saved [BOOL]
*/

if (!isServer) exitWith {false};

if (!KPLIB_init) exitWith {
    ["Framework is not initalized, skipping save!", "SAVE"] call KPLIB_fnc_log;
    false
};

if (missionNamespace getVariable ["KPLIB_saving", false]) exitWith {
    ["Saving already in progress, skipping save!", "SAVE"] call KPLIB_fnc_log;
    false
};

KPLIB_saving = true;

private _saveData = [] call KPLIB_fnc_getSaveData;

// Write data in the server profileNamespace
profileNamespace setVariable [KPLIB_save_key, str _saveData];
saveProfileNamespace;

KPLIB_saving = false;

true
