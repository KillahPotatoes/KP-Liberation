#include "..\ui\defines.hpp"
#include "script_component.hpp"
/*
    KPLIB_fnc_mission_openDialog

    File: fn_mission_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-19
    Last Update: 2019-06-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Opens the mission dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_mission";
disableSerialization;

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_MISSION_DIALOG;
private _ctrlHeaderMission = _dialog displayCtrl KPLIB_IDC_MISSION_HEADERMISSIONLIST;
private _ctrlMission = _dialog displayCtrl KPLIB_IDC_MISSION_MISSIONLIST;
private _ctrlHeaderRunning = _dialog displayCtrl KPLIB_IDC_MISSION_HEADERRUNNINGLIST;
private _ctrlRunning = _dialog displayCtrl KPLIB_IDC_MISSION_RUNNINGLIST;

// Fill the header
_ctrlHeaderMission lnbAddRow ["Missionname", "", "", "", ""];
_ctrlHeaderMission lnbSetPicture [[0, 1], "res\ui_supplies.paa"];
_ctrlHeaderMission lnbSetPicture [[0, 2], "res\ui_ammo.paa"];
_ctrlHeaderMission lnbSetPicture [[0, 3], "res\ui_fuel.paa"];
_ctrlHeaderMission lnbSetPicture [[0, 4], "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa"];

_ctrlHeaderRunning lnbAddRow ["Missionname", "", "", "", ""];
_ctrlHeaderRunning lnbSetPicture [[0, 1], "res\ui_supplies.paa"];
_ctrlHeaderRunning lnbSetPicture [[0, 2], "res\ui_ammo.paa"];
_ctrlHeaderRunning lnbSetPicture [[0, 3], "res\ui_fuel.paa"];
_ctrlHeaderRunning lnbSetPicture [[0, 4], "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa"];

// Variables
private _data = [];

// Get data from namespace
private _missions = MGVAR("registeredMissions", []);
private _running = MGVAR("runningMissions", []);

// Fill the dialog controls
{
    _data = MGVAR(_x, []);
    (_data select 9) params [
        "_costSupply",
        "_costAmmo",
        "_costFuel",
        "_costIntel"
    ];
    _ctrlMission lnbAddRow [_data select 3, str _costSupply, str _costAmmo, str _costFuel, str _costIntel];
    _ctrlMission lnbSetData [[_forEachIndex, 0], _x];
} forEach _missions;

{
    _data = MGVAR(_x select 0, []);
    (_data select 9) params [
        "_costSupply",
        "_costAmmo",
        "_costFuel",
        "_costIntel"
    ];
    _costSupply = _costSupply * (KPLIB_param_missionRefund / 100);
    _costAmmo = _costAmmo * (KPLIB_param_missionRefund / 100);
    _costFuel = _costFuel * (KPLIB_param_missionRefund / 100);
    _costIntel = _costIntel * (KPLIB_param_missionRefund / 100);
    _ctrlRunning lnbAddRow [_data select 3, str _costSupply, str _costAmmo, str _costFuel, str _costIntel];
    _ctrlRunning lnbSetData [[_forEachIndex, 0], (_x select 0)];
} forEach _running;

true
