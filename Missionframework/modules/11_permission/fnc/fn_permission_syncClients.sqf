/*
    KPLIB_fnc_permission_syncClients

    File: fn_permission_syncClients.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-22
    Last Update: 2018-12-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Receive client variables and send them to all clients.

    Parameter(s):
        _list       - KPLIB_permissionList      [ARRAY, defaults to []]
        _default    - KPLIB_defaultPermissions  [ARRAY, defaults to []]
        _types      - KPLIB_permissionTypes     [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_list", [], [[]]],
    ["_default", [], [[]]],
    ["_types", [], [[]]]
];

// Sort out empty variables and publish the rest
if !(_list isEqualTo []) then {
    KPLIB_permissionList = +_list;
    publicVariable "KPLIB_permissionList";
};

if !(_default isEqualTo []) then {
    KPLIB_defaultPermissions = +_default;
    publicVariable "KPLIB_defaultPermissions";
};

if !(_types isEqualTo []) then {
    KPLIB_permissionTypes = +_types;
    publicVariable "KPLIB_permissionTypes";
};
