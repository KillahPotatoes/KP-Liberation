#include "script_components.hpp"
/*
    KPLIB_fnc_build_stop

    File: fn_build_stop.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Stops KP Liberation building mode

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

private _logic = missionNamespace getVariable "KPLIB_buildLogic";

if !(isNull _logic) then {
    camDestroy LGVAR_D(camera, objNull);
    (_logic getVariable ["display", displayNull]) closeDisplay 0;
    {deleteVehicle _X} forEach LGVAR_D(areaIndicators, []);
    {deleteVehicle _X} forEach LGVAR_D(buildQueue, []);
    _logic call CBA_fnc_deleteNamespace;
};
