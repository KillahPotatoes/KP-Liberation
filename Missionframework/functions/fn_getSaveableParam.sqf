/*
    File: fn_getSaveableParam.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-01-27
    Last Update: 2020-04-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Saves/loads/fetches mission parameter from profileNamespace depending on "_action" argument.
        If no action provided value from "KP_load_params" variable is used.
        On SP enviroment saving/loading is disabled.

    Parameter(s):
        _paramName      - Name of parameter                                                                 [STRING, defaults to ""]
        _defaultValue   - Default value if parameter not found or no saved value                            [NUMBER, defaults to 0]
        _action         - Should save(0)/load(1) from profile namespace or get(2) from selected param value [NUMBER, defaults to nil]

    Returns:
        Parameter value [BOOL]
*/

params [
    ["_paramName", "", [""]],
    ["_defaultValue", 0, [0]],
    ["_action", nil, [0]]
];

private _saveKey = "KP_LIBERATION_" + (toUpper worldName) + "_SAVE_PARAMS";
private _value = nil;

// Use lobby value if no action specified
if(isNil "_action") then {_action = KP_load_params;};

// We propably shoud not load parameters on SP environment
if(!isMultiplayer) then {_action = 2};

switch (_action) do {
    // Save to profileNamespace
    case 0: {
        _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
        private _savedParams = profileNamespace getVariable _saveKey;

        if(isNil "_savedParams") then {
            if (KP_liberation_savegame_debug > 0) then {["Param save data is corrupted, creating new.", "PARAM"] call KPLIB_fnc_log;};
            // Create new "associative" array
            _savedParams = [[_paramName, _value]];

        } else {
            private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
            if(isNil "_singleParam") then {
                if (KP_liberation_savegame_debug > 0) then {[format ["Saving value: %1 for param: %2", _value, _paramName], "PARAM"] call KPLIB_fnc_log;};
                _savedParams pushBack [_paramName, _value];

            } else {
                if (KP_liberation_savegame_debug > 0) then {[format ["Overwriting value: %1 with: %2 for param: %3", (_singleParam select 1), _value, _paramName], "PARAM"] call KPLIB_fnc_log;};
                // _singleparam is an reference to array in _savedParams, we can use "set"
                _singleParam set [1, _value];
            };
        };

        // Save params to profile namespace
        profileNamespace setVariable [_saveKey, _savedParams];
        saveProfileNamespace;
    };
    // Load from profileNamespace
    case 1: {
        private _savedParams = profileNamespace getVariable _saveKey;
        if(isNil "_savedParams") then {
            if (KP_liberation_savegame_debug > 0) then {["Param save data is corrupted, can't load!", "PARAM"] call KPLIB_fnc_log;};
            // Fix param save data
            profileNamespace setVariable [_saveKey, []];
            if (KP_liberation_savegame_debug > 0) then {[format ["No saved value for param: %1, fetching value.", _paramName], "PARAM"] call KPLIB_fnc_log;};
            _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
        } else {
            private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
            if(isNil "_singleParam") then {
                if (KP_liberation_savegame_debug > 0) then {[format ["No saved value for param: %1, fetching value.", _paramName], "PARAM"] call KPLIB_fnc_log;};
                _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
            } else {
                if (KP_liberation_savegame_debug > 0) then {[format ["Found value: %1 for param: %2,", (_singleParam select 1), _paramName], "PARAM"] call KPLIB_fnc_log;};
                _value = _singleParam select 1;
            };
        };
    };
    // Get param
    default {
        if (KP_liberation_savegame_debug > 0) then {[format ["Fetching selected value for param: %1", _paramName], "PARAM"] call KPLIB_fnc_log;};
        _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
    };
};

// Return param value
_value;
