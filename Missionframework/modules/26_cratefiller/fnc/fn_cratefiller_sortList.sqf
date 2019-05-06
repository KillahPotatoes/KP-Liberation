/*
    KPLIB_fnc_cratefiller_sortList

    File: fn_cratefiller_sortList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Sorts the displaynames of the given item array.

    Parameter(s):
        _list - Array of elements which should be sorted [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_list", [], [[]]]
];

// Variables
private _config = "";
private _sortedList = [];

{
    _config = [_x] call KPLIB_fnc_cratefiller_getConfigPath;
    if ((getText (_config >> "displayName")) isEqualTo "") then {
    } else {
        _sortedList pushBack [
            (getText (_config >> "displayName")),
            _x
        ];
    };
} forEach _list;

_sortedList sort true;

_sortedList
