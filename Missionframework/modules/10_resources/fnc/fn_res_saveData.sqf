/*
    KPLIB_fnc_res_saveData

    File: fn_res_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Resources module saving...";};

private _storageSave = [];

private ["_class", "_pos", "_vector", "_resources"];
{
    // General data of the storage
    _class = typeOf _x;
    _pos = getPosWorld _x;
    _vector = [vectorDir _x, vectorUp _x];
    _resources = [_x] call KPLIB_fnc_res_getStorageValue;

    // Add to the save array
    _storageSave pushBack [_class, _pos, _vector, _resources select 0, _resources select 1, _resources select 2];
} forEach KPLIB_res_allStorages;

// Set module data to save and send it to the global save data array
["resources",
    [
        _storageSave,
        KPLIB_res_intel
    ]
] call KPLIB_fnc_init_setSaveData;

true
