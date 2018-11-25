/*
    KPLIB_fnc_build_loadData

    File: fn_build_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-11-25
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

    // Initialize every sector and add the data to the garrison array
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
            private _object = [_x select 0] call KPLIB_fnc_common_createVehicle;
            _object setPosWorld (_x select 1);
            _object setVectorDirAndUp (_x select 2);

            _fobItems pushBack _object;
        } forEach _items;

    } forEach _moduleData;
};

true

