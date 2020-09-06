/*
    File: fn_initCuratorHandlers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-08-07
    Last Update: 2020-08-30
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
        private _uid = getPlayerUID _player;

        // check if there's already a managed zeus module for this player, if so we can just reassign
        private _oldManagedZeus = missionNamespace getVariable [ZEUSVAR(_uid), objNull];
        if (!isNull _oldManagedZeus && {_limited isEqualTo (_oldManagedZeus getVariable ["KPLIB_limited", -1])}) exitWith {
            _player assignCurator _oldManagedZeus;
            [true, "KPLIB_zeusAssigned", [_oldManagedZeus]] remoteExecCall ["BIS_fnc_callScriptedEventHandler", _player];
        };

        // remove currently assigned curator
        private _oldZeus = getAssignedCuratorLogic _player;
        unassignCurator _oldZeus;
        deleteVehicle _oldZeus;

        private _group = createGroup [sideLogic, true];
        private _zeus = _group createUnit ["ModuleCurator_F", [-7580, -7580, 0], [], 0, "NONE"];
        missionNamespace setVariable [ZEUSVAR(_uid), _zeus];

        if (_limited) then {
            _zeus setVariable ["Addons", 0, true];
            _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];

            _zeus setCuratorCoef ["Place", -1e8];
            _zeus setCuratorCoef ["Edit", -1e8];
            _zeus setCuratorCoef ["Destroy", -1e8];
            _zeus setCuratorCoef ["Delete", 0];
        } else {
            _zeus setVariable ["Addons", 3, true];
            _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];

            _zeus setCuratorCoef ["Place", 0];
            _zeus setCuratorCoef ["Delete", 0];

            removeAllCuratorAddons _zeus;
        };

        _zeus setVariable ["KPLIB_limited", _limited];

        _player assignCurator _zeus;

        [true, "KPLIB_zeusAssigned", [_zeus, _limited]] remoteExecCall ["BIS_fnc_callScriptedEventHandler", _player];
    }] call BIS_fnc_addScriptedEventHandler;

    [true, "KPLIB_activateZeusAddons", {
        params [
            ["_zeus", objNull, [objNull]],
            ["_addons", [], [[]]]
        ];

        _zeus addCuratorAddons _addons;
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
            ["_zeus", objNull, [objNull]],
            ["_limited", false, [true]]
        ];

        if !(_zeus getVariable ["KPLIB_drawCuratorLocations", false]) then {
            _zeus setVariable ["KPLIB_drawCuratorLocations", true];
            [_zeus] call BIS_fnc_drawCuratorLocations;
        };

        if (!_limited) then {
            private _allAddons = ("true" configClasses (configFile >> "CfgPatches")) apply {configName _x};
            [true, "KPLIB_activateZeusAddons", [_zeus, _allAddons]] remoteExecCall ["BIS_fnc_callScriptedEventHandler", 2];
        };
    }] call BIS_fnc_addScriptedEventHandler;
};

true
