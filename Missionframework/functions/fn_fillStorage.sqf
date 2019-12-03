/*
    File: fn_fillStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params [
    ["_supply", 0, [0]],
    ["_ammo", 0, [0]],
    ["_fuel", 0, [0]],
    ["_storage", objNull, [objNull]],
    ["_delay", false, [false]]
];

if (isNull _storage) exitWith {false};

private _crateType = KP_liberation_supply_crate;
private _amount = 0;
private _crate = objNull;
private _pos = getPos _storage;

{
    _crateType = [KP_liberation_supply_crate, KP_liberation_ammo_crate, KP_liberation_fuel_crate] select _forEachIndex;

    while {_x > 0} do {
        _amount = 100;
        if ((_x / 100) < 1) then {
            _amount = _x;
        };
        _x = _x - _amount;
        _crate = [_crateType, _amount, _pos] call KPLIB_fnc_createCrate;
        if (_delay) then {sleep 0.1;};
        [_crate, _storage] call KPLIB_fnc_crateToStorage;
    };
} forEach [_supply, _ammo, _fuel];

true
