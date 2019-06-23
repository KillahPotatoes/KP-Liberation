#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_mission_preCheck

    File: fn_mission_preCheck.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-21
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Checks the mission conditions on a changing selection and disables the button.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_MISSION_DIALOG;
private _ctrlMission = _dialog displayCtrl KPLIB_IDC_MISSION_MISSIONLIST;
private _ctrlMissionButton = _dialog displayCtrl KPLIB_IDC_MISSION_MISSIONBUTTON;

// Disable the button
_ctrlMissionButton ctrlEnable false;

// Read the dialog controls
private _index = lnbCurSelRow _ctrlMission;
private _mission = [_ctrlMission, _index] call KPLIB_fnc_mission_readData;

// Get data from namespace
private _missionData = MGVAR(_mission, []);

// Variables
private _cost = _missionData select 9;
_cost params [
    "_costSupply",
    "_costAmmo",
    "_costFuel",
    "_costIntel"
];
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _resourceCheck = true;
private _timeCheck = true;

// Check the mission condition
private _conditionCheck = [] call (_missionData select 8);

// Check the timestamp of the mission
private _timeData = MGVAR("timeCheck", []);
private _index = _timeData findIf {(_x select 0) isEqualTo _mission};
if (_index != -1) then {
    private _missionTimeData = _timeData select _index;
    if (((_missionTimeData select 1) - diag_tickTime) <= 0) then {
        _timeData deleteAt _index;
    } else {
        _timeCheck = false;
    };
};

// Check if the mission is a buyable mission and check if there are enough resources available
if !(_missionData select 0) then {
    ([_nearFOB] call KPLIB_fnc_resources_getResTotal) params [
        "_resSupply",
        "_resAmmo",
        "_resFuel"
    ];
    if (
        (_resSupply < _costSupply) ||
        (_resAmmo < _costAmmo) ||
        (_resFuel < _costFuel) ||
        (KPLIB_resources_intel < _costIntel)
    ) then {
        _resourceCheck = false;
    };
};


// Disable the button if one of the condition isn't true
if !(_conditionCheck && _resourceCheck && _timeCheck) then {
    if !(_conditionCheck) then {
        [
            ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
            [localize "STR_KPLIB_HINT_MISSIONCONDITION"]
        ] call CBA_fnc_notify;
    };
    if !(_resourceCheck) then {
        [
            ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
            [localize "STR_KPLIB_HINT_MISSIONRESOURCES"]
        ] call CBA_fnc_notify;
    };
    if !(_timeCheck) then {
        [
            ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
            [localize "STR_KPLIB_HINT_MISSIONTIME"]
        ] call CBA_fnc_notify;
    };
} else {
    _ctrlMissionButton ctrlEnable true;
    [_mission] call KPLIB_fnc_mission_displayMission;
};

true
