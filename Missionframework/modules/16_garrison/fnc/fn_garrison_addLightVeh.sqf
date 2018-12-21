/*
    KPLIB_fnc_garrison_addLightVeh

    File: fn_garrison_addLightVeh.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-21
    Last Update: 2018-12-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds given vehicle classname to the light vehicle garrison of given sector.

    Parameter(s):
        _sector - Markername of the sector          [STRING, defaults to ""]
        _class  - Classname of the vehicle to add   [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]],
    ["_class", "", [""]]
];

// Exit, if no valid sector, an active sector or no classname is given
if (!(_sector in KPLIB_sectors_all) || (_sector in KPLIB_garrison_active) || (_class isEqualTo "")) exitWith {false};

private _garrisonRef = [_sector] call KPLIB_fnc_garrison_getGarrison;

_garrisonRef set [3, (_garrisonRef select 3) pushBack _class];

true
