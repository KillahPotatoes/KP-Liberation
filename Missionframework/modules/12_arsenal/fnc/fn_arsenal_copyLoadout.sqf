/*
    KPLIB_fnc_arsenal_copyLoadout

    File: fn_arsenal_copyLoadout.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-19
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Copies the loadout from selected player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

disableSerialization;

// Dialog controls
private _dialog = findDisplay 758012;
private _ctrlNearPlayer = _dialog displayCtrl 68741;

private _index = lbCurSel _ctrlNearPlayer;
player setUnitLoadout (getUnitLoadout (missionNamespace getVariable (_ctrlNearPlayer lbData _index)));

[] call KPLIB_fnc_arsenal_checkGear;

true
