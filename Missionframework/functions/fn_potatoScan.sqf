/*
    File: fn_potatoScan.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2023-05-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current Potato 01, if alive.

    Parameter(s):
        NONE

    Returns:
        Potato 01 [OBJECT]
*/

private _potatoes = entities "AIR" select {typeof _x == KPLIB_b_potato01 && alive _x};
if !(_potatoes isEqualTo []) then {
    _potatoes select 0
} else {
    objNull
};
