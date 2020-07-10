#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_getNearStorages

    File: fn_cratefiller_getNearStorages.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Scans the fob for possible storages.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlStorage = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOCARGO;

// Clear the lists
lbClear _ctrlStorage;

// Variables
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _type = objNull;
private _config = "";
private _number = 0;
private _index = 0;
private _picture = "";
private _blacklist = [
    KPLIB_preset_crateSupplyE,
    KPLIB_preset_crateSupplyF,
    KPLIB_preset_crateAmmoE,
    KPLIB_preset_crateAmmoF,
    KPLIB_preset_crateFuelE,
    KPLIB_preset_crateFuelF,
    KPLIB_logistic_building,
    "GroundWeaponHolder",
    "WeaponHolderSimulated",
    ""
];
private _objects = (getMarkerPos _nearFOB) nearObjects KPLIB_param_fobRange;

// Get near objects and check for storage capacity
{
    _type = typeOf _x;
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    _number = getNumber (_config >> "maximumLoad");
    // If the object has an inventory add it to the list
    if (_number > 0) then {
        _index = _ctrlStorage lbAdd format ["%1m - %2", round ((getPos player) distance2D _x), getText (_config >> "displayName")];
        _ctrlStorage lbSetData [_index, netId _x];
        _picture = getText (_config >> "picture");
        if (_picture isEqualTo "pictureThing") then {
            _ctrlStorage lbSetPicture [_index, "KPGUI\res\icon_help.paa"];
        } else {
            _ctrlStorage lbSetPicture [_index, _picture];
        };
    };
} forEach (_objects select {!(typeOf _x in _blacklist) && !((typeOf _x select [0,1]) isEqualTo "#") && !(_x isKindOf "Building")});


true
