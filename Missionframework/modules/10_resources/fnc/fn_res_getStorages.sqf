/*
    KPLIB_fnc_res_getStorages

    File: fn_res_getStorages.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-16
    Last Update: 2019-02-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns all storages inside given radius of a given position.

    Parameter(s):
        _center - Position AGL from where to look for storages  [POSITION AGL, defaults to KPLIB_zeroPos]
        _radius - Radius from the center                        [NUMBER, defaults to 100]

    Returns:
        All found storage objects [ARRAY]
*/

params [
    ["_center", KPLIB_zeroPos, [[]], 3],
    ["_radius", 100, [0]]
];

nearestObjects [_center, KPLIB_res_storageClasses, _radius]
