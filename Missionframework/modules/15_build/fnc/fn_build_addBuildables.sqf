/*
    KPLIB_fnc_build_addBuildables

    File: KPLIB_fnc_build_addBuildables.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds buildable items

    Parameter(s):
        _category   - Display name of category [DATATYPE, defaults to DEFAULTVALUE]
        _buildables - Buildable items [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Index of items inside category [NUMBER]
*/
params [
    ["_category", "", [""]],
    ["_buildables", [], [[], {}]]
];

private _categoryIndex = KPLIB_build_categoryItems findIf {(_x select 0) isEqualTo _category};
// Add the category if it does not exist
if(_categoryIndex isEqualTo -1) exitWith {
    // Add the new category
    KPLIB_build_categoryItems pushBack [
        _category,
        [
            _buildables
        ]
    ];
    // Return index of items inside category
    0
};

private _categoryBuildables = (KPLIB_build_categoryItems select _categoryIndex) select 1;
// Append the buildables to existing category
_categoryBuildables pushBack _buildables
