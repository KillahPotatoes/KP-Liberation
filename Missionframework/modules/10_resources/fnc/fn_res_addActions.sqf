/*
    KPLIB_fnc_res_addActions

    File: fn_res_addActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds all actions to the resource crates and resource storages upon spawning.

    Parameter(s):
        _object - Spawned object to take care of [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_object", objNull, [objNull]]
];

// Crate actions
if ((typeOf _object) in KPLIB_res_crateClasses) then {
    // Add the crate to the crates array
    KPLIB_res_allCrates pushBack _object;

    // Add check content action to crate
    [
        _object,
        "STR_KPLIB_ACTION_CHECKCRATE",
        [{[_this select 0] call KPLIB_fnc_res_checkCrate;}, nil, -500, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

    // Add push action to crate
    [
        _object,
        "STR_KPLIB_ACTION_PUSHCRATE",
        [{[_this select 0] call KPLIB_fnc_res_pushCrate;}, nil, -501, false, false, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

    // Add store action to crate
    [
        _object,
        "STR_KPLIB_ACTION_STORECRATE",
        [{[_this select 0] call KPLIB_fnc_res_storeCrate;}, nil, -502, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

    // Add load to transport action to crate
    [
        _object,
        "STR_KPLIB_ACTION_LOADCRATE",
        [{[_this select 0] call KPLIB_fnc_res_loadCrate;}, nil, -503, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
};

// Storage actions
if ((typeOf _object) in KPLIB_res_storageClasses) then {
    // Add the storage to the storages array
    KPLIB_res_allStorages pushBack _object;

    // Unstore resource crate actions
    {
        [
            _object,
            "STR_KPLIB_ACTION_UNSTORE" + (toUpper _x),
            [{[_this select 0, _this select 3] call KPLIB_fnc_res_unstoreCrate;}, _x, -500 - _forEachIndex, false, true, "", "", 10],
            "#FFFF00"
        ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
    } forEach ["Supply", "Ammo", "Fuel"];

    // Stack and Sort action for storage
    [
        _object,
        "STR_KPLIB_ACTION_STACKNSORT",
        [{[_this select 0] call KPLIB_fnc_res_stackNsort;}, nil, -503, false, false, "", "", 10],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
};

true
