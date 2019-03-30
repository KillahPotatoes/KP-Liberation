/*
    KPLIB_fnc_garrison_openDialog

    File: fn_garrison_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-29
    Last Update: 2019-03-30
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
private _dialog = findDisplay 75804;
private _ctrlLbSectors = _dialog displayCtrl 758041;
private _ctrlMap = _dialog displayCtrl 758043;

// Hide map, as no sector is selected at this point
_ctrlMap ctrlShow false;

// Generate local sector list
private _sectors = [];
{
    _sectors pushBack [markerText _x, _x];
} forEach KPLIB_sectors_blufor;
_sectors sort true;

// Add sectors to listbox
lbClear _ctrlLbSectors;
{
    _ctrlLbSectors lbSetData [_ctrlLbSectors lbAdd (_x select 0), _x select 1];
} forEach _sectors;
_ctrlLbSectors lbSetCurSel -1;

true
