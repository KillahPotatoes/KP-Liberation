#include "..\..\..\KPGUI\KPGUI_defines.hpp"
#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_permission_openDialog

    File: fn_permission_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-14
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the permission dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if !(KPLIB_param_permission) then {
    [localize "STR_KPLIB_HINT_PERMISSIONDEACTIVATED"] call CBA_fnc_notify;
};

// Create dialog
createDialog "KPLIB_permission";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_PERMISSION_DIALOG;
private _ctrlPlayerList = _dialog displayCtrl KPLIB_IDC_PERMISSION_PLAYERLIST;
private _ctrlPermissionsGroup = _dialog displayCtrl KPLIB_IDC_PERMISSION_PERMISSIONS;

// Fill the controls
private _index = _ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_DEFAULT");
_ctrlPlayerList lbSetData [_index, "default"];

_index = _ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_ONLINE");
_ctrlPlayerList lbSetData [_index, "placeholder"];
_ctrlPlayerList lbSetColor [_index, KPLIB_COLOR_ORANGE];

// Variables
private _list = PGVAR("permissionList", []);
private _groups = PGVAR("permissionGroups", []);
private _playerList = [];

// Checksum to add only 1 entry for each player
{
    _playerList pushBack [_x select 1, _x select 0];
} forEach _list;

_playerList sort true;

// Add all online players and delete them from checksum
private _player = "";
{
    _index = _ctrlPlayerList lbAdd (name _x);
    _ctrlPlayerList lbSetData [_index, getPlayerUID _x];
    _player = _x;
    _playerList deleteAt (_playerList findIf {
        ((_x select 1) isEqualTo (getPlayerUID _player))
    });
} forEach (allPlayers - (entities "HeadlessClient_F"));

_index = _ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_OFFLINE");
_ctrlPlayerList lbSetData [_index, "placeholder"];
_ctrlPlayerList lbSetColor [_index, KPLIB_COLOR_ORANGE];

// Add all offline players and delete them from checksum
{
    _index = _ctrlPlayerList lbAdd (_x select 0);
    _ctrlPlayerList lbSetData [_index, _x select 1];
} forEach _playerList;

// prepare the dynamic controls
private _tempCtrl = controlNull;
private _data = [];
private _i = 0;
KPLIB_permission_tempControls = [];

{
    _tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_ActiveText", 68742 + _i, _ctrlPermissionsGroup];
    _tempCtrl ctrlSetPosition [
        0,
        KP_GETH(KP_HEIGHT_VAL_C,24) * _i,
        KP_GETW(KP_WIDTH_VAL_C,2),
        KP_GETH(KP_HEIGHT_VAL_C,24)
    ];
    _tempCtrl ctrlSetText (_x select 1);
    _tempCtrl ctrlSetTextColor KPLIB_COLOR_ORANGE;
    _tempCtrl ctrlSetActiveColor KPLIB_COLOR_ORANGE;
    _tempCtrl ctrlCommit 0;
    _tempCtrl ctrlEnable true;
    _i = _i + 1;

    {
        _data = PGVAR(toLower _x, []);
        _tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_ActiveText", 68742 + _i, _ctrlPermissionsGroup];
        _tempCtrl ctrlSetPosition [
            0,
            KP_GETH(KP_HEIGHT_VAL_C,24) * _i,
            KP_GETW(KP_WIDTH_VAL_C,2),
            KP_GETH(KP_HEIGHT_VAL_C,24)
        ];
        _tempCtrl ctrlSetText (_data select 1);
        _tempCtrl ctrlSetActiveColor KPLIB_COLOR_WHITE;
        _tempCtrl setVariable ["Data", [_x, false]];
        _tempCtrl ctrlSetEventHandler ["MouseButtonClick", '[_this] call KPLIB_fnc_permission_changePermission'];
        _tempCtrl ctrlCommit 0;
        _tempCtrl ctrlEnable false;
        KPLIB_permission_tempControls pushBack _tempCtrl;
        _i = _i + 1;
    } forEach (_x select 2);
    _i = _i + 1;
} forEach _groups;

true
