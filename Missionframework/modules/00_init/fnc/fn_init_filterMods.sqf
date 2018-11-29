/*
    KPLIB_fnc_init_filterMods

    File: fn_init_filterMods.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Filters not available classnames out of a given array of vehicle classnames or buildlist array and returns the resulting array.

    Parameter(s):
        _array - Array of vehicle classname strings or multidimensional array with vehicle classname string in select 0 of each array [ARRAY, defaults to []]

    Returns:
        Filtered array of vehicle classnames [ARRAY]
*/

params [
    ["_array", [], [[]]]
];

_array = _array select {if (_x isEqualType []) then {[_x select 0] call KPLIB_fnc_init_checkClass} else {[_x] call KPLIB_fnc_init_checkClass}};

_array
