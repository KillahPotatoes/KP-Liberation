/*
    F_createManagedUnit

    File: F_kp_createManagedUnit.sqf
    Author: veteran29 - https://github.com/veteran29
    Date: 2019-10-04
    Last Update: 2019-10-04

    Description:
        Creates unit managed by kill tracker.

    Parameter(s):
        0: STRING               - Type of unit. (Default "")
        1: ARRAY|OBJECT|GROUP   - Where to spawn. (Default [0,0,0])
        2: GROUP                - Group to add the unit to. (Default objNull)
        3: STRING               - Unit rank. (Default "PRIVATE")
        4: NUMBER               - Placement radius. (Default 0)

    Example:


    Returns:
        OBJECT - Created unit
*/
params [
    ["_type", "", [""]]
    ["_spawnPos", [0,0,0], [[], objNull, grpNull], [2,3]],
    ["_group", grpNull, [grpNull]],
    ["_rank", "PRIVATE", [""]],
    ["_placement", 0, [0]]
];

private _unit = _group createUnit [_type, _spawnPos, [], "FORM"];
_unit addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
_unit setRank _rank;

_x createUnit [_start_pos, _troupgrp,"this ", _placement, "private"];

// Process KP object init
[_unit] call F_addObjectInit;

_unit // return
