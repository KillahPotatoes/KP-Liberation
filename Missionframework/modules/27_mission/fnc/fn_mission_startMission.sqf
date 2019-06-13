#include "script_component.hpp"
/*
    KPLIB_fnc_mission_startMission

    File: fn_mission_startMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-13
    Last Update: 2019-06-13
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

if (_mission isEqualType []) then {
    _mission = selectRandom _mission;
};

// Get data from namespace
private _data = MGVAR(toLower _mission, []);

// Check the mission condition
private _conditionCheck = [] call (_data select 5);

// Check if the mission is a buyable mission and check if there are enough resources available
if !(_data select 0) then {
    ([_nearFOB] call KPLIB_fnc_resources_getResTotal) params [
        "_resSupply",
        "_resAmmo",
        "_resFuel"
    ];
    (_data select 6) params [
        "_costSupply",
        "_costAmmo",
        "_costFuel",
        "_costIntel"
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

// Execute the startup function
call compile preprocessFileLineNumbers (_data select 1);

true
