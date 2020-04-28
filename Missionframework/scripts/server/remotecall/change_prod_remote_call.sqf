if (!isServer) exitWith {};

params ["_sector", "_new_production"];

private ["_tempProduction","_checkFor"];

_tempProduction = [];

{
    if ((_x select 1) == _sector) then {

        switch (_new_production) do {
            case 1: {_checkFor = 5;};
            case 2: {_checkFor = 6;};
            default {_checkFor = 4;};
        };

        if (_x select _checkFor) then {
            _tempProduction pushBack [
                (_x select 0),
                (_x select 1),
                (_x select 2),
                (_x select 3),
                (_x select 4),
                (_x select 5),
                (_x select 6),
                _new_production,
                KP_liberation_production_interval,
                (_x select 9),
                (_x select 10),
                (_x select 11)
            ];
        } else {
            hint localize "STR_PRODUCTION_FACFALSE";
            _tempProduction pushBack _x;
        };
    } else {
        _tempProduction pushBack _x;
    };
} forEach KP_liberation_production;

KP_liberation_production = _tempProduction;
