#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_openDialog

    File: fn_cratefiller_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-02
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
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlCat = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOEQUIPMENT;
private _ctrlWeapon = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOWEAPONS;
private _ctrlSearch = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_SEARCHBAR;
private _ctrlToolsGroup = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_GROUPTOOLS;
private _ctrlTools = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_BUTTONTOOLS;

// Hide controls
_ctrlWeapon ctrlShow false;
_ctrlSearch ctrlShow false;
_ctrlToolsGroup ctrlShow false;

// Disable the tools button on deactivation
if !(KPLIB_param_cratefillerTools) then {
    _ctrlTools ctrlShow false;
};

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
