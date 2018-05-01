/*
    KPLIB_fnc_init_loadParam

    File: fn_init_loadParam.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-04-29
    Last Update: 2018-04-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Loads parameter value from KPLIB_params_persistent_array or Lobby if no saved value found.

    Parameter(s):
        0: STRING - Parameter name
        1: NUMBER - Default value when no lobby and saved value found

    Returns:
        0: ANY - Parameter value
        1: STRING - Source of parameter value - LOBBY/PROFILE
*/
params ["_name", ["_default", 0]];

if(!isServer) exitWith {
    diag_log format ["[KP LIBERATION] [PARAM] Cannot load param: %1 from user profile. Function should be called only on server!"];
};

private _value = [KPLIB_params_persistent_array, _name] call BIS_fnc_getFromPairs;
private _source = "PROFILE";

// Load from lobby when no saved value for parameter
if(isNil "_value") then {
    _source = "LOBBY";
    _value = [_name, _default] call BIS_fnc_getParamValue;
};

[_value, _source]
