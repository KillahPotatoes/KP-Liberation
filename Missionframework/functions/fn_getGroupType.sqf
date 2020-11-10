/*
    File: fn_getGroupType.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-04-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the type of a given group.
        Can be infantry, light, heavy, air, support, static or UAV.

    Parameter(s):
        _grp - Group to get the type from [GROUP, defaults to grpNull]

    Returns:
        Group type [STRING]
*/

params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitWith {["Null group given"] call BIS_fnc_error; ""};

private _grpType = "infantry";
private _vehType = "";

// Get vehicle type, if at least one group member is in a crew seat
private _parent = objNull;
{
    _parent = objectParent _x;
    if (!(isNull _parent) && {_x in [driver _parent, gunner _parent, commander _parent]}) exitWith {
        _vehType = typeOf (objectParent _x);
    };
} forEach (units _grp);

// Exit with infantry, if not as crew in objectParent
if (_vehType isEqualTo "") exitWith {_grpType};

// Otherwise continue to get the type of the vehicle
[] call {
    if ((toLower _vehType) in KPLIB_b_light_classes) exitWith {_grpType = "light";};
    if ((toLower _vehType) in KPLIB_b_heavy_classes) exitWith {_grpType = "heavy";};
    if ((toLower _vehType) in KPLIB_b_air_classes) exitWith {_grpType = "air";};
    if ((toLower _vehType) in KPLIB_b_static_classes) exitWith {_grpType = "static";};
    if ((toLower _vehType) in KPLIB_b_support_classes) exitWith {_grpType = "support";};
    if ([_vehType] call KPLIB_fnc_isClassUAV) exitWith {_grpType = "uav";};
};

_grpType
