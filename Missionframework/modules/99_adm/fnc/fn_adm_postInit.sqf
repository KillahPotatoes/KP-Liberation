/*
    KPLIB_fnc_adm_postInit

    File: fn_adm_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ADM] Module initializing...", diag_tickTime];};

// Player section
if (hasInterface) then {
    // Action to open the dialog
    private _actionArray = [
        "<t color='#FF8000'>" + localize "STR_KPLIB_ACTION_ADMIN_MENU" + "</t>",
        {[] call KPLIB_fnc_adm_openDialog;},
        nil,
        -804,
        false,
        true,
        "",
        '_target isEqualTo _originalTarget && serverCommandAvailable "#kick"'
    ];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [ADM] Module initialized", diag_tickTime];};

true
