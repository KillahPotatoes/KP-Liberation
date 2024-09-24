if (!isServer) exitWith {};

params ["_index", "_nearfob", "_clientID"];

logiError = 0;

if (((KPLIB_logistics select _index) select 1) <= 0) exitWith {logiError = 1; _clientID publicVariableClient "logiError";};

private _storage_areas = (_nearfob nearobjects KPLIB_range_fob) select {(_x getVariable ["KPLIB_storage_type",-1]) == 0};

if ((count _storage_areas) == 0) exitWith {(localize "STR_LOGISTIC_NOSPACE") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

private _price_s = 50;
private _price_a = 0;
private _price_f = 50;

private _crateSum = (ceil(_price_s / 100)) + (ceil(_price_a / 100)) + (ceil(_price_f / 100));

private _spaceSum = 0;

{
    if (typeOf _x == KPLIB_b_largeStorage) then {
        _spaceSum = _spaceSum + (count KPLIB_large_storage_positions) - (count (attachedObjects _x));
    };
    if (typeOf _x == KPLIB_b_smallStorage) then {
        _spaceSum = _spaceSum + (count KPLIB_small_storage_positions) - (count (attachedObjects _x));
    };
} forEach _storage_areas;

if (_spaceSum < _crateSum) exitWith {(localize "STR_LOGISTIC_NOSPACE") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

{
    private _space = 0;
    if (typeOf _x == KPLIB_b_largeStorage) then {
        _space = (count KPLIB_large_storage_positions) - (count (attachedObjects _x));
    };
    if (typeOf _x == KPLIB_b_smallStorage) then {
        _space = (count KPLIB_small_storage_positions) - (count (attachedObjects _x));
    };

    while {(_space > 0) && (_price_s > 0)} do {
        private _amount = 100;
        if ((_price_s / 100) < 1) then {
            _amount = _price_s;
        };
        _price_s = _price_s - _amount;
        private _crate = [KPLIB_b_crateSupply, _amount, getPos _x] call KPLIB_fnc_createCrate;
        [_crate, _x] call KPLIB_fnc_crateToStorage;
        _space = _space - 1;
    };

    while {(_space > 0) && (_price_a > 0)} do {
        private _amount = 100;
        if ((_price_a / 100) < 1) then {
            _amount = _price_a;
        };
        _price_a = _price_a - _amount;
        private _crate = [KPLIB_b_crateAmmo, _amount, getPos _x] call KPLIB_fnc_createCrate;
        [_crate, _x] call KPLIB_fnc_crateToStorage;
        _space = _space - 1;
    };

    while {(_space > 0) && (_price_f > 0)} do {
        private _amount = 100;
        if ((_price_f / 100) < 1) then {
            _amount = _price_f;
        };
        _price_f = _price_f - _amount;
        private _crate = [KPLIB_b_crateFuel, _amount, getPos _x] call KPLIB_fnc_createCrate;
        [_crate, _x] call KPLIB_fnc_crateToStorage;
        _space = _space - 1;
    };

    if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};
} forEach _storage_areas;

please_recalculate = true;

(KPLIB_logistics select _index) set [1, ((KPLIB_logistics select _index) select 1) - 1];
