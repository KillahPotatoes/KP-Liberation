/*
    KPLIB_fnc_res_orderStorage

    File: fn_res_orderStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Orders the crates in the storage to fill possible gaps.

    Parameter(s):
        _storage - Storage which should be ordered [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_storage", objNull, [objNull]]
];

// Exit if no storage was given
if (isNull _storage) exitWith {false};

// Get the attach positions for the storage type
private _attachPositions = [typeOf _storage] call KPLIB_fnc_res_getAttachArray;

// Detach and reattach crates
{
    detach _x;
    _x attachTo [_storage, [
        (_attachPositions select _forEachIndex) select 0,
        (_attachPositions select _forEachIndex) select 1,
        [typeOf _x] call KPLIB_fnc_res_getCrateZ
    ]];
} forEach (attachedObjects _storage);

true
