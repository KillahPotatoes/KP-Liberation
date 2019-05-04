#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_garrison_dialogSelectUnit

    File: fn_garrison_dialogSelectUnit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-28
    Last Update: 2019-04-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Handles selection of a unit in the garrison unit list.

    Parameter(s):
        _lbIndex    - Selected index in the list control    [NUMBER, defaults to -1]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_lbIndex", -1, [0]]
];

// Exit if no parameters passed
if (_lbIndex isEqualTo -1) exitWith {false};

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_GARRISON_DIALOG;
private _ctrlUnitButton = _dialog displayCtrl KPLIB_IDC_GARRISON_UNITBUTTON;

// Get selected unit
KPLIB_garrison_dialogSelUnit = (KPLIB_garrison_dialogSelGroup select 1) select _lbIndex;

// Enable unit button
_ctrlUnitButton ctrlEnable true;

true
