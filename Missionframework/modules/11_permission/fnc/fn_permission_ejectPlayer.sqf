/*
    KPLIB_fnc_permission_ejectPlayer

    File: fn_permission_ejectPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-23
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Ejects the player and creates a hint.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Kick the player out of the vehicle and give him a hint
moveOut player;

[
    ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
    [localize "STR_KPLIB_HINT_NOVEHICLEPERMISSION"]
] call CBA_fnc_notify;

true
