/*
    KPLIB_fnc_enemy_reinforceGarrison

    File: fn_enemy_reinforceGarrison.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-18
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Generates units/vehicles via the KPLIB_enemy_strength resource and send it to given sector from given military base.

    Parameter(s):
        _base           - Military base sector to send reinforcements from  [STRING, defaults to ""]
        _destination    - Sector which should receive the reinforcements    [STRING, defaults to ""]
        _infantry       - Amount of infantry which should be send           [NUMBER, defaults to 0]
        _vehicleClasses - Array of vehicle classnames which should be send  [ARRAY, defaults to []]

    Returns:
        Array of created groups [ARRAY]
*/

params [
    ["_base", "", [""]],
    ["_destination", "", [""]],
    ["_troops", 0, [0]],
    ["_vehicleClasses", [], [[]]]
];

// Exit, if no military base or destination is given
if (_base isEqualTo "" || !(_base in KPLIB_sectors_military) || _destination isEqualTo "") exitWith {[]};

// Calculate costs and exit, if not enough strength
// !NOTE! Values are placeholder
private _costs = _troops * 2 + (count _vehicleClasses) * 10;
if (_costs > KPLIB_enemy_strength) exitWith {[]};

if (KPLIB_param_enemyDebug) then {[format ["Reinfore garrison of %1 (%2) for %3 strength with [%4, %5]", markerText _destination, _destination, _costs, _troops, _vehicleClasses], "ENEMY"] call KPLIB_fnc_common_log;};

[-_costs] call KPLIB_fnc_enemy_addStrength;

// Add infantry and vehicles to base garrison
[_base, _troops] call KPLIB_fnc_garrison_addInfantry;
{
    if (_x in (KPLIB_preset_vehHeavyApcPlE + KPLIB_preset_vehHeavyPlE)) then {
        [_base, _x, true] call KPLIB_fnc_garrison_addVeh;
    } else {
        [_base, _x] call KPLIB_fnc_garrison_addVeh;
    };
} forEach _vehicleClasses;

// Start garrison transfer convoy
[_base, _destination, _troops, _vehicleClasses] call KPLIB_fnc_enemy_transferGarrison
