/*
    KPLIB_fnc_build_objectUnderCursor

    File: fn_build_objectUnderCursor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Returns object from build queue that is currently under the cursor

    Parameter(s):
    NONE

    Returns:
    OBJECT - Build queue Object that is currently under the cursor
*/

private _logic = missionNamespace getVariable "KPLIB_buildLogic";
private _camera = _logic getVariable "camera";
private _cursorPos = _logic getVariable "mousePos";
private _queue = _logic getVariable "buildQueue";

private _target = objNull;
private _cursorWorldPos = AGLtoASL (screenToWorld _cursorPos);
private _camPos = getPosASLVisual _camera;

private _objects = lineIntersectsSurfaces [
    _camPos,
    _cursorWorldPos,
    _camera,
    objNull,
    true,
    5
];

if !(_objects isEqualTo []) then {
    {
        private _obj = _x select 2;

        if (_obj in _queue) then {
            if (true) exitWith {
                _target = _obj;
            };
        };

    } forEach _objects;
};

vehicle _target
