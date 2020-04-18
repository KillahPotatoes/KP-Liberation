/*
    KPPLM_fnc_postInit

    File: fn_postInit.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2020-04-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (!KPPLM_CBA) exitWith {["CBA not loaded. Aborting initialization!"] call BIS_fnc_error; false};

// Player section
if (hasInterface) then {
    // Load settings, if available
    private _settings = profileNamespace getVariable ["KPPLM_Settings", []];
    if !(_settings isEqualTo []) then {
        KPPLM_viewFoot = _settings select 0;
        KPPLM_viewVeh = _settings select 1;
        KPPLM_viewAir = _settings select 2;
        KPPLM_terrain = _settings select 3;
        KPPLM_tpv = _settings select 4;
        KPPLM_radio = _settings select 5;
        KPPLM_soundVeh = _settings select 6;
    };

    // Add event handler
    player addEventHandler ["GetInMan", {[] call KPPLM_fnc_getInOut}];
    player addEventHandler ["GetOutMan", {[] call KPPLM_fnc_getInOut}];

    // Action to open the dialog
    private _actionArray = [
        "<t color='#FF8000'>" + localize "STR_KPPLM_ACTIONOPEN" + "</t>",
        {[] call KPPLM_fnc_openDialog;},
        nil,
        -1000,
        false,
        true,
        "",
        '_target isEqualTo _originalTarget'
    ];
    [_actionArray] call CBA_fnc_addPlayerAction;

    // Apply default/loaded values
    [] call KPPLM_fnc_apply;
};

true
