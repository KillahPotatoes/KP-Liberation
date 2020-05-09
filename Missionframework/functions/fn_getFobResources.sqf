/*
    File: fn_getFobResources.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-08
    Last Update: 2020-05-09
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the FOB resource data in format [<POSITION>, <SUPPLIES>, <AMMO>, <FUEL>, <HAS_AIR_BUILD>, <HAS_REC_WORKSHOP>].

    Parameter(s):
        _fob - Position of FOB to get resources of [POSITION, defaults to [0, 0, 0]]

    Returns:
        FOB resource data [ARRAY]
*/

#define NO_RESULT [[0, 0, 0], 0, 0, 0, false, false]

params [
    ["_fob", [0, 0, 0], [[]], [2, 3]]
];

KP_liberation_fob_resources param [KP_liberation_fob_resources findIf {(_x select 0) isEqualTo _fob}, NO_RESULT] // return
