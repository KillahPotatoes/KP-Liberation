/*
    KPLIB_fnc_core_handleVehicleSpawn

    File: fn_core_handleVehicleSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-10
    Last Update: 2018-12-11
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

switch (typeOf _vehicle) do {
    case KPLIB_preset_fobBoxF;
    case KPLIB_preset_fobTruckF: {
        // Add FOB build action globaly and for JIP
        [
            _vehicle,
            "STR_KPLIB_ACTION_DEPLOY",
            [{["KPLIB_fob_build_requested", _this select 0] call CBA_fnc_localEvent}, true, -800, false, true, "", "[_target, _this] call KPLIB_fnc_core_canBuildFob", 10]
        ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
    };

    case KPLIB_preset_respawnTruckF;
    case KPLIB_preset_potatoF: {
        // Set vehicle as mobile respawn
        _vehicle setVariable ["KPLIB_respawn", true, true];
        // Add redeploy action globaly and for JIP
        [
            _vehicle,
            "STR_KPLIB_ACTION_REDEPLOY",
            [{["KPLIB_respawn_requested", _this] call CBA_fnc_localEvent}, nil, -801, false, true, "", "_this == vehicle _this", 10]
        ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
    };

    case KPLIB_preset_addHeliF: {
        if ((_vehicle distance KPLIB_eden_startbase) < 20) then {
            // Add moving action for start helicopters
            [
                _vehicle,
                "STR_KPLIB_ACTION_HELIMOVE",
                [{[_this select 0] call KPLIB_fnc_core_heliToDeck;}, nil, 10, true, true, "", "(_target distance KPLIB_eden_startbase) < 20", 4],
                "#FF8000"
            ] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];
        };
    };
};

true
