/*
    KPLIB_fnc_build_preInit

    File: fn_build_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-05-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [BUILD", true] call KPLIB_fnc_common_log;};

/*
    ----- Module Globals -----
*/

// Build camera
KPLIB_build_camera = objNull;

KPLIB_buildLogic = locationNull;

// Build camera PFH ticker id
KPLIB_build_ticker = -1;

// Object from which FOB build event originated
KPLIB_build_fobBuildObject = objNull;

// Categorized buildable items
KPLIB_build_categoryItems = [];

if (isServer) then {

    // Register FOB var for persistence
    ["KPLIB_fob", true] call KPLIB_fnc_persistence_addPersistentVar;

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_build_loadData}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_build_saveData}] call CBA_fnc_addEventHandler;

    ["KPLIB_build_item_built", {
        params ["_object", "_fob"];
        if (_fob isEqualTo "") exitWith {};

        // Skip storage areas
        if !((typeOf _object) in KPLIB_resources_storageClasses) then {
            _object setVariable ["KPLIB_fob", _fob, true];
            _object call KPLIB_fnc_persistence_makePersistent;
        };

    }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Register build item movement handler
    ["KPLIB_build_item_moved", KPLIB_fnc_build_validatePosition] call CBA_fnc_addEventHandler;

    // Register Build module as FOB building provider
    ["KPLIB_fob_build_requested", {
        params ["_object", ["_pos", KPLIB_zeroPos]];
        KPLIB_build_fobBuildObject = _object;
        if (_pos isEqualTo KPLIB_zeroPos) then{
            _pos = getPos _object;
        };
        [format ["KPLIB_fob_build_requested with _object: %1 (%2) - global: %3 (%4)", _object, getPos _object, KPLIB_build_fobBuildObject, getPos KPLIB_build_fobBuildObject], "BUILD", true] call KPLIB_fnc_common_log;
        // Start single item build for fob building
        [_pos, nil, [KPLIB_preset_fobBuildingF, 0,0,0], {
            // On confirm callback, create FOB on server
            [_this select 0, KPLIB_build_fobBuildObject] remoteExec ["KPLIB_fnc_build_handleFobBuildConfirm", 2];
         }] call KPLIB_fnc_build_start_single;
    }] call CBA_fnc_addEventHandler;

    player addEventHandler ["Killed", KPLIB_fnc_build_stop];

    // Handle server notification about not enough resources
    ["KPLIB_build_not_enough_resources", {
        params ["_classname"];
        // TODO common func with caching
        private _name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");

        [
            format[localize "STR_KPLIB_HINT_BUILD_NO_RESOURCES", _name]
        ] call CBA_fnc_notify;

    }] call CBA_fnc_addEventHandler;

    // Add default buildables from preset
    {
        [
            localize (_x select 0),
            // Add preset vars as code so if preset is changed during gameplay the lists will update dynamically
            compile format ["KPLIB_preset_%1F", _x select 1]
        ] call KPLIB_fnc_build_addBuildables;
    } forEach [
        // Infantry
        ["STR_KPLIB_CAT_INFANTRY", "units"],
        ["STR_KPLIB_CAT_INFANTRY", "specOps"],
        // Light
        ["STR_KPLIB_CAT_LIGHT", "vehLightUnarmed"],
        ["STR_KPLIB_CAT_LIGHT", "vehLightArmed"],
        // Heavy
        ["STR_KPLIB_CAT_HEAVY", "vehHeavyApc"],
        ["STR_KPLIB_CAT_HEAVY", "vehHeavy"],
        // Transport
        ["STR_KPLIB_CAT_TRANSPORT", "vehTrans"],
        // Helicopters
        ["STR_KPLIB_CAT_HELI", "heliTrans"],
        ["STR_KPLIB_CAT_HELI", "heliAttack"],
        // Planes
        ["STR_KPLIB_CAT_PLANES", "planeTrans"],
        ["STR_KPLIB_CAT_PLANES", "jets"],
        // Statics
        ["STR_KPLIB_CAT_AA", "vehAntiAir"],
        // Artillery
        ["STR_KPLIB_CAT_ARTY", "vehArty"],
        // Anti-Air
        ["STR_KPLIB_CAT_STATICS", "statics"],
        // Boats
        ["STR_KPLIB_CAT_BOATS", "boats"],
        // Logistic
        ["STR_KPLIB_CAT_LOGISTIC", "logistic"],
        // Decoration
        ["STR_KPLIB_CAT_DECO", "deco"]
    ];

};

if (isServer) then {["Module initialized", "PRE] [BUILD", true] call KPLIB_fnc_common_log;};

true
