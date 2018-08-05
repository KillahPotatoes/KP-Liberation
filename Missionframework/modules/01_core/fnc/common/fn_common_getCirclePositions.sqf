/*
    KPLIB_fnc_common_getCirclePositions

    File: fn_common_getCirclePositions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Generates "_elements" amount of positions on an edge of circle with given "_radius"

    Parameter(s):
        0: POSITION - OPTIONAL -Center of circle (Default: player pos)
        1: NUMBER - OPTIONAL - Radius of circle (Default: Fob built range)
        2: NUMBER - OPTIONAL - Heading of first generated position 0 to 360. (Default: direction 0)
        3: NUMBER - OPTIONAL - Amount of generated positions. Evenly distributedm more positions equals more density (Default: _radius)

    Returns:
    ARRAY - [_x, _y, _z, _angle]
*/
params [
    ["_center", getPos player, [], 3],
    ["_radius", KPLIB_range_fob, 100],
    ["_startDir", 0, 0],
    ["_elements", _radius, 0]
];

private _positions = [];

for "_i" from  0 to _elements do {
    private _angle = _i * (360/_elements);

    private _x = _center select 0 + _radius * cos(_angle);
    private _y = _center select 1 + _radius * sin(_angle);

    _positions pushBack [_x, _y, _center select 2, _angle];
 };

_positions
