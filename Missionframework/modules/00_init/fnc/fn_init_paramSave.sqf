/*
    KPLIB_fnc_init_saveParam

    File: fn_init_saveParam.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-04-29
    Last Update: 2018-04-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Saves parameter value to persistent KPLIB_params_array

    Parameter(s):
        0: STRING - Parameter name
        1: NUMBER - Default value when no lobby and saved value found

    Returns:
    BOOL
*/
params ["_name", "_value"];

if(!isServer) exitWith {
    diag_log format ["[KP LIBERATION] [PARAM] Cannot save param: %1 to user profile. Function should be called only on server!"];
};

[KPLIB_params_array, _name, _value] call BIS_fnc_setToPairs;

true
