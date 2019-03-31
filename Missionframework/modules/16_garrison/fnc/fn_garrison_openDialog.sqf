#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_garrison_openDialog

    File: fn_garrison_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-29
    Last Update: 2019-03-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the garrison dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_garrison";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_GARRISON_DIALOG;

private _ctrlLbSectors = _dialog displayCtrl KPLIB_IDC_GARRISON_GARRISONLIST;

private _ctrlNameTitle = _dialog displayCtrl KPLIB_IDC_GARRISON_SECTORNAME;
private _ctrlAlertNote = _dialog displayCtrl KPLIB_IDC_GARRISON_ALERTNOTE;

private _ctrlInfLabel = _dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYLABEL;
private _ctrlInfAmount = _dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYAMOUNT;
private _ctrlInfBox = _dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYBOX;
private _ctrlInfButton = _dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYBUTTON;

private _ctrlLightLabel = _dialog displayCtrl KPLIB_IDC_GARRISON_LIGHTLABEL;
private _ctrlLightAmount = _dialog displayCtrl KPLIB_IDC_GARRISON_LIGHTAMOUNT;
private _ctrlLightList = _dialog displayCtrl KPLIB_IDC_GARRISON_LIGHTLIST;
private _ctrlLightButton = _dialog displayCtrl KPLIB_IDC_GARRISON_LIGHTBUTTON;

private _ctrlHeavyLabel = _dialog displayCtrl KPLIB_IDC_GARRISON_HEAVYLABEL;
private _ctrlHeavyAmount = _dialog displayCtrl KPLIB_IDC_GARRISON_HEAVYAMOUNT;
private _ctrlHeavyList = _dialog displayCtrl KPLIB_IDC_GARRISON_HEAVYLIST;
private _ctrlHeavyButton = _dialog displayCtrl KPLIB_IDC_GARRISON_HEAVYBUTTON;

private _ctrlMap = _dialog displayCtrl KPLIB_IDC_GARRISON_MAP;

private _sectorDetailCtrls = [
    _ctrlAlertNote,
    _ctrlInfLabel,
    _ctrlInfAmount,
    _ctrlInfBox,
    _ctrlInfButton,
    _ctrlLightLabel,
    _ctrlLightAmount,
    _ctrlLightList,
    _ctrlLightButton,
    _ctrlHeavyLabel,
    _ctrlHeavyAmount,
    _ctrlHeavyList,
    _ctrlHeavyButton,
    _ctrlMap
];

// Hide sector details, as no sector is selected at this point
{_x ctrlShow false;} forEach _sectorDetailCtrls;

// Generate local sector list
private _sectors = [];
{
    _sectors pushBack [markerText _x, _x];
} forEach KPLIB_sectors_all;
_sectors sort true;

// Add sectors to listbox
lbClear _ctrlLbSectors;
{
    _ctrlLbSectors lbSetData [_ctrlLbSectors lbAdd (_x select 0), _x select 1];
    if !(([_x select 1, true] call KPLIB_fnc_garrison_getGarrison) isEqualTo []) then {
        _ctrlLbSectors lbSetColor [_forEachIndex, [0.8, 0, 0, 1]];
    }
} forEach _sectors;
_ctrlLbSectors lbSetCurSel -1;

true
