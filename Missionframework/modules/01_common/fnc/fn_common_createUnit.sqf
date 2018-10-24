/*
    KPLIB_fnc_common_createUnit

    File: fn_common_createUnit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-24
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates a unit of given classnames and fires the Liberation unit created event.

    Parameter(s):
        _grp        - Group for the unit to join            [GROUP, defaults to grpNull]
        _unit       - Classname of the unit to spawn        [STRING, defaults to ""]
        _spawnPos   - Position to spawn the unit            [ARRAY, defaults to KPLIB_zeroPos]
        _addition   - Additional argument for unit creation [STRING, defaults to "NONE"]

    Returns:
        Created unit [OBJECT]
*/

params [
    ["_grp", grpNull, [grpNull]],
    ["_unit", "", [""]],
    ["_spawnPos", [KPLIB_zeroPos], [[]], [2,3]],
    ["_addition", "NONE", [""]]
];

if (_grp == grpNull || _unit == "") exitWith {objNull};

private _object = _grp createUnit [_unit, _spawnPos, [], 10, _addition];

["KPLIB_unit_created", [_object]] call CBA_fnc_localEvent;

_object
