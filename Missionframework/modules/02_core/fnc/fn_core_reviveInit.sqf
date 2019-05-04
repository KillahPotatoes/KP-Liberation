/*
    KPLIB_fnc_core_reviveInit

    File: fn_core_reviveInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-02
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Initializes BIS revive module if ace medical is not present

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if(KPLIB_ace_medical || (KPLIB_param_reviveMode isEqualTo 0)) exitWith {
    ["Skipping BIS revive initialization!", "CORE"] call KPLIB_fnc_common_log;
};

if (!isDedicated && !isNil {player getVariable "bis_revive_ehHandleHeal"}) exitWith {
    ["BIS revive already initialized, skipping!", "CORE"] call KPLIB_fnc_common_log;
};

["Initializing BIS revive", "CORE"] call KPLIB_fnc_common_log;

KPLIB_param_reviveMode call BIS_fnc_paramReviveMode;
KPLIB_param_reviveDuration call BIS_fnc_paramReviveDuration;
KPLIB_param_reviveRequiredTrait call BIS_fnc_paramReviveRequiredTrait;
KPLIB_param_reviveMedicSpeedMultiplier call BIS_fnc_paramReviveMedicSpeedMultiplier;
KPLIB_param_reviveRequiredItems call BIS_fnc_paramReviveRequiredItems;
KPLIB_param_reviveUnconsciousStateMode call BIS_fnc_paramReviveUnconsciousStateMode;
KPLIB_param_reviveBleedOutDuration call BIS_fnc_paramReviveBleedOutDuration;
KPLIB_param_reviveForceRespawnDuration call BIS_fnc_paramReviveForceRespawnDuration;

// Initialize BIS revive
call BIS_fnc_reviveInit;

true
