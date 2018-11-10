/*
    KPLIB_fnc_core_handleVehicleSpawn

    File: fn_core_handleVehicleSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-10
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle vehicle spawn event

    Parameter(s):
        _vehicle - Vehicle which was spawned [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_vehicle", objNull, [objNull]]
];

switch(typeOf _vehicle) do {
    case KPLIB_preset_fobBox;
    case KPLIB_preset_fobTruck: {
        // Add FOB build action globaly and for JIP
        [
            _vehicle,
            [localize "STR_KPLIB_ACTION_DEPLOY", {[param [0], param [1], param[3]] call KPLIB_fnc_core_buildFob}, true, -800, false, true, "", "[_target, _this] call KPLIB_fnc_core_canBuildFob", 10]
        ] remoteExecCall ["addAction", 0, true];
    };

    case KPLIB_preset_respawnTruck;
    case KPLIB_preset_potato: {
        // Set vehicle as mobile respawn
        _vehicle setVariable ["KPLIB_respawn", true, true];
        // Add redeploy action globaly and for JIP
        [
            _vehicle,
            [localize "STR_KPLIB_ACTION_REDEPLOY", {["KPLIB_respawn_requested", _this] call CBA_fnc_localEvent}, nil, -801, false, true, "", "_this == vehicle _this", 10]
        ] remoteExecCall ["addAction", 0, true];
    };
};

true
