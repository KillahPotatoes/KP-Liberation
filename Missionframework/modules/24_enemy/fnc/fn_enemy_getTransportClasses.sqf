/*
    KPLIB_fnc_enemy_getTransportClasses

    File: fn_enemy_getTransportClasses.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-18
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Gets all transport classnames of preset vehicles which are capable to transport given amount of soldiers.

    Parameter(s):
        _amount - Amount of soldiers which should be transported [NUMBER, defaults to 0]
        _air    - Should it be an air vehicle [BOOL, defaults to false]

    Returns:
        Array of valid vehicle classnames [ARRAY]
*/

params [
    ["_amount", 0, [0]],
    ["_air", false, [false]]
];

// Select ground or air transport array
private _toCheck = [(KPLIB_preset_vehTransPlE + KPLIB_preset_vehLightUnarmedPlE), KPLIB_preset_heliTransPlE] select _air;

// Check via config for enough transport seats and return resulting array
private _validVeh = [];
{
    if ((getNumber (configfile >> "CfgVehicles" >> _x >> "transportSoldier")) >= _amount) then {
        _validVeh pushBack _x;
    };
} forEach _toCheck;

_validVeh
