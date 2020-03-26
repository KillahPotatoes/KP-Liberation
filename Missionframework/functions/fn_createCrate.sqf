/*
    File: fn_createCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-11
    Last Update: 2020-03-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns a resource crate of given type and with given amount at given position.

    Parameter(s):
        _resource   - Type of resource                  [STRING, defaults to KP_liberation_supply_crate]
        _amount     - Resource amount                   [NUMBER, defaults to 100]
        _pos        - Position where to spawn the crate [POSITION, defaults to getPos player]

    Returns:
        Created crate [OBJECT]
*/

params [
    ["_resource", KP_liberation_supply_crate, [""]],
    ["_amount", 100, [0]],
    ["_pos", getPos player, [[]], [2, 3]]
];

// Check if resource is valid
if !(_resource in KP_liberation_crates) exitWith {
    ["Invalid resource param given: %1", _resource] call BIS_fnc_error;
    objNull
};

// Create crate
private _crate = _resource createVehicle _pos;
_crate setMass 500;
_crate setVariable ["KP_liberation_crate_value", _amount, true];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearItemCargoGlobal _crate;

// Add ACE carry functionality
if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};

// Process KP object init
[_crate] call KPLIB_fnc_addObjectInit;

_crate
