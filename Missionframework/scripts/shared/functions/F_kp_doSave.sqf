/*
    File: F_kp_doSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2020-03-29
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
    diag_log "[KP LIBERATION] [SAVE] Saving already in progress, skipping save!";
};

kp_liberation_saving = true;

private _saveData = [] call F_getSaveData;

// Write data in the server profileNamespace
profileNamespace setVariable [GRLIB_save_key, _saveData];
saveProfileNamespace;

kp_liberation_saving = false;

true
