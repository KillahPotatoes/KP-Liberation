#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_mission_buttonClick

    File: fn_mission_buttonClick.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-22
    Last Update: 2019-06-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Selects which mission should be started/aborted and starts th next function.

    Parameter(s):
        _ctrl - The given which contains the data [CONTROL, defaults to controlNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_ctrl", controlNull, [controlNull]]
];

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_MISSION_DIALOG;
private _ctrlMission = _dialog displayCtrl KPLIB_IDC_MISSION_MISSIONLIST;
private _ctrlButtonMission = _dialog displayCtrl KPLIB_IDC_MISSION_MISSIONBUTTON;
private _ctrlRunning = _dialog displayCtrl KPLIB_IDC_MISSION_RUNNINGLIST;
private _ctrlButtonRunning = _dialog displayCtrl KPLIB_IDC_MISSION_RUNNINGBUTTON;

// select the right control dependant on the passed control
if (_ctrl isEqualTo _ctrlButtonMission) then {
    private _index = lnbCurSelRow _ctrlMission;
    private _mission = [_ctrlMission, _index] call KPLIB_fnc_mission_readData;
    [_mission] call KPLIB_fnc_mission_startMission;
};

if (_ctrl isEqualTo _ctrlButtonRunning) then {
    private _index = lnbCurSelRow _ctrlRunning;
    private _mission = [_ctrlRunning, _index] call KPLIB_fnc_mission_readData;
    [_mission] call KPLIB_fnc_mission_abortMission;
};

true
