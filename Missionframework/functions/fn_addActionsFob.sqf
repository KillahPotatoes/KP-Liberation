/*
    File: fn_addActionsFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-13
    Last Update: 2024-06-21
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds build action to FOB box and repackage action to FOB building.

    Parameter(s):
        _obj - FOB box/truck/building to add the deploy/repack action to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};

if (isNil "FOB_build_in_progress") then {FOB_build_in_progress = false;};

if ((typeOf _obj) isEqualTo KPLIB_b_fobBuilding) exitWith {
    _obj addAction [
        ["<t color='#FFFF00'>", localize "STR_FOB_REPACKAGE", "</t> <img size='2' image='res\ui_deployfob.paa'/>"] joinString "",
        "scripts\client\actions\do_repackage_fob.sqf",
        nil,
        -754,
        false,
        true,
        "",
        "isNull (objectParent _this) && {player getVariable ['KPLIB_hasDirectAccess', false]}",
        20
    ];
    true
};

if ((typeOf _obj) in [KPLIB_b_fobBox, KPLIB_b_fobTruck]) exitWith {
    _obj addAction [
        ["<t color='#FFFF00'>", localize "STR_FOB_ACTION", "</t> <img size='2' image='res\ui_deployfob.paa'/>"] joinString "",
        "scripts\client\build\do_build_fob.sqf",
        nil,
        -752,
        false,
        true,
        "",
        "isNull (objectParent _this) && {!FOB_build_in_progress} && {player getVariable ['KPLIB_hasDirectAccess', false] || {[3] call KPLIB_fnc_hasPermission}} && {player getVariable ['KPLIB_isAwayFromStart', false]} && {!(surfaceIsWater getPos player)}",
        10
    ];
    true
};

false
