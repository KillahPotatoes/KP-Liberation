/*
    File: fn_getStoragePositions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-03-27
    Last Update: 2020-03-30
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the storage positions and the unload distance for given storage object.

    Parameter(s):
        _storage - Storage object [OBJECT, defaults to objNull]

    Returns:
        Positions array and unload distance [ARRAY]
*/

params [
    ["_storage", objNull, [objNull]]
];

if (isNull _storage) exitWith {["Null object given"] call BIS_fnc_error; [[], 0]};

private _data = [
    [KP_liberation_small_storage_building, [KP_liberation_small_storage_positions, 4]],
    [KP_liberation_large_storage_building, [KP_liberation_large_storage_positions, 6.5]]
] select {(typeOf _storage) isEqualTo (_x select 0)};

if (_data isEqualTo []) exitWith {["No valid storage object given"] call BIS_fnc_error; [[], 0]};

(_data select 0) select 1
