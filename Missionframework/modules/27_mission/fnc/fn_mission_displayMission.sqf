#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_mission_displayMission

    File: fn_mission_displayMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-21
    Last Update: 2019-06-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Displays the information for the given mission.

    Parameter(s):
        _mission - Mission which should be displayed [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_mission", "", [""]]
];

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_MISSION_DIALOG;
private _ctrlTitle = _dialog displayCtrl KPLIB_IDC_MISSION_TITLE;
private _ctrlDescription = _dialog displayCtrl KPLIB_IDC_MISSION_DESCRIPTION;
private _ctrlReward = _dialog displayCtrl KPLIB_IDC_MISSION_REWARD;
private _ctrlPenalty = _dialog displayCtrl KPLIB_IDC_MISSION_PENALTY;
private _ctrlPicture = _dialog displayCtrl KPLIB_IDC_MISSION_PICTURE;

// Get data from namespace
private _missionData = MGVAR(_mission, []);

// Fill the controls
_ctrlTitle ctrlSetText (_missionData select 3);
_ctrlDescription ctrlSetText (_missionData select 4);
_ctrlReward ctrlSetText (_missionData select 5);
_ctrlPenalty ctrlSetText (_missionData select 6);
_ctrlPicture ctrlSetText (_missionData select 7);

true
