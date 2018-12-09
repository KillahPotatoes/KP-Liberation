/*
    KPLIB_fnc_build_addBuildables

    File: KPLIB_fnc_build_addBuildables.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-09
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

// If array given filter out bad entries
/*if (_buildables isEqualType []) then {
    _buildables = _buildables select {_x isEqualTypeArray ["", 0, 0, 0]};

    // Exit if no entries left after filtering
    if (_buildables isEqualTo []) exitWith {
        diag_log format [
            "[KP LIBERATION] [%1] [BUILD] No valid build entries given: '%2'. Can't add to category: '%3'. Expected buildables format: [<STRING>, <NUMBER>, <NUMBER>, <NUMBER>]",
            diag_tickTime, _buildables, _category
        ];
    };
};*/

private _categoryIndex = KPLIB_build_categoryItems findIf {(_x select 0) isEqualTo _category};
// Add the category if it does not exist
if(_categoryIndex isEqualTo -1) then {
    // Add the new category
    KPLIB_build_categoryItems pushBack [
        _category,
        [
            _buildables
        ]
    ];
    // Return index of items inside category
    0
} else {
    private _category = (KPLIB_build_categoryItems select _categoryIndex) params ["", "_categoryItems"];
    // Append the buildables to existing category
    _categoryItems pushBack _buildables
}

