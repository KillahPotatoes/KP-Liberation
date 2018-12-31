#include "script_components.hpp"
/*
    KPLIB_fnc_build_objectUnderCursor

    File: fn_build_objectUnderCursor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns object from build queue that is currently under the cursor

    Parameter(s):
        NONE

    Returns:
       Object that is currently under the cursor [OBJECT]
*/

private _camera = LGVAR(camera);
private _cursorPos = LGVAR(mousePos);
private _queue = LGVAR(buildQueue);

private _target = objNull;
private _cursorWorldPosAGL = (screenToWorld _cursorPos);
private _cursorWorldPosASL = AGLtoASL _cursorWorldPosAGL;
private _camPos = getPosASLVisual _camera;

private _objects = lineIntersectsSurfaces [
    _camPos,
    _cursorWorldPosASL,
    _camera,
    objNull,
    true,
    5
];

if !(_objects isEqualTo []) then {
    {
        private _obj = _x select 2;

        if (_obj in _queue) exitWith {
            _target = _obj;
        };

    } forEach _objects;
};
// If we were not able to find any item directly under cusror try to get one nearest to
if (isNull _target) then {
    private _nearest = nearestObjects [_cursorWorldPosAGL, ["All"], 1] arrayIntersect _queue;

    if !(_nearest isEqualTo []) then {
        _target = _nearest select 0;
    };


};

vehicle _target
