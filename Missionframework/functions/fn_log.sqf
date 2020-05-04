/*
    File: fn_log.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-16
    Last Update: 2020-04-20
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Logs given string to the rpt of the machine while adding KP Liberation prefix.

    Parameter(s):
        _text   - Text to write into log                        [STRING, defaults to ""]
        _tag    - Tag to display between KPLIB prefix and text  [STRING, defaults to "INFO"]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_text", "", [""]],
    ["_tag", "INFO", [""]]
];

if (_text isEqualTo "" || _tag isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};

private _msg = text ([
    "[KPLIB] [",
    _tag,
    "] ",
    _text
] joinString "");

diag_log _msg;

true
