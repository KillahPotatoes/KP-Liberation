/*
    KPLIB_fnc_core_changeSectorOwner

    File: fn_core_changeSectorOwner.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-07
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Changes the ownership of a given sector to the player or enemy side by updating the blufor sectors array.

    Parameter(s):
        _sectorToChange - Sector marker name                                                    [STRING, defaults to ""]
        _toPlayerSide   - True if it should be changed to player side, false if to enemy side   [BOOL, defaults to true]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sectorToChange", "", [""]],
    ["_toPlayerSide", true, [false]]
];

if (_toPlayerSide) then {
    KPLIB_sectors_blufor pushBack _sectorToChange;
    [] call KPLIB_fnc_core_checkWinCond;
} else {
    KPLIB_sectors_blufor deleteAt (KPLIB_sectors_blufor findIf {_x isEqualTo _sectorToChange});
};

publicVariable "KPLIB_sectors_blufor";

true
