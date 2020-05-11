/*
    File: fn_getSectorRange.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-10
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


if (_unitCount < (KPLIB_sector_cap / 2)) exitWith {KPLIB_sector_size};
if (_unitCount <= KPLIB_sector_cap) exitWith {KPLIB_sector_size - (KPLIB_sector_size * 0.5 * ((_unitCount / KPLIB_sector_cap) - 0.5))};
KPLIB_sector_size * 0.75
