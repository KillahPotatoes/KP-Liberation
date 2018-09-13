/*
    KPLIB_fnc_respawn_onKilled

    File: fn_respawn_onKilled.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

systemChat "onRespawn";

// Set respawn time to really long
setPlayerRespawnTime 999999999;
