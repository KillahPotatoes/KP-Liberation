#include "..\ui\defines.hpp"
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
    ["_lbIndex", -1, [0]]
];

// Exit if no parameters passed
if (_lbIndex isEqualTo -1) exitWith {};

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

// Initialize needed local variables
private _sector = _ctrlLbSectors lbData _lbIndex;
private _sectorPos = [_sector] call KPLIB_fnc_common_getPos;
private _garrison = [_sector] call KPLIB_fnc_garrison_getGarrison;
private _alert = !(([_sector, true] call KPLIB_fnc_garrison_getGarrison) isEqualTo []);

// Show sector details
{_x ctrlShow true;} forEach _sectorDetailCtrls;

// Show alert state hint
_ctrlAlertNote ctrlShow _alert;
_ctrlInfBox ctrlEnable !_alert;
_ctrlInfButton ctrlEnable !_alert;
_ctrlLightList ctrlEnable !_alert;
_ctrlLightButton ctrlEnable !_alert;
_ctrlHeavyList ctrlEnable !_alert;
_ctrlHeavyButton ctrlEnable !_alert;

// Update sector details
_ctrlNameTitle ctrlSetText (markerText _sector);
_ctrlInfAmount ctrlSetText (str (_garrison select 2));
_ctrlLightAmount ctrlSetText (str (count (_garrison select 3)));
_ctrlHeavyAmount ctrlSetText (str (count (_garrison select 4)));

// Reset infantry amount box
_ctrlInfBox ctrlSetText "0";

// Fill light vehicle list
lbClear _ctrlLightList;
_ctrlLightList lbSetData [_ctrlLightList lbAdd "---", ""];
_ctrlLightList lbSetCurSel 0;

if !((_garrison select 3) isEqualTo []) then {
    // Fetch array of displayname and classname
    private _lightVehicles = [];
    private _cfg = configFile >> "CfgVehicles";
    {
        _lightVehicles pushBack [getText (_cfg >> _x >> "displayName"), _x];
    } forEach (_garrison select 3);
    _lightVehicles sort true;

    // Fill dropdown
    {
        _ctrlLightList lbSetData [_ctrlLightList lbAdd (_x select 0), _x select 1];
    } forEach _lightVehicles;
};

// Fill heavy vehicle list
lbClear _ctrlHeavyList;
_ctrlHeavyList lbSetData [_ctrlHeavyList lbAdd "---", ""];
_ctrlHeavyList lbSetCurSel 0;

if !((_garrison select 4) isEqualTo []) then {
    // Fetch array of displayname and classname
    private _heavyVehicles = [];
    private _cfg = configFile >> "CfgVehicles";
    {
        _heavyVehicles pushBack [getText (_cfg >> _x >> "displayName"), _x];
    } forEach (_garrison select 4);
    _heavyVehicles sort true;

    // Fill dropdown
    {
        _ctrlHeavyList lbSetData [_ctrlHeavyList lbAdd (_x select 0), _x select 1];
    } forEach _heavyVehicles;
};

// Show map and center on sector
_ctrlMap ctrlMapAnimAdd [0, 0.2, _sectorPos];
ctrlMapAnimCommit _ctrlMap;

true
