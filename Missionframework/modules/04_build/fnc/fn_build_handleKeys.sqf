#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleKeys

    File: fn_build_handleKeys.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-11-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle display keypresses

    Parameter(s):
        _mode - Display keypress mode                                                                   [STRING, defaults to nil]
        _args - Gives the display or control, the keyboard code and the state of Shift, Ctrl and Alt    [ARRAY, defaults to nil]

    Returns:
        Stop handling key presses [BOOL]
*/

params [
    ["_mode", nil, [""]],
    ["_args", nil, [[]]]
];

switch toLower _mode do {
    case "onkeydown": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        if (!LGVAR(shiftKey)) then {LSVAR("shiftKey", _shift)};
        if (!LGVAR(ctrlKey)) then {LSVAR("ctrlKey", _ctrl)};

        // ESC
        if (_dik == 1) exitWith {
            // [] call KPLIB_fnc_build_stop;
            // Open debug ESC menu (for debugging)
            [] spawn {
                disableSerialization;
                private _interruptDisplay = (findDisplay 46) createDisplay "RscDisplayInterrupt";
                waitUntil {_interruptDisplay isEqualTo displayNull};
                (findDisplay 46) createDisplay "KPLIB_build";
            };
            true
        };

        switch _dik do {
            case 211: {
                private _queue = LGVAR(buildQueue);
                // Remove items from build queue
                LSVAR("buildQueue", _queue - LGVAR(selection));
                // Delete objects
                {deleteVehicle _x} forEach LGVAR(selection);
                // Clear selection
                LSVAR("selection", [])
            };
        };

        false
    };

    case "onkeyup": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        if (LGVAR(shiftKey)) then {LSVAR("shiftKey", !_shift)};
        if (LGVAR(ctrlKey)) then {LSVAR("ctrlKey", !_ctrl)};

        false
    };

    default {
        diag_log format ["[KP LIBERATION] [BUILD] Incorrect mode passed to handleKeys: %1", _mode]
    };

};
