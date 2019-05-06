#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_cratefiller_createEquipmentList

    File: fn_cratefiller_createEquipmentList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Changes the shown equipment category.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlCat = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOEQUIPMENT;
private _ctrlWeapon = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOWEAPONS;
private _ctrlSearch = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_SEARCHBAR;
private _ctrlEquipment = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_EQUIPMENTLIST;

// Clear the lists
lbClear _ctrlWeapon;
lbClear _ctrlEquipment;

// Hide controls
_ctrlWeapon ctrlShow false;
_ctrlSearch ctrlShow false;

// Read controls
private _catIndex = lbCurSel _ctrlCat;

// Check for empty selection
if (_catIndex isEqualTo -1) exitWith {};

// Variables
private _config = "";

switch (_catIndex) do {

    // Weapons
    case 0 : {
        {
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lnbAddRow ["", _x select 0];
            _ctrlEquipment lnbSetPicture [[_foreachIndex, 0], getText (_config >> "picture")];
        } forEach (CGVAR("weapons", []));
        CCSVAR("activeCat", "weapons", false);
    };

    // Magazines
    case 1 : {
        _ctrlWeapon ctrlShow true;
        _ctrlSearch ctrlShow true;
        {
            _index = _ctrlWeapon lbAdd (_x select 0);
            _ctrlWeapon lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlWeapon lbSetPicture [_index, getText (_config >> "picture")];
        } forEach (CGVAR("weapons", []));
        CCSVAR("activeCat", "magazines", false);
    };

    // Attachments
    case 2 : {
        _ctrlWeapon ctrlShow true;
        _ctrlSearch ctrlShow true;
        {
            _index = _ctrlWeapon lbAdd (_x select 0);
            _ctrlWeapon lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlWeapon lbSetPicture [_index, getText (_config >> "picture")];
        } forEach (CGVAR("weapons", []));
        CCSVAR("activeCat", "attachments", false);
    };

    // Grenades
    case 3 : {
        {
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lnbAddRow ["", _x select 0];
            _ctrlEquipment lnbSetPicture [[_foreachIndex, 0], getText (_config >> "picture")];
        } forEach (CGVAR("grenades", []));
        CCSVAR("activeCat", "grenades", false);
    };

    // Explosives
    case 4 : {
        {
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lnbAddRow ["", _x select 0];
            _ctrlEquipment lnbSetPicture [[_foreachIndex, 0], getText (_config >> "picture")];
        } forEach (CGVAR("explosives", []));
        CCSVAR("activeCat", "explosives", false);
    };

    // Items
    case 5 : {
        {
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lnbAddRow ["", _x select 0];
            _ctrlEquipment lnbSetPicture [[_foreachIndex, 0], getText (_config >> "picture")];
        } forEach (CGVAR("items", []));
        CCSVAR("activeCat", "items", false);
    };

    // Backpacks
    case 6 : {
        {
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lnbAddRow ["", _x select 0];
            _ctrlEquipment lnbSetPicture [[_foreachIndex, 0], getText (_config >> "picture")];
        } forEach (CGVAR("backpacks", []));
        CCSVAR("activeCat", "backpacks", false);
    };

};

true
