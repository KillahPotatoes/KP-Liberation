/*
    KPLIB_fnc_arsenal_applyLoadout

    File: fn_arsenal_applyLoadout.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-14
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Applies the selected loadout to the player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758012;
private _ctrlLoadoutList = _dialog displayCtrl 68740;

// Get the selected loadout name
private _index = lbCurSel _ctrlLoadoutList;
private _loadout = _ctrlLoadoutList lbText _index;

if !(_loadout isEqualTo "----------") then {
    [player, [profileNamespace, _loadout]] call bis_fnc_loadInventory;
};

[] call KPLIB_fnc_arsenal_checkGear;

true
