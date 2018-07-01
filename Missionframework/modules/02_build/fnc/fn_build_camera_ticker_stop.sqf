/*
    KPLIB_fnc_build_camera_ticker_stop

    File: fn_build_camera_ticker_stop.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Stops build camera per frame ticker

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

removeMissionEventHandler ["EachFrame", missionNamespace getVariable ["KPLIB_build_ticker", -1]];
deleteVehicle (missionNamespace getVariable ["KPLIB_cam_arrow", objNull]);

true
