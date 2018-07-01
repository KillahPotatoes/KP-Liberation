/*
    KPLIB_fnc_build_camera_ticker_start

    File: fn_build_camera_ticker_start.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Build camera per frame ticker

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

KPLIB_cam_arrow = "Sign_Arrow_Large_Blue_F" createVehicle [0,0,0];
KPLIB_build_ticker = addMissionEventHandler ["EachFrame", {
    private _pos = screenToWorld [0.5, 0.5];
    KPLIB_cam_arrow setPosASL (AGLToASL _pos);
}];

true
