/*
    KPLIB_fnc_build_removeBuildables

    File: KPLIB_fnc_build_removeBuildables.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Removes buildable items

    Parameter(s):
        _category   - Display name of category                  [String, defaults to ""]
        _itemsIndex - Index of items to remove from category    [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Items were removed [BOOL]
*/
params [
    ["_category", "", [""]],
    ["_itemsIndex", -1, [0]]
];

private _categoryIndex = KPLIB_build_categoryItems findIf {(_x select 0) isEqualTo _category};
// There is no category with given name, do nothing
if(_categoryIndex isEqualTo -1) exitWith {false};

// Get category items
private _categoryBuildables = (KPLIB_build_categoryItems select _categoryIndex) select 1;

// If no items were removed return false
if (isNil {_categoryBuildables deleteAt _itemsIndex}) exitWith {
    false
};

// If no items left in the category then remove it
if (_categoryBuildables isEqualTo []) then {
    KPLIB_build_categoryItems deleteAt _categoryIndex;
};

true

