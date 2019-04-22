/*
    KPLIB_fnc_resources_unloadCrate

    File: fn_resources_unloadCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Unloads one crate from given transport vehicle.

    Parameter(s):
        _vehicle - Transport vehicle to unload from [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_vehicle", objNull, [objNull]]
];

// Exit, if nothing is stored on the given vehicle
if ((_vehicle getVariable ["KPLIB_resources_usedSlots", 0]) isEqualTo 0) exitWith {false};

// Get Distance for unload
private _distance = (KPLIB_resources_transportConfigs select (KPLIB_resources_transportConfigs findIf {(_x select 0) isEqualTo (typeOf _vehicle)})) select 1;

// Get the last loaded crate
private _loadedCrates = (attachedObjects _vehicle) select {(typeOf _x) in KPLIB_resources_crateClasses};
reverse _loadedCrates;
private _crate = _loadedCrates select 0;

// Get the next free unload position
private _unloadPos = _vehicle getPos [_distance, (getDir _vehicle) - 180];

// Increment the distance, when spot is occupied
private _i = 0;
while {!((nearestObjects [_unloadPos, [], 1]) isEqualTo [])} do {
    _i = _i + 1;
    _unloadPos = _vehicle getPos [_distance + _i * 1.8, (getDir _vehicle) - 180];
};

// Detach crate and move to unload position
detach _crate;
_crate setPos _unloadPos;

// Decrement usedSlots variable
_vehicle setVariable ["KPLIB_resources_usedSlots", (_vehicle getVariable ["KPLIB_resources_usedSlots", 0]) - 1, true];

true
