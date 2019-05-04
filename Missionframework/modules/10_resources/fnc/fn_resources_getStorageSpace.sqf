/*
    KPLIB_fnc_resources_getStorageSpace

    File: fnc_resources_getStorageSpace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-16
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Returns the amount of free storage space of a given storage.

    Parameter(s):
        _storage - Storage to check for free space [OBJECT, defaults to objNull]

    Returns:
        Amount of free storage spaces [NUMBER]
*/

params [
    ["_storage", objNull, [objNull]]
];

// Get the storage positions amount
private _allSpaces = count ([typeOf _storage] call KPLIB_fnc_resources_getAttachArray);

// Get amount of already stored crates
private _attachedCrates = count (attachedObjects _storage);

// Return free space amount
_allSpaces - _attachedCrates
