/*
    File: fn_destroyFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-28
    Last Update: 2020-04-29
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Removes all player built buildings (from build list) inside the FOB radius of given position.
        Also removes possible clearances from given position.

    Parameter(s):
        _fobPos - Center position [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_fobPos", [], [[]]]
];

private _buildings = [toLower FOB_typename];
_buildings append KPLIB_b_buildings_classes;

{
    if ((toLower (typeOf _x)) in _buildings) then {
        _x spawn {
            sleep ((random 4) + (random 4));
            _this setDamage 1;
        };
    };
} forEach ((_fobPos nearObjects (GRLIB_fob_range * 1.2)) select {getObjectType _x >= 8});

KP_liberation_clearances deleteAt (KP_liberation_clearances findIf {(_x select 0) isEqualTo _fobPos});
publicVariable "KP_liberation_clearances";

true
