/*
    File: fn_getBluforRatio.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the ratio of blufor units in the given sector to the total number of units.

    Parameter(s):
        _sector - Sector to get the blufor / opfor ratio from [STRING, defaults to ""]

    Returns:
        Blufor ratio [NUMBER]
*/

params [
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; -1};

private _range = [KPLIB_range_sectorCapture, KPLIB_range_sectorCapture * 1.4] select (_sector in KPLIB_sectors_capital);
private _red = [(markerPos _sector), _range, KPLIB_side_enemy] call KPLIB_fnc_getUnitsCount;
private _blue = [(markerPos _sector), _range, KPLIB_side_player] call KPLIB_fnc_getUnitsCount;

if (_blue > 0 || _red > 0) then {
    _blue / (_blue + _red)
} else {
    [0, 1] select (_sector in KPLIB_sectors_player)
};
