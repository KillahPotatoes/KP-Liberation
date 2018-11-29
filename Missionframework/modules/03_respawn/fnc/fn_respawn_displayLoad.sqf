#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayLoad

    File: fn_respawn_displayLoad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-11
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle respawn dialog load

    Parameter(s):
        _display - Respawn display [DISPLAY, defaults to nil]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_display", nil, [displayNull]]
];

// Make display unclosable if player is dead
if (!alive player) then {
    _display displayAddEventHandler ["KeyDown", {
        params ["_display","_dik","_shift","_ctrl","_alt"];
        if (_dik == 1) exitWith {
            [] spawn {
                disableSerialization;
                private _interruptDisplay = (findDisplay 46) createDisplay "RscDisplayInterrupt";
                waitUntil {_interruptDisplay isEqualTo displayNull};
                [] call KPLIB_fnc_respawn_open;
            };
        };
    }];
};

// Fill loadouts list
_display call KPLIB_fnc_respawn_displayUpdateLoadouts;

// Fill respawns list
[{
    params ["_display", "_handle"];
    if (_display isEqualTo displayNull) then {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _display call KPLIB_fnc_respawn_displayUpdateRespawns;
}, 5, _display] call CBA_fnc_addPerFrameHandler;

true
