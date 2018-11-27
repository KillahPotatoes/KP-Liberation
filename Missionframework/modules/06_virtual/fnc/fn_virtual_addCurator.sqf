/*
    KPLIB_fnc_virtual_addCurator

    File: fn_virtual_addCurator.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds curator cababilities to unit.

    Parameter(s):
        _unit - Unit to add curator for                                             [OBJECT, defaults to objNull]
        _mode - Curator mode 1 (limited) or 2 (limited, free camera) or 3 (full)    [NUMBER, defaults to 1 (limited)]

    Returns:
        Curator logic [OBJECT]
*/
params [
    ["_unit", objNull, [objNull]],
    ["_mode", 1, [0]]
];

// Do not add curator if mode out of range or unit is null
if (!(_mode in [1, 2, 3]) || isNull _unit) exitWith {objNull};

if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [VIRTUAL] Adding curator for unit '%1' with mode %2", _unit, _mode]};

_unit call KPLIB_fnc_virtual_removeCurator;

private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
// Add player so he can see himself in curator
_curator addCuratorEditableObjects [[_unit], false];

_curator setVariable ["KPLIB_mode", _mode];

switch _mode do {
    // Limited mode, limited and full camera
    case 1;
    case 2: {
        _curator setVariable ["Addons", 0, true];

        // Add Built items to zeus
        private _fobSaveNamespace = (missionNamespace getVariable ["KPLIB_build_saveNamespace", objNull]);
        private _fobsItems = [];
        {
            _fobsItems append (_fobSaveNamespace getVariable _x);
        } forEach allVariables _fobSaveNamespace;

        _curator addCuratorEditableObjects [_fobsItems, true];

        // Disable place, edit, delete and destroy
        {
            _curator setCuratorCoef [_x, -1e10];
        } forEach ["place", "edit", "delete", "destroy"];

        // Disallow attributes changing of objects
        [
            _curator,
            "object",
            []
        ] call BIS_fnc_setCuratorAttributes;
    };
    // Full mode
    case 3: {
        _curator setVariable ["Addons", 3, true];
        _curator addCuratorEditableObjects [entities "", true];
    };
};

// Add 3D fob icons if enabled
if (KPLIB_param_zeusFobIcons) then {
    _curator call KPLIB_fnc_virtual_curatorUpdateFobIcons;
};

// Add 3D location icons if enabled
if (KPLIB_param_zeusLocationIcons) then {
    _curator call BIS_fnc_drawCuratorLocations;
};

_unit assignCurator _curator;

_curator
