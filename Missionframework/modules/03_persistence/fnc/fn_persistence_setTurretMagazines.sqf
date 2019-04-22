/*
    KPLIB_fnc_persistence_setTurretMagazines

    File: fn_persistence_setTurretMagazines.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-20
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Sets turret magazines.

    Parameter(s):
        _object     - Object to                         [OBJECT, defaults to objNull]
        _magazines  - Array from 'magazinesAllTurrets'  [ARRAY, defaults to []]

    Returns:
        Turret magazines were set [BOOL]
*/
params [
    ["_object", objNull, [objNull]],
    ["_magazines", [], [[]]]
];

//remove default magazines
{
    _x params ["_class", "_turretPath"];
    _object removeMagazineTurret [_class, _turretPath];
} forEach (magazinesAllTurrets _object);

{
    _x params ["_class", "_turretPath", "_ammo"];
    _object addMagazineTurret [_class, _turretPath, _ammo];
} forEach _magazines;

true
