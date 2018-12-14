/*
    KPLIB_fnc_permission_openDialog

    File: fn_permission_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-14
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the permission dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_permission";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 758011;
private _ctrlPlayerList = _dialog displayCtrl 68740;


// Fill the controls
_ctrlPlayerList lbAdd (localize "STR_KPLIB_DIALOG_PERMISSION_DEFAULT");
_ctrlPlayerList lbAdd "----------";

private _index = 0;
{
    _index = _ctrlPlayerList lbAdd (name _x);
    _ctrlPlayerList lbSetData [_index, name _x];
} forEach (allPlayers - (entities "HeadlessClient_F"));

private _tempCtrl = "";

_tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_ActiveText", -1];
_tempCtrl ctrlSetPosition [
    0,
    0,
    0,
    0
];
_tempCtrl ctrlSetText "LightVehicle";

true
