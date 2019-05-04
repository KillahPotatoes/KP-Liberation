/*
    KPLIB_fnc_resources_addActions

    File: fn_resources_addActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

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
if ((typeOf _object) in KPLIB_resources_crateClasses) then {
    // Add the crate to the crates array
    KPLIB_resources_allCrates pushBack _object;

    // Add check content action to crate
    [
        _object,
        "STR_KPLIB_ACTION_CHECKCRATE",
        [{[_this select 0] call KPLIB_fnc_resources_checkCrate;}, nil, -500, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];

    // Add push action to crate
    [
        _object,
        "STR_KPLIB_ACTION_PUSHCRATE",
        [{[_this select 0] call KPLIB_fnc_resources_pushCrate;}, nil, -501, false, false, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];

    // Add store action to crate
    [
        _object,
        "STR_KPLIB_ACTION_STORECRATE",
        [{[_this select 0] call KPLIB_fnc_resources_storeCrate;}, nil, -502, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];

    // Add load to transport action to crate
    [
        _object,
        "STR_KPLIB_ACTION_LOADCRATE",
        [{[_this select 0] call KPLIB_fnc_resources_loadCrate;}, nil, -503, false, true, "", "isNull attachedTo _target", 4],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];
};

// Storage actions
if ((typeOf _object) in KPLIB_resources_storageClasses) then {
    // Add the storage to the storages array
    KPLIB_resources_allStorages pushBack _object;

    // Unstore resource crate actions
    {
        [
            _object,
            "STR_KPLIB_ACTION_UNSTORE" + (toUpper _x),
            [{[_this select 0, _this select 3] call KPLIB_fnc_resources_unstoreCrate;}, _x, -500 - _forEachIndex, false, true, "", "", 10],
            "#FFFF00"
        ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];
    } forEach ["Supply", "Ammo", "Fuel"];

    // Stack and Sort action for storage
    [
        _object,
        "STR_KPLIB_ACTION_STACKNSORT",
        [{[_this select 0] call KPLIB_fnc_resources_stackNsort;}, nil, -503, false, false, "", "", 10],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, _object];
};

true
