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
        _crate = [_crateType, _amount, _pos] call F_createCrate;
        if (_delay) then {sleep 0.1;};
        [_crate, _storage] call F_crateToStorage;
    };
} forEach [_supply, _ammo, _fuel];

true
