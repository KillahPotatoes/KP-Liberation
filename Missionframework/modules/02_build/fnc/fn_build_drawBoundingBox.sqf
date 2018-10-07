/*
    KPLIB_fnc_build_drawBoundingBox

    File: fn_build_drawBoundingBox.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-29
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
        0: OBJECT - Object to draw bounding box on
        1: ARRAY - Color array in drawLine3D format

    Returns:
    NOTHING
*/
params [
    ["_object", objNull, [objNull]],
    ["_color", [1,1,1,1], [[]]]
];

// Get left bottom and right top corners
(boundingBoxReal _object) params ["_c1", "_c2"];

// Draw the bounding box
{
    _x params ["_from", "_to"];

    // Draw the line
    drawLine3D [
        _object modelToWorldVisual _from,
        _object modelToWorldVisual  _to,
        _color
    ];

} forEach [
    [_c1, [_c1#0, _c1#1, _c2#2]],
    [_c1, [_c1#0, _c2#1, _c1#2]],
    [_c1, [_c2#0, _c1#1, _c1#2]],

    [_c2, [_c2#0, _c2#1, _c1#2]],
    [_c2, [_c2#0, _c1#1, _c2#2]],
    [_c2, [_c1#0, _c2#1, _c2#2]],

    [[_c1#0, _c2#1, _c1#2], [_c2#0, _c2#1, _c1#2]],
    [[_c2#0, _c1#1, _c1#2], [_c2#0, _c1#1, _c2#2]],
    [[_c1#0, _c1#1, _c2#2], [_c2#0, _c1#1, _c2#2]],
    [[_c1#0, _c1#1, _c2#2], [_c1#0, _c2#1, _c2#2]],
    [[_c2#0, _c1#1, _c1#2], [_c2#0, _c2#1, _c1#2]],
    // front bottom left > front top left (vertical)
    [[_c1#0, _c2#1, _c1#2], [_c1#0, _c2#1, _c2#2]]
];
