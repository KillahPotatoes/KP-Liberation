/*
    KPLIB_fnc_res_loadCrate

    File: fn_res_loadCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads the given crate to nearest valid transport vehicle.

    Parameter(s):
        _crate - Crate which should be loaded [OBJECT, defaults to objNull]

    Returns:
        Crate loaded to transport vehicle [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

// Exit if we have no valid crate object
if !((typeOf _crate) in KPLIB_res_crateClasses) exitWith {false};

// Check for near transport vehicles
private _nearTransport = _crate nearEntities [KPLIB_res_transportVehicles, 10];

// Exit if no transport vehicles near
if (_nearTransport isEqualTo []) exitWith {
    hint localize "STR_KPLIB_HINT_NOTRANSPORTNEAR";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Select nearest transport vehicle
_nearTransport = _nearTransport select 0;

// Get attach position array depending on transport vehicle
private _attachPosition = (KPLIB_res_transportConfigs select (KPLIB_res_transportConfigs findIf {(_x select 0) isEqualTo (typeOf _nearTransport)})) select 2;

// Get amount of used slots
private _usedSlots = _nearTransport getVariable ["KPLIB_res_usedSlots", 0];

// Exit if the nearest storage has no more space
if (_usedSlots >= (count _attachPosition)) exitWith {
    hint localize "STR_KPLIB_HINT_NOSTORAGESPACE";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Load crate to transport and adjust usedSlots variable
_crate attachTo [_nearTransport, _attachPosition select _usedSlots];
_nearTransport setVariable ["KPLIB_res_usedSlots", _usedSlots + 1, true];

// Add unload action, if not already added to vehicle
if !(_nearTransport getVariable ["KPLIB_res_unloadAction", false]) then {
    [
        _nearTransport,
        "STR_KPLIB_ACTION_UNLOADCRATE",
        [{[_this select 0] call KPLIB_fnc_res_unloadCrate;}, nil, -500, false, true, "", "!((_target getVariable ['KPLIB_res_usedSlots', 0]) isEqualTo 0)", 10],
        "#FFFF00"
    ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

    _nearTransport setVariable ["KPLIB_res_unloadAction", true, true];
};

true
