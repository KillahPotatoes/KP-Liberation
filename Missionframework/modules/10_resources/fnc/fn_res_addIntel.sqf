/*
    KPLIB_fnc_res_addIntel

    File: fn_res_addIntel.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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

KPLIB_res_intel = KPLIB_res_intel + _add;

if (KPLIB_res_intel < 0) then {KPLIB_res_intel = 0;};

publicVariable "KPLIB_res_intel";

true
