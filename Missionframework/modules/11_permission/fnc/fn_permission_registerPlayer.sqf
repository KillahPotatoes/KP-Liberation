#include "script_component.hpp"
/*
    KPLIB_fnc_permission_registerPlayer

    File: fn_permission_registerPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-19
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Checks if the player is already registered to the permission system.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Variables
private _list =  PGVAR("permissionList", []);
private _default = PGVAR("permissionDefault", []);
private _index = 0;
private _playerArray = [];
private _permission = "";

// Check if the player is registered and if he has every default permission
_index = _list findIf {(_x select 0) isEqualTo (getPlayerUID player)};
if (_index isEqualto -1) then {
    _list pushBack [getPlayerUID player, name player, _default];
} else {
    (_list select _index) set [1, name player];
    if !(count ((_list select _index) select 2) isEqualTo count _default) then {
        {
            _permission = toLower (_x select 0);
            if ((((_list select _index) select 2) findIf {
                _x select 0 isEqualTo _permission
            }) isEqualTo -1) then {
                ((_list select _index) select 2) pushBack _x;
            };
        } forEach _default;
    };
};

// Set data in namespace
PSVAR("permissionList", _list);

true
