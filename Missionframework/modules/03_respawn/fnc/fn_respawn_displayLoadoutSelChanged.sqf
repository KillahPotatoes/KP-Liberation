/*
    KPLIB_fnc_

    File: fn_respawn_displayLoadoutSelChanged.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-14
    Last Update: 2018-09-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
        0: CONTROL - Spawn list control
        1: NUMBER - Selected index

    Returns:
    NOTHING
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
