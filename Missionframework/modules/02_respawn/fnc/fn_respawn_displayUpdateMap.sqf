/*
    KPLIB_fnc_

    File: fn_respawn_displayUpdateMap.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/


private _mapCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_MAP;;
_mapCtrl ctrlMapAnimAdd [0, 0.3, _spawnPos];
ctrlMapAnimCommit _mapCtrl;
