#include "script_components.hpp"
#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_changeQueueMode

    File: fn_build_changeQueueMode.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-29
    Last Update: 2018-12-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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

// TODO preserve and restore current build queue
switch (LGVAR_D(buildMode, 0)) do {
    case 0: {
        _control ctrlSetText "Move mode";
        LSVAR("buildMode", 1);
        _confirmBtnControl ctrlEnable false;

        private _currentItems = (KPLIB_build_saveNamespace getVariable [player getVariable "KPLIB_fob", []]) select {!isNull _x};
        LSVAR("buildQueue", _currentItems);
    };

    case 1: {
        _control ctrlSetText "Build mode";
        LSVAR("buildMode", 0);
        _confirmBtnControl ctrlEnable true;

        LSVAR("buildQueue", []);
    };
};

true
