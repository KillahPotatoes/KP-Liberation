/*
    KPLIB_fnc_init_paramFetchAll

    File: fn_init_paramFetchAll.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-05-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Fetches all mission parameters to global variables

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Parameters save key
KPLIB_params_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_PARAMS_REWRITE";
// Standard lobby parameters array
KPLIB_params_array = [];

// WIPE parameters from server profile
if(KPLIB_param_source == -1) then {
    profileNamespace setVariable [KPLIB_params_save_key, nil];
};

// Persistent parameters array. This array will be saved to user profile if set to save in lobby
// Array must be copied (+) to be not overwritten when using lobby values only
KPLIB_params_persistent_array = +(profileNamespace getVariable KPLIB_params_save_key);

if(isNil "KPLIB_params_persistent_array") then {
    KPLIB_params_persistent_array = [];
};

// Loop on every Param class
{
    // If default is not a number we should skip parameter
    if(isNumber (_x >> "default" )) then {
        private _name = configName _x;
        private _default = getNumber (_x >> "default");

        private _value = nil;
        private _source = nil;

        // Handle persistent param
        if (getNumber (_x >> "persistent") > 0) then {
            switch(KPLIB_param_source) do {
                // PARAM LOAD
                case 1: {
                    private _paramData = [_name, _default] call KPLIB_fnc_init_paramLoad;
                    _source = _paramData select 1;
                    _value = _paramData select 0;
                };
                // PARAM SAVE
                case 2: {
                    _source = "LOBBY/SAVED";
                    // When saving we just get param from lobby, whole array will be saved later
                    _value = [_name, _default] call BIS_fnc_getParamValue;
                };
                // FROM LOBBY
                default {
                    _source = "LOBBY";
                    _value = [_name, _default] call BIS_fnc_getParamValue;
                };

            };

            [KPLIB_params_persistent_array, _name, _value] call BIS_fnc_setToPairs;

        } else { // Not persistent, using lobby value
            _source = "LOBBY";
            _value = [_name, _default] call BIS_fnc_getParamValue;

            [KPLIB_params_array, _name, _value] call BIS_fnc_setToPairs;
        };

        // Create variable for Param
        [_name, _value] call KPLIB_fnc_init_paramVarCreate;

        diag_log format ["[KP LIBERATION] [PARAM] Loaded param: %1 from %2 with value %3", _name, _source, _value] ;
    }
} forEach ("true" configClasses getMissionConfig "Params");

// SAVE to profile namespace if set to save in lobby
if(KPLIB_param_source == 2) then {
    profileNamespace setVariable [KPLIB_params_save_key, KPLIB_params_persistent_array];
};

publicVariable "KPLIB_params_persistent_array";
publicVariable "KPLIB_params_array";

true
