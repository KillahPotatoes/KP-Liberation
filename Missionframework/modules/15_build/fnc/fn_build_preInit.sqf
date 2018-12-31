/*
    KPLIB_fnc_build_preInit

    File: fn_build_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [BUILD] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Build camera
KPLIB_build_camera = objNull;

KPLIB_buildLogic = locationNull;

// Build camera PFH ticker id
KPLIB_build_ticker = -1;

// Save data
KPLIB_build_saveNamespace = locationNull;

// Object from which FOB build event originated
KPLIB_build_fobBuildObject = objNull;

// Categorized buildable items
KPLIB_build_categoryItems = [];

if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_build_loadData}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_build_saveData}] call CBA_fnc_addEventHandler;

    ["KPLIB_build_item_built", {
        params ["_object", "_fob"];
        if (_fob isEqualTo "") exitWith {};

        // If fob has no save data, initialize it
        if (isNil {KPLIB_build_saveNamespace getVariable _fob}) then {
            KPLIB_build_saveNamespace setVariable [_fob, []];
        };

        // Skip storage areas
        if !((typeOf _object) in KPLIB_res_storageClasses) then {
            (KPLIB_build_saveNamespace getVariable _fob) pushBackUnique _object;
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
        diag_log format ["[KP LIBERATION] [BUILD] KPLIB_fob_build_requested with _object: %1 (%2) - global: %3 (%4)", _object, getPos _object, KPLIB_build_fobBuildObject, getPos KPLIB_build_fobBuildObject];
        // Start single item build for fob building
        [_pos, nil, [KPLIB_preset_fobBuildingF, 0,0,0], {
            // On confirm callback, create FOB on server
            [_this select 0, KPLIB_build_fobBuildObject] remoteExec ["KPLIB_fnc_build_handleFobBuildConfirm", 2];
         }] call KPLIB_fnc_build_start_single;
    }] call CBA_fnc_addEventHandler;

    player addEventHandler ["Killed", KPLIB_fnc_build_stop];

    // Add default buildables from preset
    {
        [
            localize (_x select 0),
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

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [BUILD] Module initialized", diag_tickTime];};

true
