#include "..\ui\defines.hpp"
#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayLoad

    File: fn_build_displayLoad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle build display load

    Parameter(s):
        _display - Build display [DISPLAY, defaults to nil]

    Returns:
        Display was loaded [BOOL]
*/

params [
    ["_display", nil, [displayNull]]
];

// Add Item selection handler
private _itemsList = _display displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
_itemsList ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    if(_selectedIndex isEqualTo -1) exitWith {
        LSVAR("buildItem", []);
    };

    private _stringArray = (_control lnbData [_selectedIndex, 0]);
    systemChat str _stringArray;
    private _selectedItem = parseSimpleArray _stringArray;

    LSVAR("buildItem", _selectedItem);

    // Unfocus the listbox to prevent camera controls from changing the selection
    ctrlSetFocus ((ctrlParent _control) displayCtrl KPLIB_IDC_BUILD_CONFIRM);
}];


private _categoriesList = _display displayCtrl KPLIB_IDC_BUILD_CATEGORY_LIST;
_categoriesList ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    // Clear the search on category change
    LSVAR("search", "");

    // Fill the items list
    [_selectedIndex, ""] call KPLIB_fnc_build_displayFillList;

    // Unfocus the listbox to prevent camera controls from changing the selection
    ctrlSetFocus ((ctrlParent _control) displayCtrl KPLIB_IDC_BUILD_CONFIRM);
}];

// Fill the list of categories
{
    _x params ["_categoryName"];
    _categoriesList lbAdd _categoryName;
} forEach LGVAR(buildables);

// Hide vignette, show hud
private _vignette = _display displayCtrl 1202;
_vignette ctrlShow false;
showHUD true;

LSVAR("display", _display);

// Select last category
_categoriesList lbSetCurSel LGVAR_D(selectedCategoryIdx, 0);

/* Seems to be buggy on triple screen, disable for now
 setMousePosition LGVAR(mousePos); */

["KPLIB_build_display_open", [_display]] call CBA_fnc_localEvent;

true
