/*
    File: fn_getLessLoadedHC.sqf
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
private _less_loaded_HC = objNull;
private _previous_min_load = 99999;

if (isMultiplayer) then {
    if (!isNil "group_owners" && !(isNil "HC1" && isNil "HC2" && isNil "HC3")) then {
        {
            if (!isNil "HC1") then {
                if (!isNull HC1) then {
                    if (_x select 0 == HC1) then {
                        if ((_x select 4) + (_x select 5) < _previous_min_load) then {
                            _previous_min_load = (_x select 4) + (_x select 5);
                            _less_loaded_HC = HC1;
                        };
                    };
                };
            };

            if (!isNil "HC2") then {
                if (!isNull HC2) then {
                    if (_x select 0 == HC2) then {
                        if ((_x select 4) + (_x select 5) < _previous_min_load) then {
                            _previous_min_load = (_x select 4) + (_x select 5);
                            _less_loaded_HC = HC2;
                        };
                    };
                };
            };

            if (!isNil "HC3") then {
                if (!isNull HC3) then {
                    if (_x select 0 == HC3) then {
                        if ((_x select 4) + (_x select 5) < _previous_min_load) then {
                            _previous_min_load = (_x select 4) + (_x select 5);
                            _less_loaded_HC = HC3;
                        };
                    };
                };
            };

        } foreach group_owners;
    };
};

_less_loaded_HC
