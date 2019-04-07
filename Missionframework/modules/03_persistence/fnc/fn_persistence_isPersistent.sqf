/*
    KPLIB_fnc_persistence_isPersistent

    File: fn_persistence_isPersistent.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-30
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Checks if object is added to persistence system.

    Parameter(s):
        _object - Object to check [OBJECT]

    Returns:
        Is object persistent [BOOL]
*/
params [
    ["_object", objNull, [objNull]]
];

if (_object isKindOf "CAManBase") exitWith {
    (KPLIB_persistence_units find _object) != -1
};

(KPLIB_persistence_objects find _object) != -1
