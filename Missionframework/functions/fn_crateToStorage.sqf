/*
    File: fn_crateToStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-03-27
    Last Update: 2020-04-23
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Attach given crate at storage area.

    Parameter(s):
        _crate      - Crate                     [OBJECT, defaults to objNull]
        _storage    - Storage                   [OBJECT, defaults to objNull]
        _update     - Update sector resources   [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_crate", objNull, [objNull]],
    ["_storage", objNull, [objNull]],
    ["_update", false, [false]]
];

// Validate parameters
if (isNull _crate) exitWith {["Null object given"] call BIS_fnc_error; false};

// Handle return values from nearestObjects of function call in ammobox action manager
if (!isNull _storage) then {
    // Get storage and crate specific values
    ([_storage] call KPLIB_fnc_getStoragePositions) params ["_storage_positions", "_unload_distance"];
    private _height = [typeOf _crate] call KPLIB_fnc_getCrateHeight;

    // Remove possible cargo from crate
    [_crate, true] call KPLIB_fnc_clearCargo;

    // Check for enough space in storage
    private _crates_count = count (attachedObjects _storage);
    if (_crates_count >= (count _storage_positions)) exitWith {if (!isDedicated) then {[] spawn {hint localize "STR_BOX_CANTSTORE"; sleep 2; hintSilent "";};};};

    // Store crate
    _crate attachTo [_storage, [(_storage_positions select _crates_count) select 0, (_storage_positions select _crates_count) select 1, _height]];
    [_crate, false] remoteExec ["enableRopeAttach"];
    if(KP_liberation_ace) then {[_crate, false, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};

    // Update sector resource values, if requested
    if (_update) then {
        if ((_storage getVariable ["KP_liberation_storage_type", -1]) == 1) then {
            recalculate_sectors = true;
            publicVariable "recalculate_sectors";
        };
    };
} else {
    if (!isDedicated) then {
        [] spawn {
            hint localize "STR_BOX_CANTSTORE";
            sleep 2;
            hintSilent "";
        };
    };
};

true
