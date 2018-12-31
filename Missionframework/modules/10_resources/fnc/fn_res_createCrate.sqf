/*
    KPLIB_fnc_res_createCrate

    File: fn_res_createCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns a resource crate of given type and side at given position.

    Parameter(s):
        _resource   - Type of resource crate                                                [STRING, defaults to "Supply"]
        _pos        - Position where to spawn the crate                                     [POSITION ATL, defaults to KPLIB_zeroPos]
        _value      - Amount of resources inside the crate. Limited by crateVolume param    [NUMBER, defaults to KPLIB_param_crateVolume]
        _side       - Side of the preset from where to take the classname from              [SIDE, defaults to KPLIB_preset_sideF]

    Returns:
        Spawned crate [OBJECT]
*/

params [
    ["_resource", "Supply", [""]],
    ["_pos", KPLIB_zeroPos, [[]], [3]],
    ["_value", KPLIB_param_crateVolume, [0]],
    ["_side", KPLIB_preset_sideF, [sideEmpty]]
];

// Only the server should spawn crates
if (!isServer) exitWith {objNull};

// Get the right preset classname
private _presetClass = ["crate" + _resource, _side] call KPLIB_fnc_common_getPresetClass;

// If no presetClass, return null object
if (_presetClass isEqualTo "") exitWith {objNull};

// Spawn the object
private _crate = [_presetClass, _pos] call KPLIB_fnc_common_createVehicle;

// Add the amount of resources
_crate setVariable ["KPLIB_res_crateValue", _value min KPLIB_param_crateVolume, true];

// Return crate
_crate
