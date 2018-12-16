/*
    KPLIB_fnc_build_camAreaLimiter

    File: fn_build_camAreaLimiter.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Build camera per frame ticker, limits camera area.

    Parameter(s):
        _camera     - Camera object                     [OBJECT, defaults to objNull]
        _position   - Limiter center area               [POSITION, defaults to position _camera]
        _radius     - Allowed camera flying radius      [NUMBER, defaults to KPLIB_param_fobRange]

    Returns:
        PFH was created [BOOL]
*/

params [
    ["_camera", objNull, [objNull]],
    ["_position", KPLIB_zeroPos, [[]], 3],
    ["_radius", KPLIB_param_fobRange, [0]]
];

// Default position to position of camera
if (_position isEqualTo KPLIB_zeroPos) then {_position = getPos _camera};

[{
    params ["_args", "_handle"];
    _args params ["_position", "_radius","_camera"];

    if(isNull _camera) exitWith {
        systemChat "Camera does not exist, stopping area limiter.";
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentCamPos = (getPos _camera);

    // Check if camera is in FOB area
    private _inArea = _currentCamPos inArea [_position, _radius + 5, _radius + 5, 0, false];
    // If not force it back
    if (!_inArea) then {
        // Get the direction towards the center
        private _dir = _currentCamPos getDir _position;
        // The more outside the area the faster the camera will be pulled back in
        private _step = ((_currentCamPos distance2D _position) - _radius - 5) / 10;
        // Get new position
        private _newPos = (_camera getPos [_step, _dir]);
        _newPos set [2, _currentCamPos select 2]; // use old Z
        // Move camera back towards the center
        _camera setPos _newPos;
    };

}, 0, [_position, _radius, _camera]] call CBA_fnc_addPerFrameHandler;

true
