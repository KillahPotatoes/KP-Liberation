/*
    KPLIB_fnc_garrison_despawn

    File: fn_garrison_despawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

params [
    ["_sector", "", [""]]
];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Despawn for %2", diag_tickTime, _sector];};

true
