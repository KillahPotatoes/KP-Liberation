/*
    KPLIB_fnc_

    File: fn_res_unstoreCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Unstores a crate of given kind from a given storage area.

    Parameter(s):
        _storage    - Storage area from which the crate should be removed   [OBJECT, defaults to objNull]
        _resource   - Type of resource crate                                [STRING, defaults to "Supply"]

    Returns:
        Unstored crate [OBJECT]
*/

params [
    ["_storage", objNull, [objNull]],
    ["_resource", "Supply", [""]]
];

// Exit, if no storage or invalid resource type is given
if (isNull _storage || !(_resource in ["Supply", "Ammo", "Fuel"])) exitWith {objNull};

// We need to determine for what type of crate we'll looking for
private _validCrates = switch (_resource) do {
    case "Supply": {[KPLIB_preset_crateSupplyE, KPLIB_preset_crateSupplyF]};
    case "Ammo": {[KPLIB_preset_crateAmmoE, KPLIB_preset_crateAmmoF]};
    case "Fuel": {[KPLIB_preset_crateFuelE, KPLIB_preset_crateFuelF]};
};

// Get all stored crates in reverse Order (LIFO)
private _attachedCrates = attachedObjects _storage;
reverse _attachedCrates;

// Check if there is one crate of the desired type and select the crate
private _index = _attachedCrates findIf {(typeOf _x) in _validCrates};

if (_index isEqualTo -1) exitWith {
    hint localize "STR_KPLIB_HINT_NOCRATEFOUND";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    objNull
};

private _crate = _attachedCrates select _index;

// Define distance from the storage center to unload the crate
private _distance = (((boundingBox _storage) select 1) select 1) + 1.2;

// Get the next free unload position
private _unloadPos = _storage getPos [_distance, (getDir _storage) - 180];

// Increment the distance, when spot is occupied
private _i = 0;
while {!((nearestObjects [_unloadPos, [], 1]) isEqualTo [])} do {
    _i = _i + 1;
    _unloadPos = _storage getPos [_distance + _i * 1.8, (getDir _storage) - 180];
};

// Detach crate and move to unload position
detach _crate;
_crate setPos _unloadPos;

// Get storage position array depending on storage type
private _attachPositions = [typeOf _storage] call KPLIB_fnc_res_getAttachArray;

// Reorder the crates to close the possible gap
[_storage] call KPLIB_fnc_res_orderStorage;

// Return unstored crate
_crate
