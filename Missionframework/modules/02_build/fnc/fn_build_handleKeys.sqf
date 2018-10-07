#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleKeys

    File: fn_build_handleKeys.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle display keypresses

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

params [
    ["_mode", nil, [""]],
    ["_args", nil, [[]]]
];

systemChat str _args;

switch toLower _mode do {
    case "onkeydown": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];
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

        if (!LGVAR(shiftKey) && _shift) then {LSVAR(shiftKey, true)};
        if (!LGVAR(ctrlKey) && _ctrl) then {LSVAR(ctrlKey, true)};

        switch _dik do {
            case 211: {
                {deleteVehicle _x} forEach LGVAR(selection);
            };
        };

        false
    };

    case "onkeyup": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        if (LGVAR(shiftKey) && _shift) then {LSVAR(shiftKey, false)};
        if (LGVAR(ctrlKey) && _ctrl) then {LSVAR(ctrlKey, false)};

        false
    };

    default {
        systemChat format["Incorrect mode passed to handleKeys: %1", _mode];
    };

};
