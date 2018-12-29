#include "..\..\..\KPGUI\KPGUI_defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_permission_openDialog

    File: fn_permission_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-14
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the permission dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if !(KPLIB_param_permission) then {
    hint localize "STR_KPLIB_HINT_PERMISSIONDEACTIVATED";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

// Create dialog
createDialog "KPLIB_permission";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 758011;
private _ctrlPlayerList = _dialog displayCtrl 68740;

// Fill the controls
private _index = _ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_DEFAULT");
_ctrlPlayerList lbSetData [_index, "default"];

_index = _ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_ONLINE");
_ctrlPlayerList lbSetData [_index, "placeholder"];
_ctrlPlayerList lbSetColor [_index, KPLIB_COLOR_ORANGE];

// Checksum to add only 1 entry for each player
private _playerList = [];
{
    _playerList pushBack [_x select 1, _x select 0];
} forEach KPLIB_permission_list;

_playerList sort true;

// Add all online players and delete them from checksum
private _player = "";
{
    _index = _ctrlPlayerList lbAdd (name _x);
    _ctrlPlayerList lbSetData [_index, getPlayerUID _x];
    _player = _x;
    _playerList deleteAt (_playerList findIf {((_x select 1) isEqualTo (getPlayerUID _player))});
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
    _tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_ActiveText", 68741 + _i];
    _tempCtrl ctrlSetPosition [
        KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2),
        KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,_i * 2,48),
        KP_GETW(KP_WIDTH_VAL_C,2),
        KP_GETH(KP_HEIGHT_VAL_C,24)
    ];
    _tempCtrl ctrlSetText (localize (_x select 1));
    _tempCtrl ctrlSetTextColor KPLIB_COLOR_ORANGE;
    _tempCtrl ctrlSetActiveColor KPLIB_COLOR_ORANGE;
    _tempCtrl ctrlCommit 0;
    _tempCtrl ctrlEnable true;
    _i = _i + 1;

    {
        _data = KPLIB_permission_data getVariable [toLower _x, []];
        _tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_ActiveText", 68741 + _i];
        _tempCtrl ctrlSetPosition [
            KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2),
            KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,_i * 2,48),
            KP_GETW(KP_WIDTH_VAL_C,2),
            KP_GETH(KP_HEIGHT_VAL_C,24)
        ];
        _tempCtrl ctrlSetText (localize (_data select 1));
        _tempCtrl ctrlSetActiveColor KPLIB_COLOR_WHITE;
        _tempCtrl setVariable ["Data", [_x, false]];
        _tempCtrl ctrlSetEventHandler ["MouseButtonClick", '[_this] call KPLIB_fnc_permission_changePermission'];
        _tempCtrl ctrlCommit 0;
        _tempCtrl ctrlEnable false;
        KPLIB_permission_tempControls pushBack _tempCtrl;
        _i = _i + 1;
    } forEach (_x select 2);
} forEach KPLIB_permission_groups;

true
