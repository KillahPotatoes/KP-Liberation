/*
    KPLIB_fnc_res_pay

    File: fn_res_pay.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Removes given amount of resources from the provided location.

    Parameter(s):
        _location   - Sector or FOB marker from where to pay the resources from [STRING, defaults to ""]
        _supplies   - Amount of supplies to pay                                 [NUMBER, defaults to 0]
        _ammo       - Amount of ammo to pay                                     [NUMBER, defaults to 0]
        _fuel       - Amount of fuel to pay                                     [NUMBER, defaults to 0]

    Returns:
        Payment successful  [BOOL]
*/

params [
    ["_location", "", [""]],
    ["_supplies", 0, [0]],
    ["_ammo", 0, [0]],
    ["_fuel", 0, [0]]
];

// Exit if no location is given
if (_location isEqualTo "") exitWith {false};

// Check if the location even has the needed amount of resources
private _resTotal = [_location] call KPLIB_fnc_res_getResTotal;
if (
    ((_resTotal select 0) < _supplies) ||
    ((_resTotal select 1) < _ammo) ||
    ((_resTotal select 2) < _fuel)
) exitWith {false};

// Get all storage areas in the vicinity of the marker
private _storages = nearestObjects [markerPos _location, KPLIB_res_storageClasses, KPLIB_param_fobRange];

// Get the stored resource crates by type
private _sCrates = [];
private _aCrates = [];
private _fCrates = [];
{
    {
        switch (typeOf _x) do {
            case KPLIB_preset_crateSupplyE;
            case KPLIB_preset_crateSupplyF: {_sCrates pushBack _x};
            case KPLIB_preset_crateAmmoE;
            case KPLIB_preset_crateAmmoF: {_aCrates pushBack _x};
            case KPLIB_preset_crateFuelE;
            case KPLIB_preset_crateFuelF: {_fCrates pushBack _x};
        };
    } forEach (attachedObjects _x);
} forEach _storages;

// Remove crates according to needed resources
private ["_resource", "_crate", "_value"];
{
    _resource = _x select 0;
    while {_resource > 0} do {
        _crate = (_x select 1) deleteAt 0;
        _value = _crate getVariable ["KPLIB_res_crateValue", 0];

        // Check if crate holds enough resources already
        if (_resource >= _value) then {
            _resource = _resource - _value;
            _value = 0;
        } else {
            _value = _value - _resource;
            _resource = 0;
        };

        // Remove crate, if needed. Or adjust value
        if (_value isEqualTo 0) then {
            detach _crate;
            deleteVehicle _crate;
        } else {
            _crate setVariable ["KPLIB_res_crateValue", _value, true];
        }
    };
} forEach [[_supplies, _sCrates], [_ammo, _aCrates], [_fuel, _fCrates]];

// Reorder the crates on all storages to close the possible gaps
{
    [_x] call KPLIB_fnc_res_orderStorage;
} forEach _storages;

true
