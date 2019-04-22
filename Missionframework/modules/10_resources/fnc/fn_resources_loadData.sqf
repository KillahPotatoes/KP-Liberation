/*
    KPLIB_fnc_resources_loadData

    File: fn_resources_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Resources module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["resources"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Resources module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};
    // Nothing to do here
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Resources module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};

    // Place down the storages with the stored resource crates
    private ["_storage", "_crate", "_resource", "_amount"];
    {
        _x params ["_class", "_pos", "_vector", "_supplies", "_ammo", "_fuel"];

        _storage = [_class] call KPLIB_fnc_common_createVehicle;
        _storage setPosWorld _pos;
        _storage setVectorDirAndUp _vector;

        {
            _resource = _x select 1;
            while {_resource > 0} do {
                _amount = _resource min KPLIB_param_crateVolume;
                _crate = [(_x select 0), getPosATL _storage, _amount] call KPLIB_fnc_resources_createCrate;
                [_crate] call KPLIB_fnc_resources_storeCrate;
                _resource = _resource - _amount;
            };
        } forEach [["Supply", _supplies], ["Ammo", _ammo], ["Fuel", _fuel]];
    } forEach (_moduleData select 0);

    // Apply the intel points
    KPLIB_resources_intel = _moduleData select 1;
};

true
