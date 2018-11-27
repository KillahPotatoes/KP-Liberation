/*
    KPLIB_fnc_init_timeMultiApply

    File: fn_init_timeMultiApply.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Applies the chosen time multiplier.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if !(isServer) exitWith {};

setTimeMultiplier KPLIB_param_timeMulti;

true
