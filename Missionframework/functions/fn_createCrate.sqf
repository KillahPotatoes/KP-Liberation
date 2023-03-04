/*
    File: fn_createCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-11
    Last Update: 2023-03-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns a resource crate of given type and with given amount at given position.

    Parameter(s):
        _resource   - Type of resource                  [STRING, defaults to KPLIB_b_crateSupply]
        _amount     - Resource amount                   [NUMBER, defaults to 100]
        _pos        - Position where to spawn the crate [POSITION, defaults to getPos player]

    Returns:
        Created crate [OBJECT]
*/

params [
    ["_resource", KPLIB_b_crateSupply, [""]],
    ["_amount", 100, [0]],
    ["_pos", getPos player, [[]], [2, 3]]
];

// Check if resource is valid
if !((toLowerANSI _resource) in KPLIB_crates) exitWith {
    ["Invalid resource param given: %1", _resource] call BIS_fnc_error;
    objNull
};

// Create crate
private _crate = _resource createVehicle _pos;
_crate setMass 500;
_crate setVariable ["KPLIB_crate_value", _amount, true];
[_crate, true] call KPLIB_fnc_clearCargo;
_crate lockInventory true;

// Add ACE carry functionality and disable cargo renaming
if (KPLIB_ace) then {
    [_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
    _crate setVariable ["ace_cargo_noRename", true];
};

// Process KP object init
[_crate] call KPLIB_fnc_addObjectInit;

_crate
