if (!isServer) exitWith {};

params ["_index", "_nearfob", "_clientID", "_supplies", "_ammo", "_fuel"];

logiError = 0;

private _storage_areas = (_nearfob nearobjects KPLIB_range_fob) select {(_x getVariable ["KPLIB_storage_type",-1]) == 0};

if ((count _storage_areas) == 0) exitWith {(localize "STR_LOGISTIC_CANTAFFORD") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

private _price_s = 100;
private _price_a = 0;
private _price_f = 100;

if ((_price_s > _supplies) || (_price_a > _ammo) || (_price_f > _fuel)) exitWith {(localize "STR_LOGISTIC_CANTAFFORD") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

{


    private _storage_positions = [];
    private _storedCrates = (attachedObjects _x);
    reverse _storedCrates;

    {
        private _crateValue = _x getVariable ["KPLIB_crate_value",0];

        switch ((typeOf _x)) do {
            case KPLIB_b_crateSupply: {
                if (_price_s > 0) then {
                    if (_crateValue > _price_s) then {
                        _crateValue = _crateValue - _price_s;
                        _x setVariable ["KPLIB_crate_value", _crateValue, true];
                        _price_s = 0;
                    } else {
                        detach _x;
                        deleteVehicle _x;
                        _price_s = _price_s - _crateValue;
                    };
                };
            };
            case KPLIB_b_crateAmmo: {
                if (_price_a > 0) then {
                    if (_crateValue > _price_a) then {
                        _crateValue = _crateValue - _price_a;
                        _x setVariable ["KPLIB_crate_value", _crateValue, true];
                        _price_a = 0;
                    } else {
                        detach _x;
                        deleteVehicle _x;
                        _price_a = _price_a - _crateValue;
                    };
                };
            };
            case KPLIB_b_crateFuel: {
                if (_price_f > 0) then {
                    if (_crateValue > _price_f) then {
                        _crateValue = _crateValue - _price_f;
                        _x setVariable ["KPLIB_crate_value", _crateValue, true];
                        _price_f = 0;
                    } else {
                        detach _x;
                        deleteVehicle _x;
                        _price_f = _price_f - _crateValue;
                    };
                };
            };
            default {[format ["Invalid object (%1) at storage area", (typeOf _x)], "ERROR"] call KPLIB_fnc_log;};
        };
    } forEach _storedCrates;

    ([_x] call KPLIB_fnc_getStoragePositions) params ["_storage_positions"];

    private _area = _x;
    _i = 0;
    {
        _height = [typeOf _x] call KPLIB_fnc_getCrateHeight;
        detach _x;
        _x attachTo [_area, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
        _i = _i + 1;
    } forEach attachedObjects (_x);

    if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};

} forEach _storage_areas;

please_recalculate = true;

(KPLIB_logistics select _index) set [1, ((KPLIB_logistics select _index) select 1) + 1];
