/*
    KPLIB_fnc_core_areUnitsNear

    File: fn_core_areUnitsNear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-07
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks if there are units from given side(s) inside a given radius around a given position.

    Parameter(s):
        _centerPos      - Position to check for units           [POSITION, defaults to nil]
        _radius         - Radius in meters                      [NUMBER, defaults to 1000]
        _sidesToCheck   - Array of SIDE values                  [ARRAY, defaults to KPLIB_preset_sideF]

    Returns:
        Result [BOOL]
*/

// TODO
// Guess we can move this to common

params [
    ["_centerPos", nil, [[]], [2,3]],
    ["_radius", 1000, [0]],
    ["_sidesToCheck", [KPLIB_preset_sideF], [[]]]
];

if (isNil "_centerPos") exitWith {false};

private _nearUnits = _centerPos nearEntities ["AllVehicles", _radius];
// Return true if there is any unit of given side in the area
(_nearUnits findIf {side _x in _sidesToCheck} != -1)
