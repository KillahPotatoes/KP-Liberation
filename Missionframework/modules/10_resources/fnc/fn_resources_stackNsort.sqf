/*
    KPLIB_fnc_resources_stackNsort

    File: fn_resources_stackNsort.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Stacks all values of the crates inside given storage and sorts the crates according to resource type.

    Parameter(s):
        _storage - Storage which should be ordered [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_storage", objNull, [objNull]]
];

// Exit, if no storage is given
if (isNull _storage) exitWith {false};

// Get resource values and remove crates
private _resources = [_storage] call KPLIB_fnc_resources_getStorageValue;
{
    detach _x;
    deleteVehicle _x;
} forEach (attachedObjects _storage);

// Refill the storage
private ["_resource", "_amount", "_crate"];
{
    _resource = _x select 1;
    while {_resource > 0} do {
        _amount = _resource min KPLIB_param_crateVolume;
        _crate = [(_x select 0), getPosATL _storage, _amount] call KPLIB_fnc_resources_createCrate;
        [_crate] call KPLIB_fnc_resources_storeCrate;
        _resource = _resource - (_resource min KPLIB_param_crateVolume);
    };
} forEach [["Supply", (_resources select 0)], ["Ammo", (_resources select 1)], ["Fuel", (_resources select 2)]];

true
