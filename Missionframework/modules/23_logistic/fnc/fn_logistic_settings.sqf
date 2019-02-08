/*
    KPLIB_fnc_logistic_settings

    File: fn_logistic_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-28
    Last Update: 2019-02-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// KPLIB_param_recycleFactor
// Defines the resource refund from vehicle recycling.
// Default: 50
[
    "KPLIB_param_recycleFactor",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_FACTOR", localize "STR_KPLIB_SETTINGS_RECYCLE_FACTOR_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    [0, 100, 50, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_damageInfluence
// Enables/Disables the influence of vehicle damage to the refunded resources on recycling.
// Default: true
[
    "KPLIB_param_damageInfluence",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_DAMAGE", localize "STR_KPLIB_SETTINGS_RECYCLE_DAMAGE_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_ammoInfluence
// Enables/Disables the influence of vehicle ammo to the refunded resources on recycling.
// Default: true
[
    "KPLIB_param_ammoInfluence",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_AMMOSTATE", localize "STR_KPLIB_SETTINGS_RECYCLE_AMMOSTATE_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_fuelInfluence
// Enables/Disables the influence of vehicle fuel to the refunded resources on recycling.
// Default: true
[
    "KPLIB_param_fuelInfluence",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_FUELSTATE", localize "STR_KPLIB_SETTINGS_RECYCLE_FUELSTATE_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_refundSupply
// Defines the supply refund from vehicles without defined costs.
// Default: 100
[
    "KPLIB_param_refundSupply",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_SUPPLY", localize "STR_KPLIB_SETTINGS_RECYCLE_SUPPLY_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    [0, 1000, 100, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_refundAmmo
// Defines the ammo refund from vehicles without defined costs.
// Default: 50
[
    "KPLIB_param_refundAmmo",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_AMMO", localize "STR_KPLIB_SETTINGS_RECYCLE_AMMO_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    [0, 1000, 50, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_refundFuel
// Defines the fuel refund from vehicles without defined costs.
// Default: 50
[
    "KPLIB_param_refundFuel",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_FUEL", localize "STR_KPLIB_SETTINGS_RECYCLE_FUEL_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    [0, 1000, 50, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

true
