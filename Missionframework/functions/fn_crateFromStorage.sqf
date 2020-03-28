/*
    File: fn_crateFromStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-03-27
    Last Update: 2020-03-28
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Unloads given crate type from storage area.

    Parameter(s):
        _cratetype  - Crate type                [STRING, defaults to ""]
        _storage    - Storage                   [OBJECT, defaults to objNull]
        _update     - Update sector resources   [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_cratetype", "_storage", ["_update",false]];

private ["_storage_positions","_unload_distance","_unload_pos","_i","_unloaded","_stored_crates","_height"];

([] call KPLIB_fnc_getStoragePositions) params ["_storage_positions", "_unload_distance"];

_i = 0;
_unload_pos = _storage getPos [_unload_distance, (getDir _storage) - 180];

while {!((nearestObjects [_unload_pos,KP_liberation_crates,1]) isEqualTo [])} do {
    _i = _i + 1;
    _unload_pos = _storage getPos [_unload_distance + _i * 1.8, (getDir _storage) - 180];
};

sleep 0.5;

_unloaded = false;
_stored_crates = attachedObjects _storage;
reverse _stored_crates;

{
    if (typeOf _x == _cratetype) then {
        detach _x;

        clearWeaponCargoGlobal _x;
        clearMagazineCargoGlobal _x;
        clearBackpackCargoGlobal _x;
        clearItemCargoGlobal _x;

        _x setPos _unload_pos;
        [_x, true] remoteExec ["enableRopeAttach"];
        if(KP_liberation_ace) then {[_x, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};
        _unloaded = true;
    };
    if (_unloaded) exitWith {
        _i = 0;
        {
            _height = [typeOf _x] call KPLIB_fnc_getCrateHeight;
            detach _x;
            _x attachTo [_storage, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
            _i = _i + 1;
        } forEach attachedObjects _storage;
    };
} forEach _stored_crates;

if (_update) then {
    if ((_storage getVariable ["KP_liberation_storage_type",-1]) == 1) then {
        remoteExec ["check_sector_ress_remote_call",2];
    };
};

true
