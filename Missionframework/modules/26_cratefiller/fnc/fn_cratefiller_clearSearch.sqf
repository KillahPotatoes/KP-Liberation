/*
    KPLIB_fnc_cratefiller_clearSearch

    File: fn_cratefiller_clearSearch.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-15
    Last Update: 2019-04-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Clears the search box.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlSearch = _dialog displayCtrl 68743;

// Clear the control
_ctrlSearch ctrlSetText "";

[] call KPLIB_fnc_cratefiller_createEquipmentList;

true
