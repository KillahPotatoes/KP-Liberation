#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_arsenal_copyLoadout

    File: fn_arsenal_copyLoadout.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-19
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Copies the loadout from selected player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_ARSENAL_DIALOG;
private _ctrlNearPlayer = _dialog displayCtrl KPLIB_IDC_ARSENAL_COMBONEAR;

private _index = lbCurSel _ctrlNearPlayer;
player setUnitLoadout (getUnitLoadout (missionNamespace getVariable (_ctrlNearPlayer lbData _index)));

[] call KPLIB_fnc_arsenal_checkGear;

true
