#include "script_components.hpp"
#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_start_single

    File: fn_build_start_single.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Starts KP Liberation building mode

    Parameter(s):
        _center - Center of building area [POSITION, defaults to position player]
        _radius - Allowed building radius [NUMBER, defaults to KPLIB_param_fobRange]

    Returns:
        Building logic object [LOCATION]
*/

params [
    ["_center", position player, [[]], 3],
    ["_radius", (35 max KPLIB_param_fobRange/2), [0]],
    ["_buildItem", [], [[]], 4],
    ["_onConfirm", {}, [{}]]
];

if !(_buildItem isEqualTypeParams ["", 0, 0, 0]) exitWith {
    diag_log format ["[KP LIBERATION] [%1] [BUILD] Incorrect build item passed to build_start_single '%2'!", diag_tickTime, _buildItem]
};


private _openEhId = ["KPLIB_build_display_open", {
    params ["_display"];

    private _confirmCtrl = (_display displayCtrl KPLIB_IDC_BUILD_CONFIRM);

    // Get pos of build mode selector
    private _confirmCtrlNewPos = (ctrlPosition ctrlParentControlsGroup (_display displayCtrl KPLIB_IDC_BUILD_TOOLBOX_MOVEITEMS));
    // Save only X, Y
    _confirmCtrlNewPos resize 2;
    // Get original W, H
    _confirmCtrlNewPos append ((ctrlPosition _confirmCtrl) select [2, 2]);
    // Set the position with original W, H
    _confirmCtrl ctrlSetPosition _confirmCtrlNewPos;
    _confirmCtrl ctrlCommit 0;

    // Hide tabs, build list and background
    {
        (_display displayCtrl _x) ctrlShow false;
    } forEach KPLIB_BUILD_TABS_IDCS_ARRAY + [KPLIB_IDC_BUILD_ITEM_LIST, KPLIB_IDC_BUILD_DIALOG_AREA, KPLIB_IDC_BUILD_TOOLBOX_MOVEITEMS];

    LSVAR("buildItem", _thisArgs);

}, _buildItem] call CBA_fnc_addEventHandlerArgs;


// Handle item placement
private _builtEhId = ["KPLIB_build_item_built_local", {
    _this call _thisArgs;
    [] call KPLIB_fnc_build_stop;
}, _onConfirm] call CBA_fnc_addEventHandlerArgs;


// Stop all single build event handlers
["KPLIB_build_stop", {
    [_thisType, _thisId] call CBA_fnc_removeEventHandler;

    _thisArgs params ["_openEhId", "_builtEhId"];

    ["KPLIB_build_display_open", _openEhId] call CBA_fnc_removeEventHandler;
    ["KPLIB_build_item_built_local", _builtEhId] call CBA_fnc_removeEventHandler;

}, [_openEhId, _builtEhId]] call CBA_fnc_addEventHandlerArgs;


// Start build mode
[_center, _radius] call KPLIB_fnc_build_start
