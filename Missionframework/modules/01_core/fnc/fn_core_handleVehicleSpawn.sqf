/*
    KPLIB_fnc_core_handleVehicleSpawn

    File: fn_core_handleVehicleSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-10
    Last Update: 2018-09-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle vehicle spawn event

    Parameter(s):
        0: OBJECT - Vehicle which was spawned

    Returns:
    NOTHING
*/
params ["_vehicle"];

switch(typeOf _vehicle) do {
    case KPLIB_preset_fobBox;
    case KPLIB_preset_fobTruck: {
        // Add FOB build action globaly and for JIP
        [
            _vehicle,
            [localize "STR_ACTION_FOB_DEPLOY", {[param [0], param [1], param[3]] call KPLIB_fnc_core_buildFob}, true, -800, false, true, "", "[_target, _this] call KPLIB_fnc_core_canBuildFob", 10]
        ] remoteExecCall ["addAction", 0, true];
    };

    case KPLIB_preset_potato: {
        // Add redeploy action globaly and for JIP
        [
            _vehicle,
            [localize "STR_ACTION_REDEPLOY", {[] spawn KPLIB_fnc_core_redeploy}, nil, -801, false, true, "", "_target == _originalTarget", 10]
        ] remoteExecCall ["addAction", 0, true];
    };
};
