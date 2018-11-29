/*
    KPLIB_fnc_build_handleFobBuildConfirm

    File: fn_build_handleFobBuildConfirm.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-29
    Last Update: 2018-11-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handles FOB build confirmation

    Parameter(s):
        _fobBuilding    - Building on which FOB will be created [OBJECT, defaults to objNull]
        _fobBoxObject   - Object from which FOB build orignated [OBJECT, defaults to objNull]

    Returns:
        Confirmation was handled [BOOL]
*/
params [
    ["_fobBuilding", objNull, [objNull]],
    ["_fobBoxObject", objNull, [objNull]]
];

if (isNull _fobBuilding) exitWith {diag_log format ["[KP LIBERATION] [%1] [BUILD] Null object passed, cannot create FOB", diag_tickTime]};

// Create FOB on position of building
private _fobName = [getPos _fobBuilding] call KPLIB_fnc_core_buildFob;
// Emit the built event with FOB and object to assign the object to freshly built FOB
["KPLIB_build_item_built", [_fobBuilding, _fobName]] call CBA_fnc_globalEvent;

// Remove FOB box from which FOB build originated
deleteVehicle _fobBoxObject;

true
