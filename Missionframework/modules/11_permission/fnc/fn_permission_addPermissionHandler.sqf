#include "script_component.hpp"
/*
    KPLIB_fnc_permission_addPermissionHandler

    File: fn_permission_addPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2019-05-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Adds a new permission to the permission system.

    Parameter(s):
        _permission     - Permission name                               [STRING, defaults to ""]
        _condition      - Code which is executed on permission check    [CODE, defaults to {false}]
        _default        - Default permission                            [BOOL, defaults to false]
        _group          - Permission group name                         [STRING, defaults to "GROUPMISC"]
        _vehCheck       - Vehicle clasnames for the check               [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

if (!isServer) exitWith {};

params [
    ["_permission", "", [""]],
    ["_code", {false}, [{}]],
    ["_default", false, [false]],
    ["_group", "GROUPMISC", [""]],
    ["_vehCheck", [], [[]]]
];

// Variables
private _types = PGVAR("permissionTypes", []);
private _groups = PGVAR("permissionGroups", []);
private _string = localize (["STR_KPLIB_PERMISSION_", toUpper _permission] joinString "");
private _groupString = localize (["STR_KPLIB_PERMISSION_", toUpper _group] joinString "");

// Fetch the strintable keys
if (_string isEqualTo "") then {
    _string = _permission;
};

if (_groupString isEqualTo "") then {
    _groupString = _group;
};

_permission = toLower _permission;
_types pushBackUnique _permission;

private _index = _groups findIf {
    (_x select 0) isEqualTo _group
};

if (_index isEqualTo -1) then {
    _groups pushBack [_group, _groupString, [_permission]];
} else {
    ((_groups select _index) select 2) pushBackUnique _permission;
};

// Read the Variable
private _data = [[_code], _string, _vehCheck];
(_data select 0) append (PGVAR(_permission, []) select 0);

if !(_string isEqualTo "") then {
    _data set [1, _string];
};

// Write the Variable
PSVAR(_permission, _data);

// Emit permissions added event
["KPLIB_permission_newPH", [_permission, _default]] call CBA_fnc_serverEvent;

// Set data in namespace
PSVAR("permissionTypes", _types);
PSVAR("permissionGroups", _groups);

true
