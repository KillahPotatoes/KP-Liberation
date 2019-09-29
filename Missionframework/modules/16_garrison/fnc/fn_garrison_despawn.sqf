/*
    KPLIB_fnc_garrison_despawn

    File: fn_garrison_despawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2019-09-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

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

if (isServer) then {[format ["Despawn for %1", _sector], "GARRISON", true] call KPLIB_fnc_common_log;};

// Initialize local variables
private _activeGarrisonId = KPLIB_garrison_active findIf {(_x select 0) == _sector};
private _activeGarrisonRef = [_sector, true] call KPLIB_fnc_garrison_getGarrison;
private _persistentGarrisonRef = [_sector] call KPLIB_fnc_garrison_getGarrison;
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
} forEach ((_activeGarrisonRef select 2) select {!(_x getVariable ["KPLIB_captured", false])});

/* !NOTE!
    With the current despawn checks for the vehicles, the vehicle won't be deleted if it's a wreck or the crew bailed out due to damage.
    This leads to the behaviour that it would be deleted if there is a blufor unit or a player in the vehicle (if the enemy is opfor).
    We'll address the "capture enemy vehicle" with a variable which will be set to the vehicle like "KPLIB_captured" in a later iteration.
*/

// Despawn garrison light vehicles
{
    if ((alive _x) && !(_x getVariable ["KPLIB_captured", false])) then {
        if (!((crew _x) isEqualTo []) && !(_x in (KPLIB_preset_vehTransPlE + KPLIB_preset_vehLightUnarmedPlE))) then {
            _vehicle = _x;
            _lightVeh pushBack (typeOf _x);
            {
                _handledCrew pushBack _x;
                _vehicle deleteVehicleCrew _x;
            } forEach ((crew _x) select {!(_x getVariable ["KPLIB_captured", false])});
        };
        deleteVehicle _x;
    };
} forEach (_activeGarrisonRef select 3);

// Despawn garrison heavy vehicles
{
    if ((alive _x) && !((crew _x) isEqualTo []) && !(_x getVariable ["KPLIB_captured", false])) then {
        _vehicle = _x;
        _heavyVeh pushBack (typeOf _x);
        {
            _handledCrew pushBack _x;
            _vehicle deleteVehicleCrew _x;
        } forEach ((crew _x) select {!(_x getVariable ["KPLIB_captured", false])});
        deleteVehicle _vehicle;
    };
} forEach (_activeGarrisonRef select 4);

// Despawn crew which leaved their vehicle
{
    if (alive _x && !(_x in _handledCrew)) then {
        deleteVehicle _x;
        _infantry = _infantry + 1;
    };
} forEach ((_activeGarrisonRef select 5) select {!(_x getVariable ["KPLIB_captured", false])});

// Update persistent garrison data
if ((_activeGarrisonRef select 1) isEqualTo (_persistentGarrisonRef select 1)) then {
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

publicVariable "KPLIB_garrison_array";

true
