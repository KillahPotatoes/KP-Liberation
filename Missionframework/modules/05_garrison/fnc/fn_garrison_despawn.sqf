/*
    KPLIB_fnc_garrison_despawn

    File: fn_garrison_despawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

params [
    ["_sector", "", [""]]
];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Despawn for %2", diag_tickTime, _sector];};

// Initialize local variables
private _activeGarrisonId = KPLIB_garrison_active findIf {(_x select 0) == _sector};
private _activeGarrisonRef = KPLIB_garrison_active select _activeGarrisonId;
private _vehicle = objNull;

// Despawn garrison infantry
{
    if (alive _x) then {deleteVehicle _x};
} forEach (_activeGarrisonRef select 1);

// Despawn garrison light vehicles
{
    if (alive _x) then {
        _vehicle = _x;
        {_vehicle deleteVehicleCrew _x} forEach crew _x;
        deleteVehicle _vehicle;
    };
} forEach (_activeGarrisonRef select 2);

// Despawn garrison heavy vehicles
{
    if (alive _x) then {
        _vehicle = _x;
        {_vehicle deleteVehicleCrew _x} forEach crew _x;
        deleteVehicle _vehicle;
    };
} forEach (_activeGarrisonRef select 3);

// Despawn crew which leaved their vehicle
{
    if (alive _x) then {deleteVehicle _x};
} forEach (_activeGarrisonRef select 4);

// Remove active garnison array entry
KPLIB_garrison_active deleteAt _activeGarrisonId;

true
