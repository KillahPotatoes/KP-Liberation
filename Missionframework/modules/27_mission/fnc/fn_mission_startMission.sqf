#include "script_component.hpp"
/*
    KPLIB_fnc_mission_startMission

    File: fn_mission_startMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-13
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Starts the given mission or selects one from the given array.

    Parameter(s):
        _mission - Array or string with the missions [STRING/ARRAY, defaults to ""]

    Returns:
        Mission started [BOOL]
*/

params [
    ["_mission", "", ["", []]]
];

// Check for array and select random mission from it
if (_mission isEqualType []) then {
    _mission = selectRandom _mission;
};

// Get data from namespace
private _missionData = MGVAR(_mission, []);
private _runningMissions = MGVAR("runningMissions", []);

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
private _conditionCheckFnc = _missionData select 8;

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

// Exit if one of the condition isn't true
if !(_resourceCheck && {_timeCheck && {[] call _conditionCheckFnc}}) exitWith {
    false
};

// Pay the resources if the mission costs anything
if !(_cost isEqualTo [0, 0, 0, 0]) then {
    [_nearFOB, _costSupply, _costAmmo, _costFuel] call KPLIB_fnc_resources_pay;
    [-_costIntel] call KPLIB_fnc_resources_addIntel;
};

// Execute the startup function via server event
["KPLIB_missionExec", [_missionData select 1]] call CBA_fnc_serverEvent;

// Prepare the namespace data
_runningMissions pushback [_mission, _nearFOB];
private _startTime = diag_tickTime + (_missionData select 10) + (round (random (_missionData select 11)));
_timeData pushBack [_mission, _startTime];

// Set data in namespace
MSVAR("runningMissions", _runningMissions);
MSVAR("timeCheck", _timeData);

closeDialog 0;
[{!dialog}, {[] call KPLIB_fnc_mission_openDialog;}] call CBA_fnc_waitUntilAndExecute;

true
