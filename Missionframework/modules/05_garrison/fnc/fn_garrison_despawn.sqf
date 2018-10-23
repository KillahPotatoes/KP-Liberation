/*
    KPLIB_fnc_garrison_despawn

    File: fn_garrison_despawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Despawns the sector garrison and updates the garrison array with actual data.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Despawn for %2", diag_tickTime, _sector];};

// Initialize local variables
private _activeGarrisonId = KPLIB_garrison_active findIf {(_x select 0) == _sector};
private _activeGarrisonRef = KPLIB_garrison_active select _activeGarrisonId;
private _persistentGarrisonRef = KPLIB_garrison_array select (KPLIB_garrison_array findIf {(_x select 0) == _sector});
private _vehicle = objNull;
private _infantry = 0;
private _handledCrew = [];
private _lightVeh = [];
private _heavyVeh = [];

// Despawn garrison infantry
{
    if (alive _x) then {
        deleteVehicle _x;
        _infantry = _infantry + 1;
    };
} forEach (_activeGarrisonRef select 2);

// Despawn garrison light vehicles
{
    if (alive _x) then {
        _vehicle = _x;
        _lightVeh pushBack (typeOf _x);
        {_handledCrew pushBack _x; _vehicle deleteVehicleCrew _x;} forEach (crew _x);
        deleteVehicle _vehicle;
    };
} forEach (_activeGarrisonRef select 3);

// Despawn garrison heavy vehicles
{
    if (alive _x) then {
        _vehicle = _x;
        _heavyVeh pushBack (typeOf _x);
        {_handledCrew pushBack _x; _vehicle deleteVehicleCrew _x;} forEach (crew _x);
        deleteVehicle _vehicle;
    };
} forEach (_activeGarrisonRef select 4);

// Despawn crew which leaved their vehicle
{
    if (alive _x && !(_x in _handledCrew)) then {
        deleteVehicle _x;
        _infantry = _infantry + 1;
    };
} forEach (_activeGarrisonRef select 5);

// Update persistent garrison data
if ((_activeGarrisonRef select 1) == (_persistentGarrisonRef select 1)) then {
    // Owner at activation is still owner -> save remainings
    _persistentGarrisonRef set [2, _infantry];
    _persistentGarrisonRef set [3, _lightVeh];
    _persistentGarrisonRef set [4, _heavyVeh];
} else {
    // Owner changed during the combat -> empty garrison
    _persistentGarrisonRef set [2, 0];
    _persistentGarrisonRef set [3, []];
    _persistentGarrisonRef set [4, []];
};

// Remove active garnison array entry
KPLIB_garrison_active deleteAt _activeGarrisonId;

true
