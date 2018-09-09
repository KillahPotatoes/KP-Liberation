/*
    KPLIB_fnc_build_stop

    File: fn_build_stop.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-09-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Stops KP Liberation building mode

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

private _logic = missionNamespace getVariable ["KPLIB_buildLogic", nil];

if !(isNil "_logic") then {
    camDestroy (_logic getVariable ["camera", objNull]);
    (_logic getVariable ["display", displayNull]) closeDisplay 0;
    {deleteVehicle _X} forEach (_logic getVariable ["spheres", []]);
    {deleteVehicle _X} forEach (_logic getVariable ["buildQueue", []]);
    _logic call CBA_fnc_deleteNamespace;
};
