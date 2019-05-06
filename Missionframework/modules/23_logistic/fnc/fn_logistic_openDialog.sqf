#include "..\..\..\KPGUI\KPGUI_defines.hpp"
#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_logistic_openDialog

    File: fn_logistic_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the logistic main dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Close all open Dialogs
closeDialog 0;

// Create dialog
createDialog "KPLIB_logisticMain";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_MAIN_DIALOG;

// Read the registered menus
private _menus = LGVAR("menus", []);

// Prepare the dynamic controls
private _tempCtrl = controlNull;

if !(_menus isEqualTo []) then {
    {
        _tempCtrl = _dialog ctrlCreate ["KPGUI_PRE_DialogButtonC", 68741 + _forEachIndex];
        _tempCtrl ctrlSetPosition [
            KP_GETX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1),
            safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + _forEachIndex * KP_HEIGTH_BUTTON + (_forEachIndex + 1) * KP_SPACING_Y),
            KP_GETWPLAIN(KP_WIDTH_VAL_C,1),
            safeZoneH * KP_HEIGTH_BUTTON
        ];
        _tempCtrl ctrlSetText (localize (_x select 2));
        _tempCtrl ctrlAddEventHandler ["ButtonClick", (_x select 1)];
        _tempCtrl ctrlCommit 0;
        _tempCtrl ctrlEnable true;
    } forEach _menus;
};

true
