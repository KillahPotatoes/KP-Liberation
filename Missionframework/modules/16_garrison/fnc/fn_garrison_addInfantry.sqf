/*
    KPLIB_fnc_garrison_addInfantry

    File: fn_garrison_addInfantry.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-21
    Last Update: 2018-12-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds given amount if infantry units to the garrison of given sector.

    Parameter(s):
        _sector - Markername of the sector                                  [STRING, defaults to ""]
        _amount - Amount of infantry to add (can be negative to substract)  [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]],
    ["_amount", 0, [0]]
];

// Exit, if no valid or an active sector is given
if (!(_sector in KPLIB_sectors_all) || (_sector in KPLIB_garrison_active)) exitWith {false};

private _garrisonRef = [_sector] call KPLIB_fnc_garrison_getGarrison;

// Prevent values below <0
private _curAmount = _garrisonRef select 2;
_amount = (_curAmount + _amount) max 0;

// Add new value to garrison
_garrisonRef set [2, _amount];

// Publish changes to other machines
publicVariable "KPLIB_garrison_array";

true
