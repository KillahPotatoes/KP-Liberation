/*
    KPLIB_fnc_persistence_loadData

    File: fn_persistence_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to persistence module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Persistence module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["persistence"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Persistence module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Persistence module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};

    private _objects = [];
    private _units = [];

    // Load objects
    {
        _x params ["_serialized", ["_variables", []]];

        private _object = _serialized call KPLIB_fnc_persistence_deserializeObject;
        // Apply saved variables
        {
            _x params [["_var", nil], ["_val", nil], ["_global", false]];
            if (!isNil "_var") then {
                _object setVariable [_var, _val, _global];
                // Add var to persistence so even if module that added it originaly is not preset the data won't be lost
                _var call KPLIB_fnc_persistence_addPersistentVar;
            };
        } forEach _variables;

        _objects pushBack _object;
    } forEach (_moduleData select 0);

    KPLIB_persistence_objects = _objects;

    // Load units
    {
        _x params ["_serialized", ["_variables", []]];

        private _unit = _serialized call KPLIB_fnc_persistence_deserializeUnit;
        // Apply saved variables
        {
            _x params [["_var", nil], ["_val", nil], ["_global", false]];
            if (!isNil "_var") then {
                _unit setVariable [_var, _val, _global];
                // Add var to persistence so even if module that added it originaly is not preset the data won't be lost
                _var call KPLIB_fnc_persistence_addPersistentVar;
            };
        } forEach _variables;

        _units pushBack _unit;
    } forEach (_moduleData select 1);

    KPLIB_persistence_units = _units;
};

true
