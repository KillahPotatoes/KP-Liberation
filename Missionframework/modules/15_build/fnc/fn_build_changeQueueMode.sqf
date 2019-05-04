#include "script_components.hpp"
#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_changeQueueMode

    File: fn_build_changeQueueMode.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-29
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Changes build system queue mode.

    Parameter(s):
        _control - Clicked control [CONTROL, defaults to controlNull]

    Returns:
        Queue mode was changed [BOOL]
*/
params [
    ["_control", controlNull, [controlNull]]
];

private _display = ctrlParent _control;
private _confirmBtnControl = _display displayCtrl KPLIB_IDC_BUILD_CONFIRM;
private _buildList = _display displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;

// !TODO! preserve and restore current build queue
switch (LGVAR_D(buildMode, 0)) do {
    case 0: {
        _control ctrlSetText localize "STR_KPLIB_DIALOG_BUILD_MODE_MOVE";
        LSVAR("buildMode", 1);
        LSVAR("buildItem", []);
        _confirmBtnControl ctrlEnable false;
        _buildList ctrlEnable false;

        private _currentItems = LGVAR(buildQueue);

        private _playerFob = player getVariable "KPLIB_fob";
        private _movableItems = (KPLIB_persistence_objects select {(_x getVariable "KPLIB_fob") isEqualTo _playerFob}) select {!isNull _x};
        LSVAR("buildQueue_buy", _currentItems);
        LSVAR("buildQueue", _movableItems);
    };

    case 1: {
        _control ctrlSetText localize "STR_KPLIB_DIALOG_BUILD_MODE_BUILD";
        LSVAR("buildMode", 0);
        _confirmBtnControl ctrlEnable true;
        _buildList ctrlEnable true;

        private _buyableItems = LGVAR(buildQueue_buy);
        LSVAR("buildQueue_buy", nil);

        LSVAR("buildQueue", _buyableItems);
    };
};

true
