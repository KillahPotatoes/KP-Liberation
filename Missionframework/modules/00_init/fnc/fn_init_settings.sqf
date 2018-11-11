/*
    KPLIB_fnc_init_settings

    File: fn_init_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-09
    Last Update: 2018-11-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/


/*
    ----- GENERAL SETTINGS -----
*/

// KPLIB_param_debug
// Enables/Disables extended Liberation debug output for the server log.
// Default: true
[
    "KPLIB_param_debug",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_GENERAL_DEBUG", localize "STR_KPLIB_SETTINGS_GENERAL_DEBUG_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_saveInterval
// Interval of periodic saves in seconds.
// Default: 60
[
    "KPLIB_param_saveInterval",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_GENERAL_SAVEINT", localize "STR_KPLIB_SETTINGS_GENERAL_SAVEINT_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    [30, 600, 60, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_sectorCap
// The amount of sectors which can be active at the same time.
// Default: 6
[
    "KPLIB_param_sectorCap",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_GENERAL_SECCAP", localize "STR_KPLIB_SETTINGS_GENERAL_SECCAP_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    [1, 12, 6, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_stamina
// Enables/Disables the BI stamina system. (doesn't affect ACE Advanced Fatigue)
// Default: true
[
    "KPLIB_param_stamina",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_GENERAL_STAMINA", localize "STR_KPLIB_SETTINGS_GENERAL_STAMINA_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_clearVehicleCargo
// Enables/Disables if spawned vehicles will have an empty cargo space.
// Default: true
[
    "KPLIB_param_clearVehicleCargo",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_GENERAL_CLEARCARGO", localize "STR_KPLIB_SETTINGS_GENERAL_CLEARCARGO_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_fobRange
// Build radius in meters around the FOB area center position.
// Default: 125 meters
[
    "KPLIB_param_fobRange",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_GENERAL_FOBRANGE", localize "STR_KPLIB_SETTINGS_GENERAL_FOBRANGE_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    [100, 250, 125, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_sectorActRange
// Radius in meters around the sector center to activate the sector.
// Default: 1200 meters
[
    "KPLIB_param_sectorActRange",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_GENERAL_SECACT", localize "STR_KPLIB_SETTINGS_GENERAL_SECACT_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    [600, 1800, 1200, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_sectorCapRange
// Radius in meters around the sector center a unit has to be to being able to capture the sector.
// Default: 150 meters
[
    "KPLIB_param_sectorCapRange",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_GENERAL_SECRANGE", localize "STR_KPLIB_SETTINGS_GENERAL_SECRANGE_TT"],
    localize "STR_KPLIB_SETTINGS_GENERAL",
    [100, 200, 150, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

/*
    ----- BI REVIVE SETTINGS -----
    Ref: https://community.bistudio.com/wiki/Arma_3_Revive
*/

// KPLIB_param_reviveMode
// Enables/Disables the BI Revive System. (Automatically disabled if using ACE medical)
// Default: Enabled
[
    "KPLIB_param_reviveMode",
    "LIST",
    [localize "STR_A3_ReviveMode", localize "STR_KPLIB_SETTINGS_REVIVE_MODE_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [
        [
            0,
            1
        ],
        [
            localize "STR_A3_Disabled",
            localize "STR_A3_EnabledForAllPlayers"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveDuration
// How long it takes to revive someone in seconds.
// Default: 6
[
    "KPLIB_param_reviveDuration",
    "LIST",
    [localize "STR_A3_ReviveDuration", localize "STR_KPLIB_SETTINGS_REVIVE_DURATION_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [[6, 8, 10, 12, 15, 20, 25, 30], ["6", "8", "10", "12", "15", "20", "25", "30"], 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveRequiredTrait
// Controls whether special training is required to revive someone.
// Default: 1
[
    "KPLIB_param_reviveRequiredTrait",
    "LIST",
    [localize "STR_A3_RequiredTrait", localize "STR_KPLIB_SETTINGS_REVIVE_REQTRAIT_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [
        [
            0,
            1
        ],
        [
            localize "STR_A3_None",
            localize "STR_A3_Medic"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveMedicSpeedMultiplier
// Decreases the time it takes for a Medic to revive someone.
// Default: 1x
[
    "KPLIB_param_reviveMedicSpeedMultiplier",
    "LIST",
    [localize "STR_A3_RequiredTrait_MedicSpeedMultiplier", localize "STR_KPLIB_SETTINGS_REVIVE_SPEEDMULT_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [[1, 1.5, 2, 2.5, 3], ["1x", "1.5x", "2x", "2.5x", "3x"], 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveRequiredItems
// Controls whether any items are required to revive someone.
// Default: Medikit
[
    "KPLIB_param_reviveRequiredItems",
    "LIST",
    [localize "STR_A3_RequiredItems", localize "STR_KPLIB_SETTINGS_REVIVE_REQITEM_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [
        [
            0,
            1,
            2
        ],
        [
            localize "STR_A3_None",
            localize "STR_A3_Medikit",
            localize "STR_A3_FirstAidKitOrMedikit"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveUnconsciousStateMode
// How deep is the simulation of damage and incapacitation.
// Default: Basic
[
    "KPLIB_param_reviveUnconsciousStateMode",
    "LIST",
    [localize "STR_A3_IncapacitationMode", localize "STR_KPLIB_SETTINGS_REVIVE_INCAPMODE_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [
        [
            0,
            1,
            2
        ],
        [
            localize "STR_A3_Basic",
            localize "STR_A3_Advanced",
            localize "STR_A3_Realistic"
        ],
        0
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveBleedOutDuration
// How long it takes to bleed out in seconds when incapacitated.
// Default: 180 seconds
[
    "KPLIB_param_reviveBleedOutDuration",
    "LIST",
    [localize "STR_A3_BleedOutDuration", localize "STR_KPLIB_SETTINGS_REVIVE_BLEEDOUT_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [[10, 15, 20, 30, 45, 60, 90, 180], ["10", "15", "20", "30", "45", "60", "90", "180"], 7],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_reviveForceRespawnDuration
// How long it takes players in seconds to force their respawn.
// Default: 10 seconds
[
    "KPLIB_param_reviveForceRespawnDuration",
    "LIST",
    [localize "STR_A3_ForceRespawnDuration", localize "STR_KPLIB_SETTINGS_REVIVE_RESPAWN_TT"],
    localize "STR_KPLIB_SETTINGS_REVIVE",
    [[3, 4, 5, 6, 7, 8, 9, 10], ["3", "4", "5", "6", "7", "8", "9", "10"], 7],
    1,
    {}
] call CBA_Settings_fnc_init;


/*
    ----- PRESET SETTINGS -----
*/

// KPLIB_param_presetArsenal
// Selection between the arsenal presets, blacklist method or unrestricted arsenal access.
// Default: Blacklist Method
[
    "KPLIB_param_presetArsenal",
    "LIST",
    [localize "STR_KPLIB_SETTINGS_PRESET_ARSENAL", localize "STR_KPLIB_SETTINGS_PRESET_ARSENAL_TT"],
    localize "STR_KPLIB_SETTINGS_PRESET",
    [
        [
            0,
            1,
            2
        ],
        [
            localize "STR_KPLIB_SETTINGS_PRESET_ARSENAL_0",
            localize "STR_KPLIB_SETTINGS_PRESET_ARSENAL_1",
            localize "STR_KPLIB_SETTINGS_PRESET_ARSENAL_2"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_presetPlayer
// Selection for the units, vehicles, etc. for the player side.
// Default: Custom Preset
[
    "KPLIB_param_presetPlayer",
    "LIST",
    [localize "STR_KPLIB_SETTINGS_PRESET_PLAYER", localize "STR_KPLIB_SETTINGS_PRESET_PLAYER_TT"],
    localize "STR_KPLIB_SETTINGS_PRESET",
    [
        [
            0
        ],
        [
            localize "STR_KPLIB_SETTINGS_PRESET_PLAYER_0"
        ],
        0
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_presetEnemy
// Selection for the units, vehicles, etc. for the enemy side.
// Default: Custom Preset
[
    "KPLIB_param_presetEnemy",
    "LIST",
    [localize "STR_KPLIB_SETTINGS_PRESET_ENEMY", localize "STR_KPLIB_SETTINGS_PRESET_ENEMY_TT"],
    localize "STR_KPLIB_SETTINGS_PRESET",
    [
        [
            0
        ],
        [
            localize "STR_KPLIB_SETTINGS_PRESET_ENEMY_0"
        ],
        0
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_presetResistance
// Selection for the units, vehicles, etc. for the resistance side.
// Default: Custom Preset
[
    "KPLIB_param_presetResistance",
    "LIST",
    [localize "STR_KPLIB_SETTINGS_PRESET_RESIS", localize "STR_KPLIB_SETTINGS_PRESET_RESIS_TT"],
    localize "STR_KPLIB_SETTINGS_PRESET",
    [
        [
            0
        ],
        [
            localize "STR_KPLIB_SETTINGS_PRESET_RESIS_0"
        ],
        0
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_presetCivilian
// Selection for the units, vehicles, etc. for the civilian side.
// Default: Custom Preset
[
    "KPLIB_param_presetCivilian",
    "LIST",
    [localize "STR_KPLIB_SETTINGS_PRESET_CIV", localize "STR_KPLIB_SETTINGS_PRESET_CIV_TT"],
    localize "STR_KPLIB_SETTINGS_PRESET",
    [
        [
            0
        ],
        [
            localize "STR_KPLIB_SETTINGS_PRESET_CIV_0"
        ],
        0
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

true
