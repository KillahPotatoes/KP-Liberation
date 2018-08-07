/*
    KPLIB_fnc_core_canBuildFob

    File: fn_core_canBuildFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Checks if player can build FOB from box.

    Parameter(s):
        0: OBJECT - FOB box.
        1: OBJECT - Player trying to build FOB.

    Returns:
    BOOL
*/

params ["_box", "_player"];

// Built FOB range should not overlap over sector range
private _minSectorDist = KPLIB_range_fob + KPLIB_range_capture;

(alive _box
&&_box distance2D KPLIB_eden_startbase > 300
&& ([_minSectorDist, getPos _box] call KPLIB_fnc_core_getNearestSector == ""))

