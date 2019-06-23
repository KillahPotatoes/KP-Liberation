#include "script_component.hpp"
/*
    KPLIB_fnc_mission_registerMission

    File: fn_mission_registerMission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-13
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Registers a mission for the usage as event or "buyable" sidemission.


    Parameter(s):
        _missionName    - Name of the mission                                               [STRING, defaults to ""]
        _condition      - Condition which is needed to start the mission                    [CODE, defaults to {false}]
        _eventMission   - Defines if the mission is an event (true) or buyable (false)      [BOOL, defaults to false]
        _cost           - Defines the costs of the mission [S, A, F, I]                     [ARRAY, defaults to [0,0,0,0]]
        _minTime        - The time which needs to pass before the mission can start again   [NUMBER, defaults to 0]
        _randomTime     - The additional time which will randomly added to the minTime      [NUMBER, defaults to 0]
        _missionStart   - Path of the mission start function                                [STRING, defaults to ""]
        _missionAbort   - Path of the mission abort function                                [STRING, defaults to ""]
        _picture        - Path to the mission picture                                       [STRING, defaults to "KPGUI\res\kp512_CA.paa"]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_missionName", "", [""]],
    ["_condition", {false}, [{}]],
    ["_eventMission", false, [false]],
    ["_cost", [0,0,0,0], [[]], 4],
    ["_minTime", 0, [0]],
    ["_randomTime", 0, [0]],
    ["_missionStart", "", [""]],
    ["_missionAbort", "", [""]],
    ["_picture", "KPGUI\res\kp512_CA.paa", [""]]
];

// Exit when no mission name is declared
if (_missionName isEqualTo "") exitWith {
    false
};

private _string = localize (["STR_KPLIB_MISSION_", toUpper _missionName] joinString "");
if (_string isEqualTo "") then {
    _string = _missionName;
};
private _descString = localize (["STR_KPLIB_MISSION_", toUpper _missionName, "_DESCR"] joinString "");
if (_descString isEqualTo "") then {
    _descString = _missionName;
};
private _rewardString = localize (["STR_KPLIB_MISSION_", toUpper _missionName, "_REWARD"] joinString "");
if (_rewardString isEqualTo "") then {
    _rewardString = _missionName;
};
private _penaltyString = localize (["STR_KPLIB_MISSION_", toUpper _missionName, "_PENALTY"] joinString "");
if (_penaltyString isEqualTo "") then {
    _penaltyString = _missionName;
};

// Set data in namespace
private _data = [_eventMission, _missionStart, _missionAbort, _string, _descString, _rewardString, _penaltyString, _picture, _condition, _cost, _minTime, _randomTime];
MSVAR(_missionName, _data);

_data = MGVAR("registeredMissions", []);
_data pushBack _missionName;
MSVAR("registeredMissions", _data);

true
