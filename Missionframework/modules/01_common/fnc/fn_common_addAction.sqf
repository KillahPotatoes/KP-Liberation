/*
    KPLIB_fnc_common_addAction

    File: fn_common_addAction.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-05
    Last Update: 2018-12-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds given action local to given object.
        This should be used if adding an action to an object to ensure the localization is correct.

    Parameter(s):
        _target - Object to add the action to                                   [OBJECT, defaults to objNull]
        _string - Stringtable string key for the action                         [STRING, defaults to ""]
        _args   - Array of all other arguments for addAction without the title  [ARRAY, defaults to []]
        _color  - Hex code of desired color e.g. #FF8000. Optional.             [STRING, defaults to ""]

    Returns:
        Action added [BOOL]
*/

params [
    ["_target", objNull, [objNull]],
    ["_string", "", [""]],
    ["_args", [], [[]], []],
    ["_color", "", [""]]
];

// Leave if there are parameters missing
if (isNull _target || _string isEqualTo "" || _args isEqualTo []) exitWith {false};

// Localize local to clients language
_string = localize _string;

// Add color, if provided
if !(_color isEqualTo "") then {
    _string = ["<t color='", _color, "'>", _string, "</t>"] joinString "";
};

// Wrap as array and append all args
private _actionArray = [_string];
_actionArray append _args;

// Add action to target
_target addAction _actionArray;

true
