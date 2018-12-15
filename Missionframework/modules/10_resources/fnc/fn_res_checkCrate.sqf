/*
    KPLIB_fnc_res_checkCrate

    File: fn_res_checkCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Displays the amount of resources inside a given crate as hint.

    Parameter(s):
        _crate - Resource crate to check [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

hint format [localize "STR_KPLIB_HINT_RESCRATECONTENT", _crate getVariable ["KPLIB_resValue", 0]];
[{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;

true
