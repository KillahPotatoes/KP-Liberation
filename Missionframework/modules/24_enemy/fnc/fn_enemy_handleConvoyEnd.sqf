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

private _garrisonRef = [_destination, true] call KPLIB_fnc_garrison_getGarrison;

if (_garrisonRef isEqualTo []) then {
    // Delete units and add to garrison, if sector isn't active
    [_destination, count _units] call KPLIB_fnc_garrison_addInfantry;
    {
        deleteVehicle (vehicle _x);
        deleteVehicle _x;
    } forEach (units _grp);
} else {
    // Add infantry and vehicles to active garrison array for a possible later despawn
    {
        private _parent = objectParent _x;

        // Assign to active garrison arrays according to arrived type of reinforcement
        switch (true) do {
            case ((typeOf _parent) in KPLIB_preset_vehLightArmedPlE): {(_garrisonRef select 3) pushBackUnique _parent;};
            case ((typeOf _parent) in (KPLIB_preset_vehHeavyApcPlE + KPLIB_preset_vehHeavyPlE)): {(_garrisonRef select 4) pushBackUnique _parent;};
            default {
                (_garrisonRef select 2) pushBackUnique _x;
                // If it's infantry with a transport vehicle, let them disembark
                if !(isNull _parent) then {
                    _grp leaveVehicle _parent;
                    (_garrisonRef select 3) pushBackUnique _parent;
                };
            };
        };
    } forEach (units _grp);

    // Add patrol task to arrived group
    [_grp, markerPos _destination, 150, 3, 1, 0.6] call CBA_fnc_taskDefend;
};

true
