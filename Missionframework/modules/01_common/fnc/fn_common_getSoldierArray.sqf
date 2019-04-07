/*
    KPLIB_fnc_common_getSoldierArray

    File: fn_common_getSoldierArray.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-31
    Last Update: 2019-03-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Gets an array of soldier classnames for given side

    Parameter(s):
        _side - Description [SIDE, defaults to KPLIB_preset_sideE]

    Returns:
        Array of classname strings [ARRAY]
*/

params [
    ["_side", KPLIB_preset_sideE, [sideEmpty]]
];

// Get classname array of given side and remove unwanted soldier types
(["units", _side, true] call KPLIB_fnc_common_getPresetClass) - [
    ["rsCrewmanHeli", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsCrewmanVeh", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsPilotHeli", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsPilotJet", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsParatrooper", _side] call KPLIB_fnc_common_getPresetClass,
    ["rsSurvivor", _side] call KPLIB_fnc_common_getPresetClass
]
