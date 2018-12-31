/*
    KPLIB_fnc_build_loadData

    File: fn_build_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads build module data.

    Parameter(s):
        NONE

    Returns:
        Data was loaded [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Build module loading...";};

private _moduleData = ["build"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Build module data empty, creating new data...";};

    // Initialize build save namespace
    KPLIB_build_saveNamespace = [] call CBA_fnc_createNamespace;
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Build module data found, applying data...";};

    KPLIB_build_saveNamespace = [] call CBA_fnc_createNamespace;

    // Deserialize data for every FOB
    {
        _x params ["_fob", "_items"];

        private _fobItems = KPLIB_build_saveNamespace getVariable _fob;
        if(isNil "_fobItems") then {
            _fobItems = [];
            KPLIB_build_saveNamespace setVariable [_fob, _fobItems];
        };

        // Convert serialized objects into real objects
        {
            _x params ["_className", "_posWorld", "_vectorDirAndUp"];

            private ["_object"];

            // TODO proper deserialization/serialization with groups and vehicle crews handling
            switch true do {
                case (_className isKindOf "Man"): {
                    _object = [createGroup KPLIB_preset_sideF, _className] call KPLIB_fnc_common_createUnit;
                    _object setPosWorld _posWorld;
                    _object setVectorDirAndUp _vectorDirAndUp;

                    // Set watching direction
                    if (_object isEqualTo formLeader _object) then {
                        _object setFormDir getDir _object;
                    };
                };

                default {
                    _object = [_className] call KPLIB_fnc_common_createVehicle;
                    _object setPosWorld _posWorld;
                    _object setVectorDirAndUp _vectorDirAndUp;
                };
            };

            _fobItems pushBack _object;
        } forEach _items;

    } forEach _moduleData;
};

true

