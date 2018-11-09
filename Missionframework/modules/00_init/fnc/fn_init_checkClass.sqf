/*
    KPLIB_fnc_init_checkClass

    File: fn_init_checkClass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns if given classname is available in CfgVehicles.

    Parameter(s):
        _toCheck - Classname which should be checked [STRING, defaults to ""]

    Returns:
        Classname check result [BOOL]
*/

params [
    ["_toCheck", "", [""]]
];

private _return = false;

if (isClass (configFile >> "CfgVehicles" >> _toCheck)) then {
    _return = true;
} else {
    diag_log format ["[KP LIBERATION] [CHECKCLASS] %1 not found in CfgVehicles", _toCheck];
};

_return
