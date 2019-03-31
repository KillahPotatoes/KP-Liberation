/*
    KPLIB_fnc_garrisonSelectSector

    File: fn_garrison_dialogSelectSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-30
    Last Update: 2019-03-31
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
private _ctrlAlertNote = _dialog displayCtrl 758043;
private _ctrlInfLabel = _dialog displayCtrl 758044;
private _ctrlInfAmount = _dialog displayCtrl 758045;
private _ctrlLightLabel = _dialog displayCtrl 758046;
private _ctrlLightAmount = _dialog displayCtrl 758047;
private _ctrlHeavyLabel = _dialog displayCtrl 758048;
private _ctrlHeavyAmount = _dialog displayCtrl 758049;
private _ctrlMap = _dialog displayCtrl 7580410;
private _sector = _ctrlLbSectors lbData _lbIndex;
private _sectorPos = [_sector] call KPLIB_fnc_common_getPos;
private _garrison = [_sector] call KPLIB_fnc_garrison_getGarrison;
private _sectorDetailCtrls = [
    _ctrlNameTitle,
    _ctrlInfLabel,
    _ctrlInfAmount,
    _ctrlLightLabel,
    _ctrlLightAmount,
    _ctrlHeavyLabel,
    _ctrlHeavyAmount,
    _ctrlMap
];
private _alert = !(([_sector, true] call KPLIB_fnc_garrison_getGarrison) isEqualTo []);

// Show sector details
{_x ctrlShow true;} forEach _sectorDetailCtrls;

// Update sector details
_ctrlNameTitle ctrlSetText (markerText _sector);
_ctrlInfAmount ctrlSetText (str (_garrison select 2));
_ctrlLightAmount ctrlSetText (str (count (_garrison select 3)));
_ctrlHeavyAmount ctrlSetText (str (count (_garrison select 4)));

// Show alert state hint
if (_alert) then {
    _ctrlAlertNote ctrlShow true;
} else {
    _ctrlAlertNote ctrlShow false;
};

// Show map and center on sector
_ctrlMap ctrlMapAnimAdd [0, 0.2, _sectorPos];
ctrlMapAnimCommit _ctrlMap;

true
