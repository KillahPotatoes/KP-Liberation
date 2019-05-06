/*
    KPLIB_fnc_common_log

    File: fn_common_log.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-15
    Last Update: 2019-04-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        A replacement for the diag_log function. This should be used instead of the vanilla function.
        It'll add automatically the [KP LIBERATION] tag and allows to specify a module tag and if the diag_tickTime should be shown.
        It also gets rid of the quotation marks in the rpt for the log messages.

    Parameter(s):
        _text       - Text of the log entry                                                     [STRING, defaults to ""]
        _module     - Tag which should be written before the log entry text in square brackets  [STRING, defaults to ""]
        _tickTime   - Should a diag_tickTime shown in the log entry                             [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_text", "", [""]],
    ["_module", "", [""]],
    ["_tickTime", false, [false]]
];

// Compose log entry
private _entry = [
    "[KP LIBERATION] ",
    (["", format ["[%1] ", diag_tickTime]] select _tickTime),
    (["", format ["[%1] ", _module]] select !(_module isEqualTo "")),
    _text
] joinString "";

// Write log entry
diag_log text _entry;

true
