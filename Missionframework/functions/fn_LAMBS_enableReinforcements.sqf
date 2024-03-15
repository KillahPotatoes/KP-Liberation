/*
    File: fn_LAMBS_enableReinforcements.sqf
    Author: Jenna
    Date: 2023-10-21
    Last Update: 2023-10-21
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Enables LAMBS reinforcements + radio on a given group

    Parameter(s):
        _grp    - Group to enable features on  [Group, defaults to grpNull]

    Returns:
        Nothing
*/

params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitwith {
    ["Attempted to set LAMBS Reinforcements on null group.", "ERROR"] remoteExecCall ["KPLIB_fnc_log", 2];
};

(leader _grp) setVariable ["lambs_danger_dangerRadio", true, true];
_grp setVariable ["lambs_danger_enableGroupReinforce", true, true];
