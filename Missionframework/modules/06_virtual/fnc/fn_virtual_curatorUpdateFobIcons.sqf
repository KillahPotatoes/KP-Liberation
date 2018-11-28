/*
    KPLIB_fnc_virtual_curatorUpdateFobIcons

    File: fn_virtual_curatorUpdateFobIcons.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2018-11-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds FOBs icons to curator..

    Parameter(s):
        _curator    - Curator logic [OBJECT, defaults to objNull]

    Returns:
        IDs of icons added to curator [ARRAY]
*/
params [
    ["_curator", objNull, [objNull]]
];

if (isNull _curator) exitWith {};

// Update fob icons from curator, if any
_curator call KPLIB_fnc_virtual_curatorRemoveFobIcons;

// Add fob icons to curator
private _fobIcons = KPLIB_sectors_fobs apply {
    // Return icon index
    // (same texture, size and color as BIS curator locations)
    [_curator, ["#(argb,8,8,3)color(0,0,0,0)", [1,1,1,1], getMarkerPos _x, 0, 0, 0, markerText _x, 2, 0.05], false, true] call BIS_fnc_addCuratorIcon
};

_curator setVariable ["KPLIB_fobIcons", _fobIcons];

_fobIcons
