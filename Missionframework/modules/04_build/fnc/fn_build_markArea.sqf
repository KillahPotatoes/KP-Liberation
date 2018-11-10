/*
    KPLIB_fnc_build_markArea

    File: fn_build_markArea.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates sphere indicators around given area (LOCALLY)

    Parameter(s):
        _position   - Center position of area to mark           [POSITION, defaults to KPLIB_zeroPos]
        _radius     - Radius to mark around the center position [NUMBER, defaults to nil]

    Returns:
        Array with created spheres [ARRAY]
*/
params [
    ["_position", KPLIB_zeroPos, [[]], 3],
    ["_radius", nil, [0]]
];

private _indicatorClass = "Sign_Sphere100cm_F";

// Create spheres array
private _spheres = [];

// Get positions
private _indicatorsPositions = [_position, _radius] call KPLIB_fnc_common_getCirclePositions;

// Create spheres
{
    private _pos = _x select [0, 3];

    private _sphere = _indicatorClass createVehicleLocal [0, 0, 0];
    _sphere setPos _pos;

    _spheres pushBack _sphere;

} forEach _indicatorsPositions;

_spheres
