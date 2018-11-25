/*
    KPLIB_fnc_virtual_removeCurator

    File: fn_virtual_removeCurator.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Removes curator capabilities from unit. Must be executed server side.

    Parameter(s):
        _unit - Unit to remove curator from [OBJECT, defaults to player]

    Returns:
        Curator was removed from unit [BOOL]
*/
params [
    ["_unit", nil, [objNull]]
];

// Remove curator from unit and delete it afterwards
{
    if (_unit isEqualTo getAssignedCuratorUnit _x) then {
        unassignCurator _x;
        deleteVehicle _x;
    };
} forEach allCurators;

true
