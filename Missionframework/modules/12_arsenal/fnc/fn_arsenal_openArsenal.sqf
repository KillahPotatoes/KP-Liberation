/*
    KPLIB_fnc_arsenal_openArsenal

    File: fn_arsenal_openArsenal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-14
    Last Update: 2018-11-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the arsenal dependent on the selected type.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_arsenalType isEqualTo 1 && KPLIB_ace_enabled) then {
    [player, player, false] call ace_arsenal_fnc_openBox;
} else {
    ["Open", false] call BIS_fnc_arsenal;
};

closeDialog 0;

true
