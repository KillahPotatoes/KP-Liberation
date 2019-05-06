/*
    KPLIB_fnc_respawn_displayLoadoutSelChanged

    File: fn_respawn_displayLoadoutSelChanged.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-14
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        - DESCRIPTION MISSING @veteran29

    Parameter(s):
        _loadoutListCtrl    - Spawn list control    [CONTROL, defaults to nil]
        _selectedIndex      - Selected index        [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_loadoutListCtrl", nil, [controlNull]],
    ["_selectedIndex", 0, [0]]
];

private _display = ctrlParent _loadoutListCtrl;
// Get currently selected item
private _loadoutName = _loadoutListCtrl lbData _selectedIndex;

// Set currently selected item
_display setVariable ["KPLIB_selLoadout", _loadoutName];

true
