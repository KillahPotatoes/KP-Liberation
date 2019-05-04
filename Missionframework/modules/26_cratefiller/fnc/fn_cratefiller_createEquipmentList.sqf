/*
    KPLIB_fnc_cratefiller_createEquipmentList

    File: fn_cratefiller_createEquipmentList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-23
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
private _dialog = findDisplay 758026;
private _ctrlCat = _dialog displayCtrl 75810;
private _ctrlWeapon = _dialog displayCtrl 75811;
private _ctrlEquipment = _dialog displayCtrl 75812;

// Clear the lists
lbClear _ctrlWeapon;
lbClear _ctrlEquipment;

// Hide controls
_ctrlWeapon ctrlShow false;

// Read controls
private _catIndex = lbCurSel _ctrlCat;

// Check for empty selection
if (_catIndex isEqualTo -1) exitWith {};

private _index = 0;
private _config = "";

switch (_catIndex) do {

    // Weapons
    case 0 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["weapons", []]);
    };

    // Magazines
    case 1 : {
        _ctrlWeapon ctrlShow true;
        {
            _index = _ctrlWeapon lbAdd (_x select 0);
            _ctrlWeapon lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlWeapon lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["weapons", []]);
    };

    // Attachments
    case 2 : {
        _ctrlWeapon ctrlShow true;
        {
            _index = _ctrlWeapon lbAdd (_x select 0);
            _ctrlWeapon lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlWeapon lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["weapons", []]);
    };

    // Grenades
    case 3 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["grenades", []]);
    };

    // Explosives
    case 4 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["explosives", []]);
    };

    // Items
    case 5 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["items", []]);
    };

    // Backpacks
    case 6 : {
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach (KPLIB_cratefiller_data getVariable ["backpacks", []]);
    };

};

true
