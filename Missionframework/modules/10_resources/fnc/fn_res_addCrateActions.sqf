/*
    KPLIB_fnc_res_handleCrateSpawn

    File: fn_res_handleCrateSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds all actions to the resource crates upon spawning.

    Parameter(s):
        _crate - Spawned crate to take care of [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

// Exit if we have no valid crate object
if !((typeOf _crate) in KPLIB_res_crateClasses) exitWith {false};

// Add check content action to crate
[
    _crate,
    "STR_KPLIB_ACTION_CHECKCRATE",
    [{[_this select 0] call KPLIB_fnc_res_checkCrate;}, nil, -500, false, true, "", "", 4],
    "#FFFF00"
] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

true
