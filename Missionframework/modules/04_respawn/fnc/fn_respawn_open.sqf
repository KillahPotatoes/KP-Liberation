/*
    KPLIB_fnc_respawn_open

    File: fn_respawn_open.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-29
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the redeploy dialog

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Open display
(findDisplay 46) createDisplay "KPLIB_redeploy";

true
