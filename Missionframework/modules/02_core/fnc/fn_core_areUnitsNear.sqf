/*
    KPLIB_fnc_core_areUnitsNear

    File: fn_core_areUnitsNear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-07
    Last Update: 2018-09-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Checks if there are units from given side(s) inside a given radius around a given position.

    Parameter(s):
        0: POSITION - Position to check for blufor units.
        1: NUMBER - Radius in meters. (Default: 1000m)
        2: ARRAY - Array of SIDE values. (Default: [KPLIB_preset_sidePlayers])

    Returns:
    BOOL
*/

params ["_centerPos", ["_radius", 1000], ["_sidesToCheck", [KPLIB_preset_sidePlayers]]];

private _nearUnits = _centerPos nearEntities ["AllVehicles", _radius];
// Return true if there is any enemy unit in the area
(_nearUnits findIf {side _x in _sidesToCheck} != -1)
