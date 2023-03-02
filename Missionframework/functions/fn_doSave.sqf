/*
    File: fn_doSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-29
    Last Update: 2023-03-02
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Save mission state to profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Data was saved [BOOL]
*/

if (!isServer) exitWith {false};

// Write data to the FileXT storage, or failing that, the server profileNamespace
// Param 0: (string) File/Variable name
// Param 1: (string) Save data
fnc_saveData = {
    params [
        ["_name", "", [""]],
        ["_data", nil, []]
    ];

    // Check if FileXT is available
    if (isClass(configFile >> "CfgPatches" >> "filext")) then {  
        [format ["Saving '%1' to FileXT.", _name], "SAVE"] call KPLIB_fnc_log;
        _file = format ["%1.savedata", _name];
        [_file] call filext_fnc_open; 
        [_file, "Data", _data] call filext_fnc_set;
        [_file] call filext_fnc_write;
        [_file] call filext_fnc_close;
    } else {
        [format ["Fallback - Saving '%1' to Profile Namespace.", _name], "SAVE"] call KPLIB_fnc_log;
        profileNamespace setVariable [_name, _data];
        saveProfileNamespace;
    };
};

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

[KPLIB_save_key, str _saveData] call fnc_saveData;

KPLIB_saving = false;

true
