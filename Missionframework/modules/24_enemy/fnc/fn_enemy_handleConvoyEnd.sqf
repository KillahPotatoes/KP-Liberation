/*
    KPLIB_fnc_enemy_handleConvoyEnd

    File: fn_enemy_handleConvoyEnd.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
    Last Update: 2019-02-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handles convoy processing, after it reached the destination.

    Parameter(s):
        _units          - Arrived units of convoy   [ARRAY, defaults to []]
        _destination    - Destination of the convoy [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_units", [], [[]]],
    ["_destination", "", [""]]
];

// Get group
private _grp = group (_units select 0);

// !DEBUG!
hint format ["Arrived: %1\nUnits: %2\nDestination: %3 (%4)", units _grp, _units, markerText _destination, _destination];

[_destination, count _units] call KPLIB_fnc_garrison_addInfantry;

{
    deleteVehicle (vehicle _x);
    deleteVehicle _x;
} forEach (units _grp);

true
