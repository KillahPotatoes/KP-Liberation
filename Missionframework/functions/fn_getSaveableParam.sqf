/*
    File: fn_getSaveableParam.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-01-27
    Last Update: 2023-03-02
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Saves/loads/fetches mission parameter from FileXT or profileNamespace depending on "_action" argument.
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

private _value = nil;

// Read data from the FileXT storage, or failing that, the server profileNamespace
// Return : (string) Save data
// Param 0: (string) File/Variable name
fnc_loadData = {
    params [
        ["_name", "", [""]]
    ];
    private _data = nil;

    // Check if FileXT is available
    if (isClass(configFile >> "CfgPatches" >> "filext")) then {
        [format ["Loading '%1' from FileXT.", _name], "LOAD"] call KPLIB_fnc_log;
        _file = format ["%1.savedata", _name];
        [_file] call filext_fnc_open; 
        [_file] call filext_fnc_read;
        _data = [_file, "Data"] call filext_fnc_get;
        [_file] call filext_fnc_close;
    };

    // Fallback to namespace if necessary
    if (isNil "_data") then {
        [format ["Fallback - Loading '%1' from Profile Namespace.", _name], "LOAD"] call KPLIB_fnc_log;
        _data = profileNamespace getVariable _name;
    };

    if (!isNil "_data") then {
        _data;
    };
};

// Write data to the FileXT storage, or failing that, the server profileNamespace
// Param 0: (string) File/Variable name
// Param 1: (string) Save data
fnc_saveData = {
    params [
        ["_name", "", [""]],
        ["_data", nil, []]
    ];

    // Check if FileXT is available
    if (isClass(configFile >> "CfgPatches" >> "filext")) then {  
        [format ["Saving '%1' to FileXT.", _name], "SAVE"] call KPLIB_fnc_log;
        _file = format ["%1.savedata", _name];
        [_file] call filext_fnc_open; 
        [_file, "Data", str _data] call filext_fnc_set;
        [_file] call filext_fnc_write;
        [_file] call filext_fnc_close;
    } else {
        [format ["Fallback - Saving '%1' to Profile Namespace.", _name], "SAVE"] call KPLIB_fnc_log;
        profileNamespace setVariable [_name, _data];
        saveProfileNamespace;
    };
};

// Use lobby value if no action specified
if(isNil "_action") then {_action = KP_load_params;};

// We propably shoud not load parameters on SP environment
if(!isMultiplayer) then {_action = 2};

switch (_action) do {
    // Save parameters
    case 0: {
        _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
        private _savedParams = [KPLIB_save_paramKey] call fnc_loadData;
        _savedParams = parseSimpleArray _savedParams;

        if(isNil "_savedParams") then {
            if (KPLIB_savegame_debug > 0) then {["Param save data is corrupted, creating new.", "PARAM"] call KPLIB_fnc_log;};
            // Create new "associative" array
            _savedParams = [[_paramName, _value]];

        } else {
            private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
            if(isNil "_singleParam") then {
                if (KPLIB_savegame_debug > 0) then {[format ["Saving value: %1 for param: %2", _value, _paramName], "PARAM"] call KPLIB_fnc_log;};
                _savedParams pushBack [_paramName, _value];

            } else {
                if (KPLIB_savegame_debug > 0) then {[format ["Overwriting value: %1 with: %2 for param: %3", (_singleParam select 1), _value, _paramName], "PARAM"] call KPLIB_fnc_log;};
                // _singleparam is an reference to array in _savedParams, we can use "set"
                _singleParam set [1, _value];
            };
        };

        [KPLIB_save_paramKey, str _savedParams] call fnc_saveData;
    };
    // Load parameters
    case 1: {
        private _savedParams = [KPLIB_save_paramKey] call fnc_loadData;
        _savedParams = parseSimpleArray _savedParams;
        if(isNil "_savedParams") then {
            if (KPLIB_savegame_debug > 0) then {["Param save data is corrupted, can't load!", "PARAM"] call KPLIB_fnc_log;};
            // Fix param save data
            [KPLIB_save_paramKey, ""] call fnc_saveData;
            if (KPLIB_savegame_debug > 0) then {[format ["No saved value for param: %1, fetching value.", _paramName], "PARAM"] call KPLIB_fnc_log;};
            _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
        } else {
            private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
            if(isNil "_singleParam") then {
                if (KPLIB_savegame_debug > 0) then {[format ["No saved value for param: %1, fetching value.", _paramName], "PARAM"] call KPLIB_fnc_log;};
                _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
            } else {
                if (KPLIB_savegame_debug > 0) then {[format ["Found value: %1 for param: %2,", (_singleParam select 1), _paramName], "PARAM"] call KPLIB_fnc_log;};
                _value = _singleParam select 1;
            };
        };
    };
    // Get param
    default {
        if (KPLIB_savegame_debug > 0) then {[format ["Fetching selected value for param: %1", _paramName], "PARAM"] call KPLIB_fnc_log;};
        _value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
    };
};

// Return param value
_value;
