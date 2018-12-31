/*
    KPLIB_fnc_virtual_addCurator

    File: fn_virtual_addCurator.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds curator cababilities to unit.

    Parameter(s):
        _unit - Unit to add curator for                                             [OBJECT, defaults to objNull]
        _mode - Curator mode 1 (limited) or 2 (limited, free camera) or 3 (full)    [NUMBER, defaults to 1 (limited)]

    Returns:
       Curator was added to unit [BOOL]
*/
params [
    ["_unit", objNull, [objNull]],
    ["_mode", 1, [0]]
];

// Do not add curator if mode out of range or unit is null
if (!(_mode in [1, 2, 3]) || isNull _unit) exitWith {false};

private _oldCurator = getAssignedCuratorLogic _unit;
unassignCurator _oldCurator;

// Due to locality zeus issues we need to wait until old curator is unassigned from unit
[{isNull getAssignedCuratorLogic (_this select 0)}, {
    params ["_unit", "_mode", "_oldCurator"];

    // TODO
    // This causes rpt spam about not existing objects
    // Disable for now
    //deleteVehicle _oldCurator;

    if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [VIRTUAL] Adding curator for unit '%1' with mode %2", _unit, _mode]};

    private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    // Since 1.86 modules don't activate automatically when created via scripts
    // We need to activate it manually
    _curator setVariable ["BIS_fnc_initModules_activate", true, true];
    // Add player so he can see himself in curator
    _curator addCuratorEditableObjects [[_unit], false];

    _curator setVariable ["KPLIB_mode", _mode, true];

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

    // Assigning the curator will change locality, needs to be assigned before adding icons
    _unit assignCurator _curator;

    [_curator ,{
        // Close the zeus display to prevent issues when recreating already open zeus
        (findDisplay 312) closeDisplay 0;

        // Add 3D fob icons if enabled
        if (KPLIB_param_zeusFobIcons) then {
            _this call KPLIB_fnc_virtual_curatorUpdateFobIcons;
        };

        // Add 3D location icons if enabled
        if (KPLIB_param_zeusLocationIcons) then {
            _this call BIS_fnc_drawCuratorLocations;
        };
    }] remoteExec ["call", _curator];

}, [_unit, _mode, _oldCurator], 10] call CBA_fnc_waitUntilAndExecute;

true
