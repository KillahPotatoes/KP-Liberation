/*
    KPLIB_fnc_logistic_addMenu

    File: fn_logistic_addMenu.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-17
    Last Update: 2019-01-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds a new menu to the logistic main menu.

    Parameter(s):
        _menu       - Menu name                                 [STRING, defaults to ""]
        _condition  - Code which is executed on button click    [CODE, defaults to {false}]
        _string     - Menu name stringtable path                [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_menu", "", [""]],
    ["_code", {false}, [{}]],
    ["_string", "", [""]]
];

// Read the registered menus
private _menus = KPLIB_logistic_data getVariable ["menus", []];

// Append the new menu and save the variable
_menus pushBack [_menu, _code, _string];
KPLIB_logistic_data setVariable ["menus", _menus, true];

true
