/*
    KPLIB_fnc_virtual_addCurator

    File: fn_virtual_addCurator.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds curator cababilities to unit.

    Parameter(s):
        _unit - Unit to add curator for                 [OBJECT, defaults to player]
        _mode - Curator mode 1 (limited) or 2 (full)    [NUMBER, defaults to 1 (limited)]

    Returns:
        Curator was added to unit [BOOL]
*/
params [
    ["_unit", player, [objNull]],
    ["_mode", 1, [0]]
];

if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [VIRTUAL] Adding curator for unit '%1' with mode %2", _unit, _mode]};

// Do not add curator if mode out of range
if  !(_mode in [1, 2]) exitWith {};

_unit call KPLIB_fnc_virtual_removeCurator;

private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_curator addCuratorEditableObjects [[_unit], true];

switch _mode do {
    case 1: {
        _curator setVariable ["Addons", 0, true];
    };

    case 2: {
        _curator setVariable ["Addons", 3, true];
        _curator addCuratorEditableObjects [entities "", true];
    };
};



_unit assignCurator _curator;

true
