/*
    File: fn_destroyFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-28
    Last Update: 2020-05-25
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

private _buildings = [toLowerANSI KPLIB_b_fobBuilding];
_buildings append KPLIB_b_deco_classes;

{
    if ((toLowerANSI (typeOf _x)) in _buildings) then {
        _x spawn {
            sleep ((random 4) + (random 4));
            _this setDamage 1;
        };
    };
} forEach ((_fobPos nearObjects (KPLIB_range_fob * 1.2)) select {getObjectType _x >= 8});

KPLIB_clearances deleteAt (KPLIB_clearances findIf {(_x select 0) isEqualTo _fobPos});
publicVariable "KPLIB_clearances";

true
