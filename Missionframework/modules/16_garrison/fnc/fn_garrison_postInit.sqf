/*
    KPLIB_fnc_garrison_postInit

    File: fn_garrison_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [GARRISON] Module initializing...", diag_tickTime];};

// Player section
if (hasInterface) then {
    // Action to open the dialog
    private _actionArray = [
        localize "STR_KPLIB_ACTION_GARRISON_MENU",
        {[] call KPLIB_fnc_garrison_openDialog;},
        nil,
        -800,
        false,
        true,
        "",
        '_target isEqualTo _originalTarget && !(_originalTarget getVariable ["KPLIB_fob", ""] isEqualTo "") && !(KPLIB_sectors_blufor isEqualTo [])'
    ];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [GARRISON] Module initialized", diag_tickTime];};

true
