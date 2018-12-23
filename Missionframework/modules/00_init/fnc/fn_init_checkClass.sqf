/*
    KPLIB_fnc_init_checkClass

    File: fn_init_checkClass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-12-08
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

if (isClass (configFile >> "CfgVehicles" >> _toCheck)) then {
    true
} else {
    diag_log format ["[KP LIBERATION] [PRESET] %1 not available in current modset", _toCheck];
    false
};
