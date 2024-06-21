/*
    File: fn_addActionsPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-13
    Last Update: 2023-10-28
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds Liberation player actions to the given player.

    Parameter(s):
        _player - Player to add the actions to [OBJECT, defaults to player]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_player", player, [objNull]]
];

if !(isPlayer _player) exitWith {["No player given"] call BIS_fnc_error; false};

if (isNil "KPLIB_resources_global") then {KPLIB_resources_global = false;};

// Tutorial
_player addAction [
    ["<t color='#80FF80'>", localize "STR_TUTO_ACTION", "</t>"] joinString "",
    {howtoplay = 1;},
    nil,
    -700,
    false,
    true,
    "",
    "
        alive _originalTarget
        && {_originalTarget getVariable ['KPLIB_isNearStart', false]}
    "
];

// HALO
_player addAction [
    ["<t color='#80FF80'>", localize "STR_HALO_ACTION", "</t><img size='2' image='res\ui_redeploy.paa'/>"] joinString "",
    "scripts\client\spawn\do_halo.sqf",
    nil,
    -710,
    false,
    true,
    "",
    "
        KPLIB_param_halo > 0
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < 20
            || {_originalTarget getVariable ['KPLIB_isNearStart', false]}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Redeploy
_player addAction [
    ["<t color='#80FF80'>", localize "STR_DEPLOY_ACTION", "</t><img size='2' image='res\ui_redeploy.paa'/>"] joinString "",
    {KPLIB_force_redeploy = true;},
    nil,
    -720,
    false,
    true,
    "",
    "
        isNull (objectParent _originalTarget)
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < 20
            || {_originalTarget getVariable ['KPLIB_isNearMobRespawn', false]}
            || {_originalTarget getVariable ['KPLIB_isNearStart', false]}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Squad management
_player addAction [
    ["<t color='#80FF80'>", localize "STR_SQUAD_MANAGEMENT_ACTION", "</t><img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>"] joinString "",
    "scripts\client\ui\squad_management.sqf",
    nil,
    -730,
    false,
    true,
    "",
    "
        isNull (objectParent _originalTarget)
        && {alive _originalTarget}
        && {!((units group _originalTarget) isEqualTo [_originalTarget])}
        && {(leader group _originalTarget) isEqualTo _originalTarget}
        && {build_confirmed isEqualTo 0}
    "
];

// Arsenal
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_ARSENAL_ACTION", "</t><img size='2' image='res\ui_arsenal.paa'/>"] joinString "",
    "scripts\client\actions\open_arsenal.sqf",
    nil,
    -740,
    false,
    true,
    "",
    "
        isNull (objectParent _originalTarget)
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < 20
            || {_originalTarget getVariable ['KPLIB_isNearArsenal', false]}
            || {_originalTarget getVariable ['KPLIB_isNearMobRespawn', false]}
            || {_originalTarget getVariable ['KPLIB_isNearStart', false]}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Build
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_BUILD_ACTION", "</t><img size='2' image='res\ui_build.paa'/>"] joinString "",
    "scripts\client\build\open_build_menu.sqf",
    nil,
    -750,
    false,
    true,
    "",
    "
        isNull (objectParent _originalTarget)
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)}
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[3] call KPLIB_fnc_hasPermission}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Secondary missions
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_SECONDARY_OBJECTIVES", "</t>"] joinString "",
    "scripts\client\ui\secondary_ui.sqf",
    nil,
    -760,
    false,
    true,
    "",
    "
        isNull (objectParent _originalTarget)
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < 20
            || {_originalTarget getVariable ['KPLIB_isNearStart', false]}
        }
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[5] call KPLIB_fnc_hasPermission}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Build sector storage
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_SECSTORAGEBUILD_ACTION", "</t>"] joinString "",
    "scripts\client\build\do_sector_build.sqf",
    [KPLIB_b_smallStorage],
    -770,
    false,
    true,
    "",
    "
        !(_originalTarget getVariable ['KPLIB_nearProd', []] isEqualTo [])
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[3] call KPLIB_fnc_hasPermission}
        }
        && {(_originalTarget getVariable ['KPLIB_nearProd', []] select 3) isEqualTo []}
        && {build_confirmed isEqualTo 0}
    "
];

// Build supply facility
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_SECSUPPLYBUILD_ACTION", "</t>"] joinString "",
    "scripts\client\build\do_sector_build.sqf",
    ["supply"],
    -780,
    false,
    true,
    "",
    "
        !(_originalTarget getVariable ['KPLIB_nearProd', []] isEqualTo [])
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[3] call KPLIB_fnc_hasPermission}
        }
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []] select 3) isEqualTo [])}
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []]) select 4)}
        && {build_confirmed isEqualTo 0}
    "
];

// Build ammo facility
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_SECAMMOBUILD_ACTION", "</t>"] joinString "",
    "scripts\client\build\do_sector_build.sqf",
    ["ammo"],
    -790,
    false,
    true,
    "",
    "
        !(_originalTarget getVariable ['KPLIB_nearProd', []] isEqualTo [])
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[3] call KPLIB_fnc_hasPermission}
        }
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []] select 3) isEqualTo [])}
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []]) select 5)}
        && {build_confirmed isEqualTo 0}
    "
];

// Build fuel facility
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_SECFUELBUILD_ACTION", "</t>"] joinString "",
    "scripts\client\build\do_sector_build.sqf",
    ["fuel"],
    -800,
    false,
    true,
    "",
    "
        !(_originalTarget getVariable ['KPLIB_nearProd', []] isEqualTo [])
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {
            _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
            || {[3] call KPLIB_fnc_hasPermission}
        }
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []] select 3) isEqualTo [])}
        && {!((_originalTarget getVariable ['KPLIB_nearProd', []]) select 6)}
        && {build_confirmed isEqualTo 0}
    "
];

// Switch global/local resources
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_RESOURCE_GLOBAL_ACTION", "</t>"] joinString "",
    {KPLIB_resources_global = !KPLIB_resources_global},
    nil,
    -810,
    false,
    true,
    "",
    "
        alive _originalTarget
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)}
        && {build_confirmed isEqualTo 0}
    "
];

// Production
_player addAction [
    ["<t color='#FF8000'>", localize "STR_PRODUCTION_ACTION", "</t>"] joinString "",
    "scripts\client\commander\open_production.sqf",
    nil,
    -820,
    false,
    true,
    "",
    "
        _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {!(KPLIB_production isEqualTo [])}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)
            || {!(_originalTarget getVariable ['KPLIB_nearProd', []] isEqualTo [])}
        }
        && {build_confirmed isEqualTo 0}
    "
];

// Logistic
_player addAction [
    ["<t color='#FF8000'>", localize "STR_LOGISTIC_ACTION", "</t>"] joinString "",
    "scripts\client\commander\open_logistic.sqf",
    nil,
    -830,
    false,
    true,
    "",
    "
        KPLIB_param_logistic
        && {_originalTarget getVariable ['KPLIB_hasDirectAccess', false]}
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)}
        && {!(
            KPLIB_sectors_fob isEqualTo []
            || KPLIB_production isEqualTo []
        )}
        && {build_confirmed isEqualTo 0}
    "
];

// Permissions
_player addAction [
    ["<t color='#FF8000'>", localize "STR_COMMANDER_ACTION", "</t><img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>"] joinString "",
    "scripts\client\commander\open_permissions.sqf",
    nil,
    -840,
    false,
    true,
    "",
    "
        KPLIB_param_permissions
        && {_originalTarget getVariable ['KPLIB_hasDirectAccess', false]}
        && {alive _originalTarget}
        && {build_confirmed isEqualTo 0}
    "
];

// Reassign Zeus
if (player == ([] call KPLIB_fnc_getCommander)) then {
    _player addAction [
        ["<t color='#FF0000'>", localize "STR_REASSIGN_ZEUS", "</t>"] joinString "",
        {[] call KPLIB_fnc_requestZeus},
        nil,
        -870,
        false,
        true,
        "",
        "
            KPLIB_param_zeusCommander
            && alive _originalTarget
            && {isNull (_originalTarget getVariable ['KPLIB_ownedZeusModule', objNull])}
            && {build_confirmed isEqualTo 0}
        "
    ];
};

// Create small FOB clearance
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_CLEARANCE_ACTION", "</t>"] joinString "",
    {[player getVariable ["KPLIB_fobPos", [0, 0, 0]], KPLIB_range_fob * 0.4, true] call KPLIB_fnc_createClearanceConfirm;},
    nil,
    -850,
    false,
    true,
    "",
    "
        _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.4)}
        && {build_confirmed isEqualTo 0}
    "
];

// Create big FOB clearance
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_BIG_CLEARANCE_ACTION", "</t>"] joinString "",
    {[player getVariable ["KPLIB_fobPos", [0, 0, 0]], KPLIB_range_fob * 0.8, true] call KPLIB_fnc_createClearanceConfirm;},
    nil,
    -851,
    false,
    true,
    "",
    "
        _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)}
        && {build_confirmed isEqualTo 0}
    "
];

// Time Skip and Clear Fog
_player addAction [
    ["<t color='#0080FF'>", localize "STR_FOB_TW_ACTION_OPEN", "</t>"] joinString "",
    "scripts\client\actions\control_TimeWeather.sqf",
    nil,
    -855,
    false,
    true,
    "",
    "
        KPLIB_param_timeweather
        && _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.8)}
        && {build_confirmed isEqualTo 0}
    "
];

// Drop crate
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_ACTION_CRATE_DROP", "</t>"] joinString "",
    {
        params ["_player"];
        private _crate = _player getVariable ["KPLIB_carriedObject", objNull];

        // prevent players from putting crates inside vehicles
        private _crateSize = sizeOf typeOf _crate * 1.5;
        private _nearObjects = (_crate nearEntities [["Man", "Air", "Car", "Tank"], _crateSize]) - [_crate, _player];
        if (_nearObjects isNotEqualTo []) exitWith {
            hint format [localize "STR_PLACEMENT_IMPOSSIBLE", count _nearObjects, _crateSize toFixed 0];
        };

        _player setVariable ["KPLIB_carriedObject", nil];
        detach _crate;
        _crate awake true;
    },
    nil,
    -504,
    true,
    false,
    "",
    toString {
        alive _originalTarget &&
        build_confirmed == 0 && _this in _this && {!isNull (_this getVariable ["KPLIB_carriedObject", objNull])}
    }
];

// Full Heal
_player addAction [
    ["<t color='#80FF80'>", localize "STR_FULLHEAL_ACTION", "</t> <img size='2' image='res\ui_fullheal.paa'/>"] joinString "",
    {[player getVariable ["KPLIB_fobPos", [0, 0, 0]], KPLIB_range_fob * 0.9, player] call KPLIB_fnc_fullheal;},
    nil,
    -690,
    false,
    true,
    "",
    "
        KPLIB_param_fullHeal
        && KPLIB_medical_facilities_near
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (KPLIB_range_fob * 0.5)}
        && {build_confirmed isEqualTo 0}
    "
];

true
