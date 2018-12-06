/*
    KPLIB_fnc_core_heliToDeck

    File: fn_core_heliToDeck.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-05
    Last Update: 2018-12-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Moves given helicopter from the Liberty hangar to the aft deck, when it's empty.

    Parameter(s):
        _heli - Helicopter which should be moved. [OBJECT, defaults to objNull]

    Returns:
        Helicopter moved to aft deck [BOOL]
*/

params [
    ["_heli", objNull, [objNull]]
];

// No Heli, no script
if (isNull _heli) exitWith {false};

// ATL pos of the aftdeck center
private _aftDeckPos = getPosATL KPLIB_eden_potatospawn;

// Get all objects on the aft deck and exclude our spawnmarker cluttercutters (not compatible with ATL, so we use 2D)
private _nearEntities = ([_aftDeckPos select 0, _aftDeckPos select 1] nearEntities 15) select {!((typeOf _x) isEqualTo "Land_ClutterCutter_small_F")};

// Exit, if the aft deck is blocked or somebody is inside the heli
if !((crew _heli) isEqualTo [] && _nearEntities isEqualTo []) exitWith {
    hint localize "STR_KPLIB_HINT_HELIMOVEBLOCKED";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    false
};

// Disable damage handling and simulation.
_heli allowDamage false;
_heli enableSimulationGlobal false;

// Move the helicopter to the aft deck
_heli setPosATL [_aftDeckPos select 0, _aftDeckPos select 1, (_aftDeckPos select 2) + 0.1];

// Activate the simulation again.
_heli enableSimulationGlobal true;
_heli setDamage 0;
_heli allowDamage true;

true
