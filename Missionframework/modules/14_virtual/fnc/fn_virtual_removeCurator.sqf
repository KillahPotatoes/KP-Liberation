/*
    KPLIB_fnc_virtual_removeCurator

    File: fn_virtual_removeCurator.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Removes curator capabilities from unit. Must be executed server side.

    Parameter(s):
        _unit - Unit to remove curator from [OBJECT, defaults to objNull]

    Returns:
        Curator was removed from unit [BOOL]
*/
params [
    ["_unit", objNull, [objNull]]
];

if (KPLIB_param_debug) then {[format ["Removing curator from unit '%1'", _unit], "VIRTUAL", true] call KPLIB_fnc_common_log;};

// Remove curator from unit and delete it afterwards
{
    if (_unit isEqualTo getAssignedCuratorUnit _x) then {
        unassignCurator _x;
        deleteVehicle _x;
    };
} forEach allCurators;

true
