/*
    KPLIB_fnc_build_open

    File: fn_build_open.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the build camera and creates build overlay

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Close camera
camDestroy (missionNamespace getVariable ["KPLIB_build_camera", objNull]);
// Close overlay display
(uiNamespace getVariable ["KPLIB_build_display", displayNull]) closeDisplay 1;
// Stop PFH
call KPLIB_fnc_build_camera_ticker_stop;

true
