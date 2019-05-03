#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_showOverview

    File: fn_cratefiller_showOverview.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-25
    Last Update: 2019-05-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Shows the cratefiller overview display.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlOverviewGroup = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_GROUPOVERVIEW;

_ctrlOverviewGroup ctrlShow ([true, false] select (ctrlShown _ctrlOverviewGroup));

[] call KPLIB_fnc_cratefiller_getGroups;

true
