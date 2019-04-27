/*
    KPLIB_fnc_cratefiller_openDialog

    File: fn_cratefiller_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the cratefiller dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_cratefiller";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlCat = _dialog displayCtrl 68741;
private _ctrlWeapon = _dialog displayCtrl 68742;
private _ctrlSearch = _dialog displayCtrl 68743;
private _ctrlClearSearch = _dialog displayCtrl 68744;
private _toolsGroup = _dialog displayCtrl 687410;

// Hide controls
_ctrlWeapon ctrlShow false;
_ctrlSearch ctrlShow false;
_ctrlClearSearch ctrlShow false;
_toolsGroup ctrlShow false;

// Reset variables
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTWEAPONS";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTMAGAZINES";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTATTACHMENTS";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTGRENADES";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTEXPLOSIVES";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTVARIOUS";
_ctrlCat lbAdd localize "STR_KPLIB_DIALOG_CRATEFILLER_LISTBACKPACKS";

[] call KPLIB_fnc_cratefiller_showPresets;
[] call KPLIB_fnc_cratefiller_getNearStorages;

true
