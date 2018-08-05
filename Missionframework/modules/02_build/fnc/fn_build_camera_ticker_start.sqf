/*
    KPLIB_fnc_build_camera_ticker_start

    File: fn_build_camera_ticker_start.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Build camera per frame ticker

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

KPLIB_cam_arrow = "Sign_Arrow_Large_Blue_F" createVehicle [0,0,0];

// Wait for camera and create PFH
[{!isNull KPLIB_build_camera}, {

    private _fob = player getVariable "KPLIB_fob";
    private _camera = missionNamespace getVariable ["KPLIB_build_camera", objNull];

    KPLIB_build_ticker = [{
        (_this select 0 ) params ["_fobPos", "_camera"];

        private _currentCamPos = (getPos _camera);

        // Check if camera is in FOB area
        private _inArea = _currentCamPos inArea [_fobPos, KPLIB_range_fob + 5, KPLIB_range_fob + 5, 0, false];
        // If not force it back
        if (!_inArea) then {
            // Get the direction towards the center of FOB
            private _dir = _currentCamPos getDir _fobPos;
            // The more outside the area the faster the camera will be pulled back in
            private _step = ((_currentCamPos distance2D _fobPos) - KPLIB_range_fob - 5) / 10;
            // Get new position
            private _newPos = (_camera getPos [_step, _dir]);
            _newPos set [2, _currentCamPos select 2]; // use old Z
            // Move camera back towards the center
            _camera setPos _newPos;
        };

        // Update "cursor" position
        private _pos = screenToWorld [0.5, 0.5];
        KPLIB_cam_arrow setPosASL (AGLToASL _pos);

    }, 0, [getMarkerPos _fob, _camera]] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_waitUntilAndExecute;

true
