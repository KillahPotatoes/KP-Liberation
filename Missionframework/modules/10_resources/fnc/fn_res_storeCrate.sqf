/*
    KPLIB_fnc_res_storeCrate

    File: fn_res_storeCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Stores the crate in a nearby storage area.

    Parameter(s):
        _crate - Crate which should be stored [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

// Exit if we have no valid crate object
if !((typeOf _crate) in KPLIB_res_crateClasses) exitWith {false};

// Check for near storages
private _nearStorage = nearestObjects [_crate, KPLIB_res_storageClasses, 20];

// Exit if no storages near
if (_nearStorage isEqualTo []) exitWith {
    hint localize "STR_KPLIB_HINT_NOSTORAGENEAR";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Select nearest storage
_nearStorage = _nearStorage select 0;

// Get storage position array depending on storage type
private _attachPosition = [typeOf _nearStorage] call KPLIB_fnc_res_getAttachArray;

// Get number of already stored crates
private _attachedCrates = count (attachedObjects _nearStorage);

// Exit if the nearest storage has no more space
if (_attachedCrates >= (count _attachPosition)) exitWith {
    hint localize "STR_KPLIB_HINT_NOSTORAGESPACE";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Get the correct attachTo position from the array
_attachPosition = _attachPosition select _attachedCrates;

// Attach crate to storage
_crate attachTo [_nearStorage, [
    (_attachPosition select 0),
    (_attachPosition select 1),
    [typeOf _crate] call KPLIB_fnc_res_getCrateZ
]];

// TODO: We need to test, if this on/off is really necessary.
// [_crate, false] remoteExecCall ["enableRopeAttach", true];

true
