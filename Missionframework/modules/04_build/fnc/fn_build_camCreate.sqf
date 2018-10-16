/*
    KPLIB_fnc_build_camOpen

    File: fn_build_camOpen.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates the build camera

    Parameter(s):
    NONE

    Returns:
    OBJECT - Building camera
*/
params [
    ["_position", nil, [[]]],
    ["_radius", nil, [0]]
];

private _camera = "CamCurator" camCreate (eyePos player);

_camera cameraEffect ["internal", "back"];
_camera camCommand "maxPitch 89";
_camera camCommand "minPitch -89";
// Same speed no matter the height
_camera camCommand "surfaceSpeed off";
// Do not track terrain
_camera camCommand "atl off";

_camera camCommand format ["speedDefault %1", 1];
_camera camCommand format ["speedMax %1", 1.5];
// Enable display of GUI in camera
cameraEffectEnableHUD true;

[_position, _radius, _camera] call KPLIB_fnc_build_camAreaLimiter;

_camera
