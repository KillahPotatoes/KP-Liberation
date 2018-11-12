/*
    KPLIB_fnc_arsenal_postInit

    File: fn_arsenal_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-12
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {
    diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initializing...", diag_tickTime];

    // Load arsenal
    [] call KPLIB_fnc_init_fillArsenal;

    diag_log format ["[KP LIBERATION] [%1] [POST] [ARSENAL] Module initialized", diag_tickTime];
};

true
