/*
    KPLIB_fnc_cratefiller_createSubList

    File: fn_cratefiller_createSubList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates a list with valueable magazines or attachments.

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
lbClear _ctrlEquipment;

// Read controls
private _catIndex = lbCurSel _ctrlCat;
private _weaponIndex = lbCurSel _ctrlWeapon;

// Check for empty selection
if (_weaponIndex == -1) exitWith {};

// Weapon selection
private _weaponType = _ctrlWeapon lbData _weaponIndex;

private _config = "";

switch (_catIndex) do {

    // Magazines
    case 1 : {
        // Get compatible magazines
        private _glType = (getArray (configfile >> "CfgWeapons" >> _weaponType >> "muzzles")) select 1;
        private _magazines = [_weaponType] call CBA_fnc_compatibleMagazines;
        _magazines append ([configfile >> "CfgWeapons" >> _weaponType >> _glType] call CBA_fnc_compatibleMagazines);
        _magazines = _magazines - KPLIB_preset_arsenal_blacklist;
        private _sortedMagazines = [_magazines] call KPLIB_fnc_cratefiller_sortList;

        private _index = 0;

        // Fill controls
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach _sortedMagazines;
    };

    // Attachments
    case 2 : {
        // Get compatible attachments
        private _attachments = [_weaponType] call BIS_fnc_compatibleItems;
        _attachments = _attachments - KPLIB_preset_arsenal_blacklist;
        private _sortedAttachments = [_attachments] call KPLIB_fnc_cratefiller_sortList;

        private _index = 0;

        // Fill controls
        {
            _index = _ctrlEquipment lbAdd (_x select 0);
            _ctrlEquipment lbSetData [_index , _x select 1];
            _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
            _ctrlEquipment lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
        } forEach _sortedAttachments;
    };
};

true
