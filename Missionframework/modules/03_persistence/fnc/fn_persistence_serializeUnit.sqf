/*
    KPLIB_fnc_persistence_serializeUnit

    File: fn_persistence_serializeUnit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-20
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: yes

    Description:
        Serializes unit into an array.

    Parameter(s):
        _unit - Unit to serialize [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [ARRAY]
*/
params [
    ["_unit", objNull, [objNull]]
];

[
    typeOf _unit,
    getPosWorld _unit,
    [vectorDir _unit, vectorUp _unit],
    side _unit
]
