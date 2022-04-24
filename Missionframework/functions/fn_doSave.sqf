/*
    File: fn_doSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2020-05-08
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Save mission state to profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Data was saved [BOOL]
*/

if (!isServer) exitWith {false};

// Write data to FileXT storage
// Param 0: (string) Filename
// Param 1: (string) Save data
fnc_saveFileXT = {
    private _file = _this select 0;
    private _data = _this select 1;
    [_file] call filext_fnc_open; 
    [_file, "Data", _data] call filext_fnc_set;
    [_file] call filext_fnc_write;
    [_file] call filext_fnc_close;
};

// Write data in the server profileNamespace
// Param 0: (string) Variable name
// Param 1: (string) Save data
fnc_saveProfileNamespace = {
    private _variable = _this select 0;
    private _data = _this select 1;
    profileNamespace setVariable [_variable, _data];
    saveProfileNamespace;
};

if (!KPLIB_init) exitWith {
    ["Framework is not initalized, skipping save!", "SAVE"] call KPLIB_fnc_log;
    false
};

if (missionNamespace getVariable ["kp_liberation_saving", false]) exitWith {
    ["Saving already in progress, skipping save!", "SAVE"] call KPLIB_fnc_log;
    false
};

kp_liberation_saving = true;

private _saveData = [] call KPLIB_fnc_getSaveData;

// Check if FileXT is available
if (isClass(configFile >> "CfgPatches" >> "filext")) then {
    [GRLIB_save_key + ".savedata", str _saveData] call fnc_saveFileXT;
} else { 
    [GRLIB_save_key, str _saveData] call fnc_saveProfileNamespace;
};

kp_liberation_saving = false;

true
