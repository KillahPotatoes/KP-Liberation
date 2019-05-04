/*
    KPLIB_fnc_resources_addIntel

    File: fn_resources_addIntel.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Adds (or substracts with negative value given) given value to the intel points.

    Parameter(s):
        _add - Amount to add to the intel points. Can be negative to substract [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_add", 0, [0]]
];

KPLIB_resources_intel = KPLIB_resources_intel + _add;

if (KPLIB_resources_intel < 0) then {KPLIB_resources_intel = 0;};

publicVariable "KPLIB_resources_intel";

true
