/*
    KPLIB_fnc_garrisonSelectSector

    File: fn_garrison_dialogSelectSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-30
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fetches and displays information of a sector selected in the garrison management dialog.

    Parameter(s):
        _ctrlLbSectors  - Sector list control                   [CONTROL, defaults to controlNull]
        _lbIndex        - Selected index in the list control    [NUMBER, defaults to -1]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_ctrlLbSectors", controlNull, [controlNull]],
    ["_lbIndex", -1, [0]]
];

// Exit if no parameters passed
if (isNull _ctrlLbSectors || _lbIndex isEqualTo -1) exitWith {};

// Initialize needed local variables
private _dialog = ctrlParent _ctrlLbSectors;
private _ctrlNameTitle = _dialog displayCtrl 758042;
private _ctrlMap = _dialog displayCtrl 758043;
private _sector = _ctrlLbSectors lbData _lbIndex;
private _sectorPos = [_sector] call KPLIB_fnc_common_getPos;
private _garrison = [_sector] call KPLIB_fnc_garrison_getGarrison;

// Update inline title
_ctrlNameTitle ctrlSetText (markerText _sector);

// Show map and center on sector
_ctrlMap ctrlShow true;
_ctrlMap ctrlMapAnimAdd [0, 0.2, _sectorPos];
ctrlMapAnimCommit _ctrlMap;

true
