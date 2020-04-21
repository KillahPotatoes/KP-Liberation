/*
    File: fn_createSuppModules.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-21
    Last Update: 2020-04-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Creates the A3 support framework modules.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (!isServer || KP_liberation_suppMod isEqualTo 0) exitWith {false};

["Creating modules", "SUPPORTMODULES"] call KPLIB_fnc_log;

// Create modules
private _grp = createGroup sideLogic;
KPLIB_suppMod_req = _grp createUnit ["SupportRequester", [0, 0, 0], [], 0, "NONE"];
KPLIB_suppMod_arty = _grp createUnit ["SupportProvider_Artillery", [0, 0, 0], [], 0, "NONE"];

// Set variables which are normally set via eden object attributes
{
    [KPLIB_suppMod_req, _x, -1] call BIS_fnc_limitSupport;
} forEach ["Artillery", "CAS_Heli", "CAS_Bombing", "UAV", "Drop", "Transport"];

// Publish global variables to clients
publicVariable "KPLIB_suppMod_req";
publicVariable "KPLIB_suppMod_arty";

// Delay provider init until save is loaded, to catch synchronized units from loaded save
[] spawn {
    waitUntil {!isNil "save_is_loaded" && {save_is_loaded}};
    ["Init provider on server", "SUPPORTMODULES"] call KPLIB_fnc_log;
    [KPLIB_suppMod_req] call BIS_fnc_moduleSupportsInitRequester;
    [KPLIB_suppMod_arty] call BIS_fnc_moduleSupportsInitProvider;

    // Hide the three HQ entities created at zero pos. BIS scripts only hides them local for the creator
    waitUntil {!isNil "BIS_SUPP_HQ_WEST" && !isNil "BIS_SUPP_HQ_EAST" && !isNil "BIS_SUPP_HQ_GUER"};
    {
        hideObjectGlobal _x;
    } forEach [BIS_SUPP_HQ_WEST, BIS_SUPP_HQ_EAST, BIS_SUPP_HQ_GUER]
};

true
