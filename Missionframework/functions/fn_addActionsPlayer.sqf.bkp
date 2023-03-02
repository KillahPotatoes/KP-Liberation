/*
    File: fn_addActionsPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-13
    Last Update: 2020-08-07
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

if (isNil "KP_liberation_resources_global") then {KP_liberation_resources_global = false;};

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
        GRLIB_halo_param > 0
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
    {GRLIB_force_redeploy = true;},
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
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (GRLIB_fob_range * 0.8)}
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
    [KP_liberation_small_storage_building],
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
    {KP_liberation_resources_global = !KP_liberation_resources_global},
    nil,
    -810,
    false,
    true,
    "",
    "
        alive _originalTarget
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (GRLIB_fob_range * 0.8)}
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
        && {!(KP_liberation_production isEqualTo [])}
        && {
            _originalTarget getVariable ['KPLIB_fobDist', 99999] < (GRLIB_fob_range * 0.8)
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
        KP_liberation_ailogistics
        && {_originalTarget getVariable ['KPLIB_hasDirectAccess', false]}
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (GRLIB_fob_range * 0.8)}
        && {!(
            GRLIB_all_fobs isEqualTo []
            || KP_liberation_production isEqualTo []
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
        GRLIB_permissions_param
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
            alive _originalTarget
            && {isNull (_originalTarget getVariable ['KPLIB_ownedZeusModule', objNull])}
            && {build_confirmed isEqualTo 0}
        "
    ];
};

// Create FOB clearance
_player addAction [
    ["<t color='#FFFF00'>", localize "STR_CLEARANCE_ACTION", "</t>"] joinString "",
    {[player getVariable ["KPLIB_fobPos", [0, 0, 0]], GRLIB_fob_range * 0.9, true] call KPLIB_fnc_createClearanceConfirm;},
    nil,
    -850,
    false,
    true,
    "",
    "
        _originalTarget getVariable ['KPLIB_hasDirectAccess', false]
        && {isNull (objectParent _originalTarget)}
        && {alive _originalTarget}
        && {_originalTarget getVariable ['KPLIB_fobDist', 99999] < (GRLIB_fob_range * 0.8)}
        && {build_confirmed isEqualTo 0}
    "
];

true
