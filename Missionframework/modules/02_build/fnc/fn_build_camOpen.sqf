/*
    KPLIB_fnc_build_camOpen

    File: fn_build_camOpen.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the build camera and creates build overlay

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

private _camera = "CamCurator" camCreate (eyePos player);

// Animate player
player playactionnow "gear";

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

[] call KPLIB_fnc_build_camera_ticker_start;

KPLIB_build_camera = _camera;

private _display = (findDisplay 46) createDisplay "KPLIB_build";
uiNamespace setVariable ["KPLIB_build_display", _display];

true
