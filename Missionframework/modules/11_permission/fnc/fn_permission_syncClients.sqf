/*
    KPLIB_fnc_permission_syncClients

    File: fn_permission_syncClients.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-22
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Receive client variables and send them to all clients.

    Parameter(s):
        _list       - KPLIB_permission_list      [ARRAY, defaults to []]
        _default    - KPLIB_permission_default   [ARRAY, defaults to []]
        _types      - KPLIB_permission_types     [ARRAY, defaults to []]
        _groups     - KPLIB_permission_groups    [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_list", [], [[]]],
    ["_default", [], [[]]],
    ["_types", [], [[]]],
    ["_groups", [], [[]]]
];

// Only execute on Server
if (!isServer) exitWith {};

// Sort out empty variables and publish the rest
if !(_list isEqualTo []) then {
    KPLIB_permission_list = +_list;
    publicVariable "KPLIB_permission_list";
};

if !(_default isEqualTo []) then {
    KPLIB_permission_default = +_default;
    publicVariable "KPLIB_permission_default";
};

if !(_types isEqualTo []) then {
    KPLIB_permission_types = +_types;
    publicVariable "KPLIB_permission_types";
};

if !(_types isEqualTo []) then {
    KPLIB_permission_groups = +_groups;
    publicVariable "KPLIB_permission_types";
};
