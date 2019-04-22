/*
    KPLIB_fnc_admin_postInit

    File: fn_admin_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2019-04-22
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

["Module initializing...", "POST] [ADMIN", true] call KPLIB_fnc_common_log;

// Player section
if (hasInterface) then {
    // Action to open the dialog
    private _actionArray = [
        "<t color='#FF8000'>" + localize "STR_KPLIB_ACTION_ADMIN_MENU" + "</t>",
        {[] call KPLIB_fnc_admin_openDialog;},
        nil,
        -804,
        false,
        true,
        "",
        '_target isEqualTo _originalTarget && serverCommandAvailable "#kick"'
    ];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

["Module initialized", "POST] [ADMIN", true] call KPLIB_fnc_common_log;

true
