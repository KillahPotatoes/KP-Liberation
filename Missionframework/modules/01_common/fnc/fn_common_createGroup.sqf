/*
    KPLIB_fnc_common_createGroup

    File: fn_common_createGroup.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-24
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates a group at given side with units according to given array of classnames and fires the Liberation group created event.

    Parameter(s):
        _side       - Side of the group                             [SIDE, defaults to KPLIB_preset_sideE]
        _units      - Array of classnames to spawn as group members [ARRAY, defaults to []]
        _spawnPos   - Position to spawn the group and units         [POSITION, defaults to KPLIB_zeroPos]
        _addition   - Additional argument for unit creation         [STRING, defaults to "NONE"]

    Returns:
        Created group [GROUP]
*/

params [
    ["_side", KPLIB_preset_sideE, [sideEmpty]],
    ["_units", [], [[]]],
    ["_spawnPos", [KPLIB_zeroPos], [[]], [3]],
    ["_addition", "NONE", [""]]
];

private _grp = createGroup [_side, true];

{
    [_grp, _x, _spawnPos, _addition] call KPLIB_fnc_common_createUnit;
} forEach _units;

["KPLIB_group_created", [_grp]] call CBA_fnc_localEvent;

_grp
