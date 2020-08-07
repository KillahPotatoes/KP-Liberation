/*
    File: fn_initCuratorHandlers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-08-07
    Last Update: 2020-08-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Initialize curator handlers.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

#define ZEUSVAR(var) (format ["KPLIB_zeus_%1", var])

if (isServer) then {

    // delete old Liberation mission placed Zeus module
    deleteVehicle zm1;

    // add curator assign EventHandler
    [true, "KPLIB_createZeus", {
        params [
            ["_player", objNull, [objNull]],
            ["_limited", false, [true]]
        ];

        if (isNull _player) exitWith {};

        // remove currently assigned curator
        private _oldZeus = getAssignedCuratorLogic _player;
        unassignCurator _oldZeus;
        deleteVehicle _oldZeus;

        private _uid = getPlayerUID _player;
        private _group = createGroup sideLogic;
        _group deleteGroupWhenEmpty true;
        private _zeus = _group createUnit ["ModuleCurator_F", [-7580, -7580, 0], [], 0, "NONE"];
        missionNamespace setVariable [ZEUSVAR(_uid), _zeus];

        if (_limited) then {
            _zeus setVariable ["owner", _uid, true];
            _zeus setVariable ["Addons", 0, true];
            _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];

            _zeus setCuratorCoef ["Place", -1e8];
            _zeus setCuratorCoef ["Edit", -1e8];
            _zeus setCuratorCoef ["Destroy", -1e8];
            _zeus setCuratorCoef ["Delete", 0];
        } else {
            _zeus setVariable ["owner", _uid, true];
            _zeus setVariable ["Addons", 3, true];
            _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];

            _zeus setCuratorCoef ["Place", 0];
            _zeus setCuratorCoef ["Delete", 0];
        };

        [true, "KPLIB_zeusAssigned", [_zeus]] remoteExecCall ["BIS_fnc_callScriptedEventHandler", _player];
    }] call BIS_fnc_addScriptedEventHandler;

    // remove the assigned curator on player disconnect
    addMissionEventHandler ["HandleDisconnect", {
        params ["", "", "_uid"];
        private _zeus = missionNamespace getVariable ZEUSVAR(_uid);
        if (!isNil "_zeus") then {
            deleteVehicle _zeus;
            missionNamespace setVariable [ZEUSVAR(_uid), nil];
        };
    }];
};

if (hasInterface) then {
    [true, "KPLIB_zeusAssigned", {
        params [
            ["_zeus", objNull, [objNull]]
        ];

        [_zeus] call BIS_fnc_drawCuratorLocations;
    }] call BIS_fnc_addScriptedEventHandler;
};

true
