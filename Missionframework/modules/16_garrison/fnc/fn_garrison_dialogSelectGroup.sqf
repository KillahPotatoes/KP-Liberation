#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_garrison_dialogSelectGroup

    File: fn_garrison_dialogSelectGroup.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-27
    Last Update: 2019-04-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches and displays information of a group selected in the garrison group list.

    Parameter(s):
        _lbIndex    - Selected index in the list control    [NUMBER, defaults to -1]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_lbIndex", -1, [0]]
];

// Exit if no parameters passed
if (_lbIndex isEqualTo -1) exitWith {false};

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_GARRISON_DIALOG;
private _ctrlMap = _dialog displayCtrl KPLIB_IDC_GARRISON_MAP;
private _ctrlGroupButton = _dialog displayCtrl KPLIB_IDC_GARRISON_GROUPBUTTON;
private _ctrlLbUnits = _dialog displayCtrl KPLIB_IDC_GARRISON_UNITLIST;
private _ctrlUnitButton = _dialog displayCtrl KPLIB_IDC_GARRISON_UNITBUTTON;

// Get selected group details
KPLIB_garrison_dialogSelGroup = [(KPLIB_garrison_dialogGroups select _lbIndex) select 1, []];
{
    (KPLIB_garrison_dialogSelGroup select 1) pushBackUnique ([objectParent _x, _x] select (isNull objectParent _x));
} forEach (units (KPLIB_garrison_dialogSelGroup select 0));

// Create a marker for the selected group
deleteMarkerLocal "grpMarker";
private _grpMarker = createMarkerLocal ["grpMarker", getPos (leader (KPLIB_garrison_dialogSelGroup select 0))];
_grpMarker setMarkerTextLocal (groupId (KPLIB_garrison_dialogSelGroup select 0));
_grpMarker setMarkerShapeLocal "ICON";
_grpMarker setMarkerTypeLocal "mil_dot";
_grpMarker setMarkerColorLocal KPLIB_preset_colorF;

// Center map on selected group
_ctrlMap ctrlMapAnimAdd [0, 0.025, getMarkerPos "grpMarker"];
ctrlMapAnimCommit _ctrlMap;

// Enable group button and fill group units list
_ctrlGroupButton ctrlEnable true;
lbClear _ctrlLbUnits;
{
    _ctrlLbUnits lbAdd (getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"));
} forEach (KPLIB_garrison_dialogSelGroup select 1);
_ctrlLbUnits lbSetCurSel -1;

true
