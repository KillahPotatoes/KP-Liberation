/*
    File: fn_crateFromStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-03-27
    Last Update: 2020-04-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Unloads given crate type from storage area.

    Parameter(s):
        _cratetype  - Crate type                [STRING, defaults to ""]
        _storage    - Storage                   [OBJECT, defaults to objNull]
        _update     - Update sector resources   [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_cratetype", "", [""]],
    ["_storage", objNull, [objNull]],
    ["_update", false, [false]]
];

// Validate parameters
if !((toLower _cratetype) in KPLIB_crates) exitWith {["Invalid craty type given: %1", _cratetype] call BIS_fnc_error; false};
if (isNull _storage) exitWith {["Null object given"] call BIS_fnc_error; false};

// Get correct storage positions
([_storage] call KPLIB_fnc_getStoragePositions) params ["_storagePositions", "_unloadDist"];

// Check for next empty unload position
private _i = 0;
private _dir = (getDir _storage) - 180;
private _unloadPos = _storage getPos [_unloadDist, _dir];
while {!((nearestObjects [_unloadPos, KPLIB_crates, 1]) isEqualTo [])} do {
    _i = _i + 1;
    _unloadPos = _storage getPos [_unloadDist + _i * 1.8, _dir];
};

// Fetch all stored crates
private _storedCrates = attachedObjects _storage;
reverse _storedCrates;
private _crate = _storedCrates deleteAt (_storedCrates findIf {(typeOf _x) == _crateType});

// Exit if desired crate isn't stored
if (isNil "_crate") exitWith {false};

// Unload crate
detach _crate;
[_crate, true] call KPLIB_fnc_clearCargo;
_crate setPos _unloadPos;
[_crate, true] remoteExec ["enableRopeAttach"];
if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};

// Fill the possible gap in the storage area
reverse _storedCrates;
_i = 0;
{
    detach (_x select 0);
    (_x select 0) attachTo [_storage, [(_storagePositions select _i) select 0, (_storagePositions select _i) select 1, _x select 1]];
    _i = _i + 1;
} forEach (_storedCrates apply {[_x, [typeOf _x] call KPLIB_fnc_getCrateHeight]});

// Update sector resources
if (_update) then {
    if ((_storage getVariable ["KP_liberation_storage_type", -1]) == 1) then {
        recalculate_sectors = true;
        publicVariable "recalculate_sectors";
    };
};

true
