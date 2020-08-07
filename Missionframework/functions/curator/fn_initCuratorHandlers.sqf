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
    // add curator assign EventHandler
    [true, "KPLIB_createZeus", {
        params ["_player"];

        private _uid = getPlayerUID _player;
        private _group = createGroup sideLogic;
        _group deleteGroupWhenEmpty true;
        private _zeus = _group createUnit ["ModuleCurator_F", [-7580, -7580, 0], [], 0, "NONE"];
        missionNamespace setVariable [ZEUSVAR(_uid), _zeus];

        _zeus setVariable ["owner", _uid, true];
        _zeus setVariable ["Addons", 3, true];
        _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];

        _zeus setCuratorCoef ["Place", 0];
        _zeus setCuratorCoef ["Delete", 0];
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

true
