/*
f_kp_getSaveableParam.sqf
Author: veteran29
Date: 2018-01-27

Description:
Saves/loads/fetches mission parameter from profileNamespace depending on "_action" argument. 
If no action provided value from "KP_load_params" variable is used.
On SP enviroment saving/loading is disabled.

Parameters:
_this select 0 - STRING - Name of parameter
_this select 1 - NUMBER - Default value if parameter not found or no saved value
_this select 2 - NUMBER - Should save(0)/load(1) from profile namespace or get(2) from selected param value
*/
params ["_paramName", ["_defaultValue", 0], ["_action", nil]];

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
			if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE PARAM] Param save data is corrupted, creating new.";};
			// Create new "associative" array
			_savedParams = [[_paramName, _value]];

		} else {
			private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
			if(isNil "_singleParam") then {
				if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE PARAM] Saving value: %1 for param: %2,", _value, _paramName];};
				_savedParams pushBack [_paramName, _value];

			} else {
				if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE PARAM] Overwriting value: %1 with: %2 for param: %3,", (_singleParam select 1), _value, _paramName];};
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
			if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE PARAM] Param save data is corrupted, can't load!";};
			// Fix param save data
			profileNamespace setVariable [_saveKey, []];
			if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE PARAM] No saved value for param: %1, fetching value.", _paramName];};
			_value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
		} else {
			private _singleParam = (_savedParams select {(_x select 0) == _paramName}) select 0;
			if(isNil "_singleParam") then {
				if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE PARAM] No saved value for param: %1, fetching value.", _paramName];};
				_value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
			} else {
				if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE PARAM] Found value: %1 for param: %2,", (_singleParam select 1), _paramName];};
				_value = _singleParam select 1;
			};
		};
	};
	// Get param
	default {
		if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE PARAM] Fetch selected value for param";};
		_value = [_paramName, _defaultValue] call bis_fnc_getParamValue;
	};
};

// Return param value
_value;
