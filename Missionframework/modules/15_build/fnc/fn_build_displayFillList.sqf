#include "..\ui\defines.hpp"
#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayFillList

    File: fn_build_displayFillList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Sets display build mode

    Parameter(s):
        _mode - Build mode index [NUMBER, defaults to 0]

    Returns:
        Mode was changed [BOOL]
*/
params [
    ["_categoryIdx", 0, [0]],
    ["_searchQuery", "", [""]]
];

// CfgVehicles config for shorter/faster access
private _cfg = configFile >> "CfgVehicles";
// Get category items
(LGVAR(buildables) select _categoryIdx) params ["", "_categoryItems"];

private _listBox = LGVAR(display) displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
_listBox lbSetCurSel -1; // Unselect current row as it sticks between clearing
lnbClear _listBox;

private _fnc_addItems = {

};

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

        _listBox lnbAddRow [_name, str _priceSupp, str _priceAmmo, str _priceFuel];
        private _currentIdx = ((lnbSize _listBox) select 0) - 1;

        // Serialize classname and price
        _listBox lnbSetData [[_currentIdx, 0], str _x];

        private _icon = _className call KPLIB_fnc_common_getIcon;
        _listBox lnbSetPicture [[_currentIdx, 0], _icon];
    } forEach _x;

} foreach _categoryItems;

true
