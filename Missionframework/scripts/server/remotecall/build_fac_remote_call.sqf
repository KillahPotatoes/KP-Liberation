if (!isServer) exitWith {};

params ["_sector", "_fac","_clientID"];

private _tempProduction = +KP_liberation_production;
private _checkFor = 0;
private _price_s = 100;
private _price_a = 100;
private _price_f = 100;
private _success = false;

switch (_fac) do {
    case "supply": {_checkFor = 4;_price_s = 50};
    case "ammo": {_checkFor = 5;_price_a = 50;};
    case "fuel": {_checkFor = 6;_price_f = 50;};
};

{
    if ((_x select 1) == (_sector select 1)) exitWith {
        if (((_x select 9) >= _price_s) && ((_x select 10) >= _price_a) && ((_x select 11) >= _price_f)) then {
            stats_supplies_spent = stats_supplies_spent + _price_s;
            stats_ammo_spent = stats_ammo_spent + _price_a;
            stats_fuel_spent = stats_fuel_spent + _price_f;

            private _storage = nearestObjects [(markerPos (_x select 1)), [KP_liberation_small_storage_building], 100];
            _storage = _storage select {(_x getVariable ["KP_liberation_storage_type",-1]) == 1};
            if ((count _storage) == 0) exitWith {};
            _storage = (_storage select 0);
            private _storedCrates = (attachedObjects _storage);
            reverse _storedCrates;

            {
                private _crateValue = _x getVariable ["KP_liberation_crate_value",0];

                switch ((typeOf _x)) do {
                    case KP_liberation_supply_crate: {
                        if (_price_s > 0) then {
                            if (_crateValue > _price_s) then {
                                _crateValue = _crateValue - _price_s;
                                _x setVariable ["KP_liberation_crate_value", _crateValue, true];
                                _price_s = 0;
                            } else {
                                detach _x;
                                deleteVehicle _x;
                                _price_s = _price_s - _crateValue;
                            };
                        };
                    };
                    case KP_liberation_ammo_crate: {
                        if (_price_a > 0) then {
                            if (_crateValue > _price_a) then {
                                _crateValue = _crateValue - _price_a;
                                _x setVariable ["KP_liberation_crate_value", _crateValue, true];
                                _price_a = 0;
                            } else {
                                detach _x;
                                deleteVehicle _x;
                                _price_a = _price_a - _crateValue;
                            };
                        };
                    };
                    case KP_liberation_fuel_crate: {
                        if (_price_f > 0) then {
                            if (_crateValue > _price_f) then {
                                _crateValue = _crateValue - _price_f;
                                _x setVariable ["KP_liberation_crate_value", _crateValue, true];
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

            private _i = 0;
            {
                private _height = [typeOf _x] call KPLIB_fnc_getCrateHeight;
                detach _x;
                _x attachTo [_storage, [(KP_liberation_small_storage_positions select _i) select 0, (KP_liberation_small_storage_positions select _i) select 1, _height]];
                _i = _i + 1;
            } forEach (attachedObjects _storage);

            _x set [_checkFor, true];
            private _hint = format [localize "STR_PRODUCTION_FACBUILD_SUCCESS"];
            _hint remoteExec ["hint",_clientID];
            _success = true;
        } else {
            private _hint = format [localize "STR_PRODUCTION_FACBUILD_ERROR",_price_s,_price_a,_price_f];
            _hint remoteExec ["hint",_clientID];
        };
    };
} forEach _tempProduction;

if (_success) then {
    KP_liberation_production = +_tempProduction;
    recalculate_sectors = true;
};
