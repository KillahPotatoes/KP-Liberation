#include "script_component.hpp"
/*
    KPLIB_fnc_mission_startMission

    File: fn_mission_startMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-13
    Last Update: 2019-06-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

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

private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _resourceCheck = true

// Check for array and select random mission from it
if (_mission isEqualType []) then {
    _mission = selectRandom _mission;
};

// Get data from namespace
private _missionData = MGVAR(toLower _mission, []);
private _cost = _missionData select 6;
_cost params [
    "_costSupply",
    "_costAmmo",
    "_costFuel",
    "_costIntel"
];

// Check the mission condition
private _conditionCheck = [] call (_missionData select 5);

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
if !(_conditionCheck && _resourceCheck) exitWith {
    false
};

// Pay the resources if the mission costs anything
if !(_cost isEqualTo [0, 0, 0, 0]) then {
    [_nearFOB, _costSupply, _costAmmo, _costFuel] call KPLIB_fnc_resources_pay;
    [-_costIntel] call KPLIB_fnc_resources_addIntel;
};

// Execute the startup function
call compile preprocessFileLineNumbers (_missionData select 1);

// Set data in namespace
private _data = MGVAR("runningMissions", []);
_data pushback [_mission, _nearFOB];
MSVAR("runningMissions", _data);

true
