#include "script_component.hpp"
/*
    KPLIB_fnc_mission_endMission

    File: fn_mission_endMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-23
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Deletes the mission from the running missions.

    Parameter(s):
        _mission - String of the mission [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_mission", "", [""]]
];

// Get data from namespace
private _runningMissions = MGVAR("runningMissions", []);

// Delete the mission from the running mission data
_runningMissions deleteAt (_runningMissions findIf {(_x select 0) isEqualTo _mission});

// Set data in namespace
MSVAR("runningMissions", _runningMissions);

true
