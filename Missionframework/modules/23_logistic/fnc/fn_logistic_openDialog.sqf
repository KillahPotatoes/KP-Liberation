#include "..\..\..\KPGUI\KPGUI_defines.hpp"
/*
    KPLIB_fnc_logistic_openDialog

    File: fn_logistic_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-01-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the logistic main dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_logisticMain";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 7580231;

true
