/*
    KPLIB_fnc_permission_ejectPlayer

    File: fn_permission_ejectPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-23
    Last Update: 2018-12-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Ejects the player and creates a hint.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Kick the player out of the vehicle and give him a hint
moveOut player;

hint localize "STR_KPLIB_HINT_NOPERMISSION";
[{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;

true
