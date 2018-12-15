/*
    KPLIB_fnc_res_storeCrate

    File: fn_res_storeCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-15
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
private _nearStorage = nearestObjects [_crate, [KPLIB_preset_storageLargeF, KPLIB_preset_storageSmallF], 20];

// Exit if no storages near
if (_nearStorage isEqualTo []) exitWith {
    hint localize "STR_KPLIB_HINT_NOSTORAGENEAR";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Select nearest storage
_nearStorage = _nearStorage select 0;

// Get storage position array depending on storage type
private _attachPosition = switch (typeOf _nearStorage) do {
    case KPLIB_preset_storageLargeE;
    case KPLIB_preset_storageLargeF: {KPLIB_storage_largeOffsets};
    case KPLIB_preset_storageSmallE;
    case KPLIB_preset_storageSmallF: {KPLIB_storage_smallOffsets};
};

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

// Set the height offset for the crate type
private _zOffset = switch (typeOf _crate) do {
    case KPLIB_preset_crateSupplyE;
    case KPLIB_preset_crateSupplyF: {0.4};
    case KPLIB_preset_crateAmmoE;
    case KPLIB_preset_crateAmmoF: {0.6};
    case KPLIB_preset_crateFuelE;
    case KPLIB_preset_crateFuelF: {0.3};
};

// Attach crate to storage
_crate attachTo [_nearStorage, [(_attachPosition select 0), (_attachPosition select 1), _zOffset]];

// TODO: We need to test, if this on/off is really necessary.
// [_crate, false] remoteExecCall ["enableRopeAttach", true];

true
