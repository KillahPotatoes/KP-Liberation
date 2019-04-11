/*
    KPLIB_fnc_permission_import

    File: fn_permission_import.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-11
    Last Update: 2019-04-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Import the permission list.

    Parameter(s):
        _list - Permission list to import [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_list", [], [[]]]
]

KPLIB_permission_data setVariable ["permissionList", _list];

true
