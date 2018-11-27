/*
    KPLIB_fnc_virtual_curatorUpdateFobIcons

    File: fn_virtual_curatorUpdateFobIcons.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds FOBs icons to curator..

    Parameter(s):
        _curator    - Curator logic [OBJECT, defaults to objNull]

    Returns:
        FOBs icons were added to curator [BOOL]
*/
params [
    ["_curator", objNull, [objNull]]
];

if (isNull _curator) exitWith {};

// Add fob icons to curator
{
    private _fobName = format ["FOB - %1", _x call KPLIB_fnc_common_getFobAlphabetName];

    private _iconIndex = [_curator, ["", [1,0,0,1], getMarkerPos _x, 0, 0, 0, _fobName]] call BIS_fnc_addCuratorIcon;
    KPLIB_virtual_fobIcons pushBack _iconIndex;

} forEach KPLIB_sectors_fobs;

true
