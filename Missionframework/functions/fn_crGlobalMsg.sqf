/*
    File: fn_crGlobalMsg.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _msgType    - Type of message to display                    [NUMBER, defaults to -1]
        _data       - Data which is needed in the selected msgType  [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_msgType", -1, [0]],
    ["_data", [], []]
];

if (KP_liberation_civrep_debug > 0) then {[format ["globalMsg called on: %1 - Parameters: [%2, %3]", debug_source, _msgType, _data], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

switch (_msgType) do {
    case 0: {systemChat localize "STR_CR_VEHICLEMSG";};
    case 1: {systemChat (format [localize "STR_CR_BUILDINGMSG", (_data select 0)]);};
    case 2: {systemChat (format [localize "STR_CR_KILLMSG", (_data select 0), (_data select 1)]);};
    case 3: {systemChat (format [localize "STR_CR_RESISTANCE_KILLMSG", (_data select 0), (_data select 1)]);};
    case 4: {systemChat (format [localize "STR_CR_HEALMSG", (_data select 0)]);};
    case 5: {["lib_asymm_guerilla_incoming", _data] call BIS_fnc_showNotification;};
    case 6: {systemChat (format [localize "STR_CR_DEATHMSG", (_data select 0), (_data select 1), (_data select 2)]);};
    case 7: {systemChat (format [localize "STR_CR_VEHKILLMSG", (_data select 0), (_data select 1), (_data select 2), (_data select 3)]);};
    case 8: {systemChat (format [localize "STR_CR_VEHCIVKILLMSG", (_data select 0), (_data select 1)]);};
    case 9: {systemChat (format [localize "STR_CR_SUICIDEMSG", (_data select 0)]);};
    case 10: {systemChat (format [localize "STR_CR_INCAPACITATEDMSG", (_data select 0)]);};
    case 11: {systemChat (format [localize "STR_CR_BLEEDOUTMSG", (_data select 0)]);};
    case 12: {systemChat (format [localize "STR_CR_RANGEDKILLMSG", (_data select 0), (_data select 1), (_data select 2)]);};
    case 13: {systemChat (format [localize "STR_CR_REVIVEDMSG", (_data select 0)]);};
    default {[format ["globalMsg without valid msgType - %1", _msgType], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};
};

true
