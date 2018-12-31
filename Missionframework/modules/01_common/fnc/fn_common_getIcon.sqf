/*
    KPLIB_fnc_common_getIcon

    File: fn_common_getIcon.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns icon path for given className

    Parameter(s):
        _className - Name of class name to get icon for [STRING, defaults to ""]

    Returns:
        Icon path [STRING]
*/

params [
    ["_className", "", [""]]
];

// Exit if no parameter provided
if (_className isEqualTo "") exitWith {""};

private _icon = KPLIB_common_iconCache getVariable _className;

if (isNil "_icon") then {
    _icon = getText (configFile >> "CfgVehicles" >> _className >> "icon");

    if(isText (configFile >> "CfgVehicleIcons" >> _icon)) then {
        _icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
    };

    KPLIB_common_iconCache setVariable [_className, _icon];
};

_icon
