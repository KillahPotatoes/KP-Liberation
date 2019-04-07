/*
    KPLIB_fnc_persistence_removeFromPersistence

    File: fn_persistence_removeFromPersistence.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-30
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Removes object from persistence system.

    Parameter(s):
        _object - Object to remove from persistence [OBJECT]

    Returns:
        Object was removed from persistence [BOOL]
*/
params [
    ["_object", objNull, [objNull]]
];

if (_object isKindOf "CAManBase") exitWith {
    private _idx = (KPLIB_persistence_units find _object);
    if (_idx != -1) then {
        KPLIB_persistence_units set [_idx, objNull];
    };
};

private _idx = (KPLIB_persistence_objects find _object);
if (_idx != -1) then {
    KPLIB_persistence_objects set [_idx, objNull];
};

true
