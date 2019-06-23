/*
    KPLIB_fnc_common_fps

    File: fn_common_fps.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-08
    Last Update: 2019-06-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Returns the current FPS or, if a number is given, if the FPS are above or equal given number.

    Parameter(s):
        _fps - Value to check if FPS are equal or above. -1 to get current FPS. [NUMBER, defaults to -1]

    Returns:
        Current FPS above given number or current FPS value [BOOL or NUMBER]
*/

params [
    ["_fps", -1, [0]]
];

if (_fps > -1) then {
    diag_fps >= _fps
} else {
    parseNumber (diag_fps toFixed 2)
};
