/*
    KPLIB_fnc_init_receiveInit

    File: fn_init_receiveInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-25
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Receive data from the server initialization and split the packages accordingly.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

["Preset data initializing...", "CLIENT] [INIT", true] call KPLIB_fnc_common_log;

// Wait until the server has send the preset data
waitUntil {!isNil "KPLIB_preset_allData"};

{
    {
        missionNamespace setVariable [_x select 0, _x select 1];
    } forEach _x;
} forEach KPLIB_preset_allData;

["Preset data initialized", "CLIENT] [INIT", true] call KPLIB_fnc_common_log;

true
