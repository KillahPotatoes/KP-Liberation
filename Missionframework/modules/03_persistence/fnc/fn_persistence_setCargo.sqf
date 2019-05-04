/*
    KPLIB_fnc_persistence_setCargo

    File: fn_persistence_setCargo.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-20
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Set object cargo from serialized data.

    Parameter(s):
        _object - Object to set cargo on                            [OBJECT, defaults to objNull]
        _cargo  - Serialized cargo data from 'persistence_getCargo' [ARRAY, defaults to []]

    Returns:
        Object cargo was set [BOOL]
*/
params [
    ["_object", objNull, [objNull]],
    ["_cargo", [], [[]]]
];

_cargo params [
    ["_magazines", []],
    ["_items", []],
    ["_weapons", []],
    ["_backpacks", []],
    ["_containersCargo", []]
];

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;

// magazines
{
    _object addMagazineCargoGlobal [_x, _magazines select 1 select _forEachIndex];
} forEach (_magazines select 0);

// items
{
    _object addItemCargoGlobal [_x, 1];
} forEach _items;

// weapons
{
    _object addWeaponCargoGlobal [_x select 0, 1];
} forEach _weapons;

// backpacks
{
    _object addBackpackCargoGlobal [_x, _backpacks select 1 select _forEachIndex];
} forEach (_backpacks select 0);

// add cargo to backpacks, vests and uniforms
private _objectContainers = everyContainer _object;
{
    _x params ["_type", "_cargo"];

    private _container = _objectContainers deleteAt (_objectContainers findIf {(_x select 0) == _type});

    [(_container select 1), _cargo] call KPLIB_fnc_persistence_setCargo;

} forEach _containersCargo;

true
