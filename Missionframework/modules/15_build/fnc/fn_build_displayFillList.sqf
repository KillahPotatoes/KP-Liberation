#include "..\ui\defines.hpp"
#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayFillList

    File: fn_build_displayFillList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2019-04-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Fill list of buildable items

    Parameter(s):
        NONE

    Returns:
        Mode was changed [BOOL]
*/

// CfgVehicles config for shorter/faster access
private _cfg = configFile >> "CfgVehicles";
// Get categories list
private _categoriesList = LGVAR(display) displayCtrl KPLIB_IDC_BUILD_CATEGORY_LIST;
private _categoryIdx = lbCurSel _categoriesList;
// Get search query box
private _searchBox = LGVAR(display) displayCtrl KPLIB_IDC_BUILD_SEARCH;
private _searchQuery = toLower ctrlText _searchBox;
// Get list box with buildables
private _listBox = LGVAR(display) displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
_listBox lbSetCurSel -1; // Unselect current row as it sticks between clearing
lnbClear _listBox;

// Get category items
(LGVAR(buildables) select _categoryIdx) params ["", "_categoryItems"];

// Fill the item list
{
    // If item is a code execute it
    if(_x isEqualType {}) then {
        _x = [] call _x;
    };

    // Fill the list with items from currently selected category
    {
        _x params ["_className", "_priceSupp", "_priceAmmo", "_priceFuel"];

        private _name = getText (_cfg >> _className >> "displayName");
        // Filter list
        if !((toLower _name find _searchQuery) isEqualTo -1) then {

            _listBox lnbAddRow [_name, str _priceSupp, str _priceAmmo, str _priceFuel];
            private _currentIdx = ((lnbSize _listBox) select 0) - 1;

            // Serialize classname and price
            _listBox lnbSetData [[_currentIdx, 0], str _x];

            private _icon = _className call KPLIB_fnc_common_getIcon;
            _listBox lnbSetPicture [[_currentIdx, 0], _icon];
        };
    } forEach _x;

} foreach _categoryItems;

true
