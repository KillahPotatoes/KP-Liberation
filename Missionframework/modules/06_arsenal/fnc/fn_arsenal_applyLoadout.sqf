/*
    KPLIB_fnc_arsenal_applyLoadout

    File: fn_arsenal_applyLoadout.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-14
    Last Update: 2018-11-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Applies the selected loadout to the player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758076;
private _ctrlLoadoutList = _dialog displayCtrl 68740;

private _index = lbCurSel _ctrlLoadoutList;
private _loadout = _ctrlLoadoutList lbText _index;

[player, [profileNamespace, _loadout]] call bis_fnc_loadInventory;

true
