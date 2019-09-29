/*
    KPLIB_fnc_captive_preInit

    File: fn_captive_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-10
    Last Update: 2019-09-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;

/*
    ----- Module Initialization -----
*/

    // Process CBA Settings
    [] call KPLIB_fnc_captive_settings;

    // Units surrender on sector capture
    ["KPLIB_sector_captured", {[_this select 0] call KPLIB_fnc_captive_checkSector;}] call CBA_fnc_addEventHandler;

    // Unit animation on arrest
    ["KPLIB_captive_arrested", {
        _this select 0 playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
        _this select 0 playMove "AmovPercMstpSnonWnonDnon_EaseIn";
    }] call CBA_fnc_addEventHandler;

    // Check for handcuffed enemys
    ["ace_captiveStatusChanged", {[_this select 0, _this select 1, _this select 2] call KPLIB_fnc_captive_setAceCaptive}] call CBA_fnc_addEventHandler;

};

// Add load captive EH
["KPLIB_captive_load", {
    params [
        ["_unit", objNull, [objNull]],
        ["_vehicle", objNull, [objNull]]
    ];
    // Move unit in vehicle cargo
    _unit moveInCargo _vehicle;
}] call CBA_fnc_addEventHandler;

// Add unload captive EH
["KPLIB_captive_unload", {
    params [
        ["_unit", objNull, [objNull]],
        ["_vehicle", objNull, [objNull]]
    ];
    // Unload the unit
    moveOut _unit;
    _unit switchMove "AmovPercMstpSnonWnonDnon_EaseIn";
}] call CBA_fnc_addEventHandler;

// Emit lib captive event on ace event to ensure compatibilty
["ace_captives_moveInCaptive", {
    params [
        ["_unit", objNull, [objNull]],
        ["_vehicle", objNull, [objNull]]
    ];
    // Emit global event
    ["KPLIB_captive_loaded", [_unit, _vehicle]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

// Emit lib captive event on ace event to ensure compatibilty
["ace_captives_moveOutCaptive", {
    params [
        ["_unit", objNull, [objNull]]
    ];
    // Emit global event
    ["KPLIB_captive_unloaded", [_unit]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;


// Player section
if (hasInterface) then {

    // Add EH for the captive unload action
    ["KPLIB_captive_loaded", {
        params [
            ["_unit", objNull, [objNull]],
            ["_vehicle", objNull, [objNull]]
        ];
        // Exit the function on missing vehicle, due to an emitted event through ace
        if (isNull _vehicle) exitWith {};
        // Remove the stop escort action if available
        player removeAction (player getVariable ["KPLIB_stopEscort_id", 9000]);

        // Add the unload action to the vehicle
        private _id = [
            _vehicle,
            ["STR_KPLIB_ACTION_UNLOADCAPTIVE", name _unit],
            [{[_this select 3, _this select 0] call KPLIB_fnc_captive_unloadCaptive;}, _unit, -800, false, true, "", "", 10]
        ] call KPLIB_fnc_common_addAction;

        // Save id in unit
        _unit setVariable ["KPLIB_captive_unloadID", _id]
    }] call CBA_fnc_addEventHandler;

    // Add EH to remove the unload action
    ["KPLIB_captive_unloaded", {
        params [
            ["_unit", objNull, [objNull]],
            ["_vehicle", objNull, [objNull]]
        ];
        // Remove the unload action from the vehicle
        _vehicle removeAction (_unit getVariable ["KPLIB_captive_unloadID", 9000]);
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {["Module initialized", "PRE] [CAPTIVE", true] call KPLIB_fnc_common_log;};

true
