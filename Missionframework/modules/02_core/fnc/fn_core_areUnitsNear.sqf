/*
    KPLIB_fnc_core_areUnitsNear

    File: fn_core_areUnitsNear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-07
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks if there are units from given side(s) inside a given radius around a given position.

    Parameter(s):
        _centerPos      - Position to check for blufor units    [POSITION, defaults to KPLIB_zeroPos]
        _radius         - Radius in meters                      [NUMBER, defaults to 1000]
        _sidesToCheck   - Array of SIDE values                  [ARRAY, defaults to KPLIB_preset_sidePlayers]

    Returns:
        Result [BOOL]
*/

// TODO
// Guess we can move this to common

params [
    ["_centerPos", KPLIB_zeroPos, [[]], [2,3]],
    ["_radius", 1000, [0]],
    ["_sidesToCheck", [KPLIB_preset_sidePlayers], [[]]]
];

private _nearUnits = _centerPos nearEntities ["AllVehicles", _radius];
// Return true if there is any enemy unit in the area
(_nearUnits findIf {side _x in _sidesToCheck} != -1)
