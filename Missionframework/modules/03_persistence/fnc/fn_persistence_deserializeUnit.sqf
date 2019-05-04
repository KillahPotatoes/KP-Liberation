/*
    KPLIB_fnc_persistence_deserializeUnit

    File: fn_persistence_deserializeUnit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-26
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Deserializes unit from array.

    Parameter(s):
        _type       - Description                                               [STRING, defaults to ""]
        _pos        - Position WORLD                                            [Pos WORLD, defaults to KPLIB_zeroPos]
        _dirAndUp   - Dir and up                                                [ARRAY, defaults to [[0,1,0], [0,0,1]]]
        _side       - Side of unit, ignored if group is provided                [SIDE, defaults to KPLIB_preset_sideF]
        _group      - Group to add unit to, new is created if argument is empty [GROUP, defaults to grpNull]

    Returns:
        Function reached the end [OBJECT]
*/
params [
    ["_type", "", [""]],
    ["_pos", KPLIB_zeroPos, [[]], 3],
    ["_dirAndUp", [[0,1,0], [0,0,1]], [[]], 2],
    ["_side", KPLIB_preset_sideF, [sideUnknown]],
    ["_group", grpNull, [grpNull]]
];

if (isNull _group) then {
    _group = createGroup _side;
};

private _unit = [_group, _type] call KPLIB_fnc_common_createUnit;
_unit setPosWorld _pos;
_unit setVectorDirAndUp _dirAndUp;

// Set watching direction
if (_unit isEqualTo formLeader _unit) then {
    _unit setFormDir getDir _unit;
};

_unit
