/*
    File: fn_getSectorRange.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the sector size with taking the given amount of units into account.

    Parameter(s):
        _unitCount - Number of units to take into account [NUMBER, defaults to 0]

    Returns:
        Calculated sector size [NUMBER]
*/

params [
    ["_unitCount", 0, [0]]
];


if (_unitCount < (KPLIB_cap_enemySide / 2)) exitWith {KPLIB_range_sectorActivation};
if (_unitCount <= KPLIB_cap_enemySide) exitWith {KPLIB_range_sectorActivation - (KPLIB_range_sectorActivation * 0.5 * ((_unitCount / KPLIB_cap_enemySide) - 0.5))};
KPLIB_range_sectorActivation * 0.75
