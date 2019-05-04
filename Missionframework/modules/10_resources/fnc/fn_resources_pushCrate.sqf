/*
    KPLIB_fnc_resources_pushCrate

    File: fn_resources_pushCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Pushes the crate slightly away from the player.

    Parameter(s):
        _crate - Crate which should be moved [OBJECT, defaults to objNull]

    Returns:
        Crate was pushed [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

// Exit if we have no valid crate object
if !((typeOf _crate) in KPLIB_resources_crateClasses) exitWith {false};

// Move the crate 1m away from the player
_crate setPos (_crate getPos [1, (player getDir _crate)]);

true
