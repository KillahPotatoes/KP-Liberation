/*
    KPLIB_fnc_captive_checkSector

    File: fn_captive_checkSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-10
    Last Update: 2019-09-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Checks the given sector for remaining enemys and lets them surrender.

    Parameter(s):
        _sector - Sector marker [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

// Exit if no sector is given
if (_sector isEqualTo "") exitWith {
    false
};

private _sectorPos = getMarkerPos _sector;

// Check the sector for remaining units
{
    [_x] call KPLIB_fnc_captive_setSurrender;
} forEach ((_sectorPos nearEntities ["Man", KPLIB_param_sectorCapRange * 2]) select {side _x isEqualTo KPLIB_preset_sideE});

true
