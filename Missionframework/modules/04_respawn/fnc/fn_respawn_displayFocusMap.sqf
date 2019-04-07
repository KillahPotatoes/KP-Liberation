#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayFocusMap

    File: fn_respawn_displayUpdateMap.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        -

    Parameter(s):
        _display - Respawn display [DISPLAY, defaults to nil]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_display", nil, [displayNull]]
];

private _respawnItem = (_display getVariable "KPLIB_selRespawn");
private _spawnPos = [(_respawnItem select 1)] call KPLIB_fnc_common_getPos;

private _mapCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_MAP;;
_mapCtrl ctrlMapAnimAdd [0, 0.3, _spawnPos];
ctrlMapAnimCommit _mapCtrl;

true
