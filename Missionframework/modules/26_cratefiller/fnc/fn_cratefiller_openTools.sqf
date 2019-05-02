#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_openTools

    File: fn_cratefiller_openTools.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-25
    Last Update: 2019-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the cratefiller tools display.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlToolsGroup = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_GROUPTOOLS;

_ctrlToolsGroup ctrlShow ([true, false] select (ctrlShown _ctrlToolsGroup));

[] call KPLIB_fnc_cratefiller_getGroups;

true
